import argparse
from pathlib import Path

import pandas as pd

from data.data_loader import load_audio
from utils import config_logger


def combine_datasets(data_dir, tag, dataset_config, sample_rate=22050):
    logger = config_logger('combine_datasets', console_level='INFO')

    if not isinstance(data_dir, Path):
        data_dir = Path(data_dir)

    # Label file must be the same. Just make a copy and rename.
    labels_path = [
        i for i in data_dir.rglob(f'*{dataset_config}/labels*.json')
    ][0]
    outpath = data_dir / f'labels_{tag}_{dataset_config}.json'
    logger.info(f'Saving encoder labels to {outpath}')
    outpath.write_text(labels_path.read_text())

    dataset_partitions = ['test', 'train', 'val']
    extension = 'csv'
    for dataset_partition in dataset_partitions:
        logger.info(
            f'Looking for partition {dataset_partition} from configuration {dataset_config}.'
        )
        all_filenames = [
            i for i in data_dir.rglob(
                f'*{dataset_config}/{dataset_partition}*.{extension}')
        ]
        logger.info(f'Found {len(all_filenames)} files.')

        # combine all files in the list
        combined_csv = pd.concat([
            pd.read_csv(f, header=None).assign(filename=f.name)
            for f in all_filenames
        ]).rename(columns={
            0: "audio",
            1: "seq"
        })
        logger.info(combined_csv.groupby('filename')['audio'].count())
        logger.info(
            f"Combined partition {dataset_partition}: {combined_csv['audio'].count()} samples."
        )

        durations = []
        total_duration = 0
        audio_errors = 0
        for audio_file in combined_csv['audio'].tolist():
            try:
                y = load_audio(str(audio_file))
                duration = len(y) / sample_rate
            except Exception as e:
                logger.exception(
                    f"Exception while loading {audio_file} audio. Reason: {e}")
                audio_errors += 1
                duration = 0
                continue
            durations.append(duration)

        combined_csv = combined_csv.assign(duration=durations)
        # SortaGrad
        combined_csv = combined_csv.sort_values(by='duration')

        total_duration = combined_csv['duration'].sum()
        logger.info(f'Total duration: {total_duration/60/60} hours.')
        logger.info(f'Found {audio_errors} errors during loading.')

        # export to csv
        outpath = data_dir / f'{dataset_partition}_{tag}_{dataset_config}.{extension}'
        logger.info(f'Saving to {outpath}')
        combined_csv.drop(['filename', 'duration'],
                          axis=1).to_csv(outpath,
                                         index=False,
                                         header=False,
                                         encoding='iso-8859-1')


if __name__ == '__main__':
    # Arguments parsing.
    parser = argparse.ArgumentParser(description='Combine datasets')
    parser.add_argument('-d',
                        '--data-dir',
                        metavar='DIR',
                        help='path to data',
                        required=True)
    parser.add_argument('-id',
                        '--id',
                        help='Id tag',
                        required=True)
    parser.add_argument(
        '-le',
        '--label-encoder',
        type=str,
        default='multi',
        choices=['simple', 'multi', 'multi_ext', 'multi2', 'multi2_ext'],
        help="Type of encoder that was used. Choose from 'simple', 'multi', "
        "'multi_ext', 'multi2', 'multi2_ext'. Use multichar labels to reduce sequence size"
    )
    parser.add_argument(
        '-rs',
        '--remove-splits',
        action="store_true",
        default=False,
        help="If --remove-splits was used or not when preparing the data")
    args = parser.parse_args()

    data_dir = Path(args.data_dir)
    dataset_config = f'{args.label_encoder}{"_splits" if not args.remove_splits else ""}'
    combine_datasets(data_dir, args.id, dataset_config)
