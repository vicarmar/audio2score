import argparse
import csv
import os
from datetime import datetime
from pathlib import Path

import torch
from tqdm import tqdm

from data.data_loader import (AudioDataLoader, BucketingSampler,
                              SpectrogramDataset)
from utils import (LabelDecoder, calculate_cer, calculate_ler, calculate_wer,
                   config_logger, load_model)

parser = argparse.ArgumentParser(description='DeepSpeech transcription')
parser.add_argument('--cuda',
                    action="store_true",
                    help='Use cuda to test model')
parser.add_argument('--model-path',
                    default='models/model_default.pth',
                    help='Path to model file created by training')
parser.add_argument('--test-manifest',
                    metavar='DIR',
                    help='path to validation manifest csv',
                    default='data/test_manifest.csv')
parser.add_argument('--batch-size',
                    default=20,
                    type=int,
                    help='Batch size for training')
parser.add_argument('--num-workers',
                    default=4,
                    type=int,
                    help='Number of workers used in dataloading')
parser.add_argument(
    '--verbose',
    action="store_true",
    help="logger.info out decoded output and error of each sample")
parser.add_argument('--output-path',
                    default=None,
                    type=str,
                    help="Where to save raw acoustic output")
args = parser.parse_args()

if __name__ == '__main__':
    save_folder = os.path.dirname(args.model_path)
    manifest_name = '_'.join([*Path(args.test_manifest).parts[-2:]])
    test_job = f"test_{manifest_name}_{Path(args.model_path).with_suffix('.log').name}"
    log_file = f'{save_folder}/{datetime.now().strftime("%Y%m%d-%H%M%S")}_{test_job}'
    logger = config_logger('test', log_file=log_file, console_level='ERROR')

    torch.set_grad_enabled(False)
    model, _ = load_model(args.model_path)
    device = torch.device("cuda" if args.cuda else "cpu")
    label_decoder = LabelDecoder(model.labels)
    model.eval()
    model = model.to(device)

    test_dataset = SpectrogramDataset(audio_conf=model.audio_conf,
                                      manifest_filepath=args.test_manifest,
                                      labels=model.labels)
    test_sampler = BucketingSampler(test_dataset, batch_size=args.batch_size)
    test_loader = AudioDataLoader(test_dataset,
                                  batch_sampler=test_sampler,
                                  num_workers=args.num_workers)
    test_sampler.shuffle(1)

    total_wer, total_cer, total_ler, num_words, num_chars, num_labels = 0, 0, 0, 0, 0, 0
    output_data = []

    for i, (data) in tqdm(enumerate(test_loader),
                          total=len(test_loader),
                          ascii=True):
        inputs, targets, input_sizes, target_sizes, filenames = data
        inputs = inputs.to(device)
        input_sizes = input_sizes.to(device)
        outputs = model.transcribe(inputs, input_sizes)

        for i, target in enumerate(targets):
            # Avoid decoding the target, but load original uncoded krnseq.
            # This allows to use different datasets that could be encoded with
            # a different label encoder than the current one used by the model.
            # reference = label_decoder.decode(target[:target_sizes[i]].tolist())
            krnseq_path = Path(filenames[i]).with_suffix('.krnseq')
            with open(krnseq_path, 'r') as krnseq_file:
                reference = krnseq_file.read()
            transcript = label_decoder.decode(outputs[i])
            wer, trans_words, ref_words = calculate_wer(
                transcript, reference, '\t')
            cer, trans_chars, ref_chars = calculate_cer(
                transcript, reference, '\t')
            ler, trans_labels, ref_labels = calculate_ler(
                transcript, reference)
            total_wer += wer
            num_words += ref_words
            total_cer += cer
            num_chars += ref_chars
            total_ler += ler
            num_labels += ref_labels

            if args.verbose:
                logger.info(f"File: {filenames[i]}")
                logger.info(f"WER: {float(wer) / ref_words}")
                logger.info(f"CER: {float(cer) / ref_chars}")
                logger.info(f"LER: {float(ler) / ref_labels}")
                logger.info(
                    "\n===================================== \nREFERENCE:")
                logger.info(f'\n{reference}')
                logger.info(
                    "\n===================================== \nHYPOTHESIS:")
                logger.info(f'\n{transcript}')
                logger.info("")

    wer = 100 * float(total_wer) / num_words
    cer = 100 * float(total_cer) / num_chars
    ler = 100 * float(total_ler) / num_labels

    logger.info(
        f'Test Summary \tAverage WER {wer:.3f}\tAverage CER {cer:.3f}\tAverage LER {ler:.3f}'
    )

    model_id = Path(args.model_path).name
    results_path = f'{save_folder}/test_results.csv'
    file_exists = os.path.isfile(results_path)
    with open(results_path, 'a') as resfile:
        wr = csv.writer(resfile)
        if not file_exists:
            wr.writerow(['Dataset', 'Model', 'WER', 'CER', 'LER'])
        wr.writerow([
            manifest_name, model_id, f'{wer:.3f}', f'{cer:.3f}', f'{ler:.3f}'
        ])
