import json
import configparser
from tqdm import tqdm

from data.data_loader import SpectrogramDataset, BucketingSampler, AudioDataLoader

test_manifest = '../datasets/prep/sonatas/test_sonatas_multi2_ext_splits.csv'
labels_json = '../datasets/prep/sonatas/labels_sonatas_multi2_ext_splits.json'

# test_manifest = '../datasets/prep/quartets/quartets_multi_ext_splits/test_quartets.csv'
# labels_json = '../datasets/prep/quartets/quartets_multi_ext_splits/labels_quartets.json'

config_path = './configs/quartets.cfg'

with open(labels_json) as fh:
    labels = json.load(fh)

config = configparser.ConfigParser()
config.read(config_path)
audio_conf = config['audio']

with open(test_manifest) as f:
    ids = f.readlines()
print(f'PATH:{ids[0]}')

test_dataset = SpectrogramDataset(audio_conf=audio_conf,
                                  manifest_filepath=test_manifest,
                                  labels=labels)
test_sampler = BucketingSampler(test_dataset, batch_size=16)
test_loader = AudioDataLoader(test_dataset,
                              batch_sampler=test_sampler,
                              num_workers=4)

for i, (data) in tqdm(enumerate(test_loader),
                      total=len(test_loader),
                      ascii=True):
    inputs, targets, input_sizes, target_sizes, filenames = data
    print(filenames)
