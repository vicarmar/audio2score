import argparse
import csv
import json
import logging
import multiprocessing as mp
import os
import pickle
import subprocess
import sys
from datetime import datetime
from pathlib import Path

import numpy as np
from sklearn.model_selection import train_test_split
from tqdm import tqdm

from audio2score.data.data_loader import load_audio
from audio2score.data.humdrum import Kern, Labels, LabelsMultiple, LabelsSingle
from audio2score.utils import config_logger, parseList, parseIntList


def process_sample(q, samples, args, labels, invalid_counters):
    logger = logging.getLogger('data_prep')
    while True:
        score_path = q.get()
        if score_path is None:
            break

        # Errors counters, for debug.
        # Per file:
        clean_errors = 0
        split_errors = 0
        # Per chunk:
        tiefix_errors = 0
        hum2mid_errors = 0
        audio_errors = 0
        krnseq_errors = 0
        double_symbol_errors = 0
        encoding_errors = 0
        length_errors = 0

        # Remove grace notes, ornaments, etc...
        kern = Kern(Path(args.data_dir) / score_path,
                    constrained=args.constrained)
        if args.instruments is not None:
            kern.spines.override_instruments(args.instruments)

        try:
            if not kern.clean():
                logger.error(f'Cannot clean kern {score_path}')
                clean_errors += 1
                continue
        except Exception as e:
            logger.exception(
                f"Exception while cleaning {score_path} audio. Reason: {e}")
            clean_errors += 1
            continue

        root_path = Path(args.out_dir) / score_path.parent
        root_path.mkdir(parents=True, exist_ok=True)

        krn_path = (Path(args.out_dir) / score_path).resolve()
        krn_path_clean = krn_path.with_suffix('.clean.krn')
        kern.save(krn_path_clean)

        # Set seed to ensure same chunk sizes and tempo scaling
        np.random.seed(bytearray(score_path.name, 'utf-8'))

        try:
            kern_chunks = kern.split(args.chunk_sizes, args.train_stride)
        except Exception as e:
            logger.exception(f'Exception {e} while splitting {score_path}')
            split_errors += 1
            continue

        # random scale between +ts and -ts
        ts = 1 + args.tempo_scaling * (2 * np.random.rand(len(kern_chunks)) -
                                       1)
        for i, kern in enumerate(kern_chunks):
            chunk_path = krn_path.with_suffix(f'.{i:03d}.krn')
            kern.save(chunk_path)

            # Fix ties with tiefix command
            process = subprocess.run(['tiefix', chunk_path],
                                     capture_output=True,
                                     encoding='iso-8859-1')
            if (process.returncode != 0):
                logger.error(
                    f"tiefix error={process.returncode} on {chunk_path}")
                logger.error(process.stdout)
                tiefix_errors += 1
                continue

            kern = Kern(data=process.stdout, constrained=args.constrained)
            kern.save(chunk_path)

            audio_path = chunk_path.with_suffix('.flac')

            if args.resynthesize or not audio_path.exists():
                mid_path = chunk_path.with_suffix('.mid')
                # Tempo and instrumment extracted from *MM and *I indications
                status = os.system(
                    f'hum2mid {str(chunk_path)} -C -v 100 -t {ts[i]} -o {str(mid_path)} >/dev/null 2>&1'  # noqa E501
                )
                if (os.WEXITSTATUS(status) != 0):
                    logger.error(f"hum2mid error={status} on {chunk_path}")
                    hum2mid_errors += 1
                    continue

                status = os.system(
                    f'fluidsynth --sample-rate={args.sample_rate} -O s16 -T raw -i -l -F - {args.soundfont} {str(mid_path)} | '  # noqa E501
                    f'ffmpeg -y -f s16le -ar {args.sample_rate} -ac 2 -i pipe: '  # noqa E501
                    f'-ar {args.sample_rate} -ac 1 -ab {args.bit_rate} -strict -2 {str(audio_path)} 2>/dev/null'  # noqa E501
                )

            try:
                y = load_audio(str(audio_path))
            except Exception as e:
                logger.exception(
                    f"Exception while loading {chunk_path} audio. Reason: {e}")
                audio_errors += 1
                continue

            duration = len(y) / args.sample_rate

            try:
                krnseq = kern.tosequence()
            except Exception as e:
                logger.exception(f"Discarded {chunk_path} due to error in kern"
                                 f" sequence conversion. Reason {e}")
                krnseq_errors += 1
                continue

            if krnseq is None:
                logger.warning(
                    f"Discarded {chunk_path} for double dots/sharps/flats")
                double_symbol_errors += 1
                continue

            try:
                seq = labels.encode(krnseq)
            except Exception as e:
                logger.warning(f"Discarded {chunk_path} during label encoding."
                               f" Reason: {e}")
                encoding_errors += 1
                continue

            seqlen = labels.ctclen(seq)

            krnseq_path = chunk_path.with_suffix('.krnseq')
            krnseq_path.write_text(krnseq)

            seq_path = chunk_path.with_suffix('.seq')
            with seq_path.open(mode="wb") as f:
                f.write(pickle.dumps(seq))

            if duration > args.max_duration or \
                    duration < seqlen * args.min_duration_symbol:
                logger.warning(f"Sequence too long in {chunk_path} "
                               f"len={seqlen} duration={duration:.2f}")
                length_errors += 1
                continue

            samples.append([str(audio_path), str(seq_path), duration])

        invalid_counters['clean_errors'].append(clean_errors)
        invalid_counters['split_errors'].append(split_errors)
        invalid_counters['tiefix_errors'].append(tiefix_errors)
        invalid_counters['hum2mid_errors'].append(hum2mid_errors)
        invalid_counters['audio_errors'].append(audio_errors)
        invalid_counters['krnseq_errors'].append(krnseq_errors)
        invalid_counters['double_symbol_errors'].append(double_symbol_errors)
        invalid_counters['encoding_errors'].append(encoding_errors)
        invalid_counters['length_errors'].append(length_errors)


def process_scores(scores, args, labels):
    logger = logging.getLogger('data_prep')

    manager = mp.Manager()
    samples = manager.list()
    invalid_counters = manager.dict()
    invalid_counters['clean_errors'] = manager.list()
    invalid_counters['split_errors'] = manager.list()
    invalid_counters['tiefix_errors'] = manager.list()
    invalid_counters['hum2mid_errors'] = manager.list()
    invalid_counters['audio_errors'] = manager.list()
    invalid_counters['krnseq_errors'] = manager.list()
    invalid_counters['double_symbol_errors'] = manager.list()
    invalid_counters['encoding_errors'] = manager.list()
    invalid_counters['length_errors'] = manager.list()

    q = mp.Queue(maxsize=args.num_workers)
    pool = mp.Pool(args.num_workers,
                   initializer=process_sample,
                   initargs=(q, samples, args, labels, invalid_counters))
    for score in tqdm(scores, ascii=True):
        if score.is_symlink():
            continue
        q.put(score)
    # stop workers
    for i in range(args.num_workers):
        q.put(None)
    pool.close()
    pool.join()

    x = np.array([x[0] for x in samples])
    y = np.array([x[1] for x in samples])
    durations = np.array([x[2] for x in samples])

    # SortaGrad
    sorted_indexes = np.argsort(durations)
    x = x[sorted_indexes]
    y = y[sorted_indexes]

    logger.warning('Errors during processing:')
    for key, counters_list in invalid_counters.items():
        logger.warning(f'\t{key}: {sum(counters_list)}')

    return x, y, np.sum(durations)


def main_quartets():
    main(instruments='cello,viola,violn,flt')


def main(instruments='piano'):
    # Arguments parsing.
    parser = argparse.ArgumentParser(
        description='Dataset preparation',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--data-dir',
                        metavar='DIR',
                        help='path to data',
                        required=True)
    parser.add_argument('--out-dir',
                        metavar='DIR',
                        help='path to output',
                        required=True)
    parser.add_argument('--id',
                        default='manifest',
                        help='Id of output manifest and label files')
    parser.add_argument('--min-duration-symbol',
                        type=float,
                        default=0.01161,
                        help='Select the minimum duration per symbol',
                        required=False)
    parser.add_argument(
        '--max-duration',
        type=float,
        default=30.0,
        help='Select maximum duration of audio input files in seconds',
        required=False)
    parser.add_argument('--num-workers',
                        default=8,
                        type=int,
                        help='Number of workers used in data preparation')
    parser.add_argument('--sample-rate',
                        type=int,
                        help='Select sampling frequency of WAV files',
                        default=22050)
    parser.add_argument('--bit-rate',
                        type=int,
                        help='Select bit rate of MP4 audio files',
                        default=128000)
    parser.add_argument('--soundfont',
                        metavar='FILE',
                        help='path to soundfont',
                        default='/usr/share/sounds/sf2/FluidR3_GM.sf2')
    parser.add_argument('--resynthesize',
                        dest='resynthesize',
                        action='store_true',
                        default=False,
                        help='Resynthesize audio from midi')
    parser.add_argument('--instruments',
                        type=parseList,
                        help='Override kern defined intruments',
                        default=instruments)
    parser.add_argument('--tempo-scaling',
                        type=float,
                        default=0.06,
                        help='Select tempo random scaling')
    parser.add_argument('--chunk-sizes',
                        type=parseIntList,
                        help='Select chunk sizes separated by commas',
                        default=[3, 4, 5, 6])
    parser.add_argument('--test-split',
                        type=float,
                        default=0.3,
                        help='Select train-test split ratio')
    parser.add_argument(
        '--train-stride',
        type=int,
        help='Select the stride of overlapped training samples',
        default=1)
    parser.add_argument(
        '--label-encoder',
        type=str,
        default='single_ext',
        choices=['simple', 'multi', 'multi_ext', 'single', 'single_ext'],
        help="Type of encoder that was used. Choose from 'simple', 'multi', "
        "'multi_ext', 'single', 'single_ext'. Use single symbol labels to reduce sequence size"
    )
    parser.add_argument('--constrained',
                        action="store_true",
                        default=False,
                        help="Clean splits and chords during kern cleaning")
    args = parser.parse_args()
    prepare(args)


def prepare(args):
    data_prep_job = f'{args.id}_{args.label_encoder}{"_unconstrained" if not args.constrained else ""}'  # noqa E501
    outdir = Path(args.out_dir) / data_prep_job
    outdir.mkdir(parents=True, exist_ok=True)
    args.out_dir = str(outdir)

    # Logging config.
    log_file = outdir / f'{datetime.now().strftime("%Y%m%d-%H%M%S")}_{data_prep_job}.log'  # noqa E501
    logger = config_logger('data_prep', console_level='ERROR', log_file=log_file)

    # Main execution.
    logger.info("Preprocessing humdrum data...")
    root = Path(args.data_dir)
    scores = sorted([x.relative_to(root) for x in root.rglob('*.krn')])

    logger.info("Spliting train/test samples...")
    scores_train, scores_test = train_test_split(scores,
                                                 test_size=args.test_split,
                                                 random_state=45)

    middle = round(len(scores_test) /
                   2)  # Favor validation if number of samples is odd
    scores_val = scores_test[:middle]
    scores_test = scores_test[middle:]

    if args.label_encoder == 'simple':
        labels = Labels()
    elif args.label_encoder == 'multi':
        labels = LabelsMultiple()
    elif args.label_encoder == 'multi_ext':
        labels = LabelsMultiple(extended=True)
    elif args.label_encoder == 'single':
        labels = LabelsSingle()
    elif args.label_encoder == 'single_ext':
        labels = LabelsSingle(extended=True)
    else:
        raise ValueError('Unknown label encoder type.')

    logger.info("Processing training samples:")
    x_train, y_train, train_dur = process_scores(scores_train, args, labels)

    # Force no overlap for validation and test samples
    args.train_stride = None

    logger.info("Processing validation samples:")
    x_val, y_val, val_dur = process_scores(scores_val, args, labels)

    logger.info("Processing test samples:")
    x_test, y_test, test_dur = process_scores(scores_test, args, labels)

    logger.info("Number of train samples: {} ({:.2f} hours)".format(
        len(x_train), train_dur / 3600))
    logger.info("Number of validation samples: {} ({:.2f} hours)".format(
        len(x_val), val_dur / 3600))
    logger.info("Number of test samples: {} ({:.2f} hours)".format(
        len(x_test), test_dur / 3600))
    total_samples = len(x_train) + len(x_val) + len(x_test)
    total_dur = train_dur + val_dur + test_dur
    logger.info("Total samples: {} ({:.2f} hours)".format(
        total_samples, total_dur / 3600))

    train_manifest_path = outdir / Path(f'train_{args.id}.csv')
    val_manifest_path = outdir / Path(f'val_{args.id}.csv')
    test_manifest_path = outdir / Path(f'test_{args.id}.csv')
    labels_path = outdir / Path(f'labels_{args.id}.json')

    with train_manifest_path.open(mode='w') as csvfile:
        writer = csv.writer(csvfile)
        logger.info(f"Creating train manifest {train_manifest_path}...")
        for x, y in zip(x_train, y_train):
            writer.writerow([x, y])

    with val_manifest_path.open(mode='w') as csvfile:
        writer = csv.writer(csvfile)
        logger.info(f"Creating val manifest {val_manifest_path}...")
        for x, y in zip(x_val, y_val):
            writer.writerow([x, y])

    with test_manifest_path.open(mode='w') as csvfile:
        writer = csv.writer(csvfile)
        logger.info(f"Creating test manifest {test_manifest_path}...")
        for x, y in zip(x_test, y_test):
            writer.writerow([x, y])

    logger.info("Creating label JSON file with {} symbols".format(
        len(labels.labels)))
    with labels_path.open(mode='w') as jsonfile:
        json.dump(labels.labels, jsonfile)

    sys.exit(0)


if __name__ == '__main__':
    main()
