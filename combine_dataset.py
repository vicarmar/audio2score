import argparse
from pathlib import Path

import pandas as pd

from utils import config_logger


def combine_datasets(data_dir, dataset_config):
    logger = config_logger('combine_datasets', console_level='INFO')

    if not isinstance(data_dir, Path):
        data_dir = Path(data_dir)

    group = data_dir.name

    # Label file must be the same. Just make a copy and rename.
    labels_path = [
        i for i in data_dir.rglob(f'*{dataset_config}/labels*.json')
    ][0]
    outpath = data_dir / f'labels_{group}_{dataset_config}.json'
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
        ])
        logger.info(combined_csv.groupby('filename')[0].count())
        logger.info(
            f'Combined partition {dataset_partition}: {combined_csv[0].count()}'
        )

        # export to csv
        outpath = data_dir / f'{dataset_partition}_{group}_{dataset_config}.{extension}'
        logger.info(f'Saving to {outpath}')
        combined_csv.drop('filename', axis=1).to_csv(outpath,
                                                     index=False,
                                                     header=False,
                                                     encoding='utf-8-sig')


if __name__ == '__main__':
    # Arguments parsing.
    parser = argparse.ArgumentParser(description='Combine datasets')
    parser.add_argument('-d',
                        '--data-dir',
                        metavar='DIR',
                        help='path to data',
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
    combine_datasets(data_dir, dataset_config)
