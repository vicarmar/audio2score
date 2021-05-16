# audio2score

Implementation of audio-to-score task, as supplementary material for review of 
"COMPACT OUTPUT REPRESENTATIONS FOR UNCONSTRAINEDPOLYPHONIC AUDIO-TO-SCORE MUSIC TRANSCRIPTION"

The neural network architecture is based on [DeepSpeech2](https://arxiv.org/abs/1512.02595).

## Installation

Tested on Ubuntu Server 20.04, with python 3.8.

1. Install Ubuntu dependencies.
```
sudo apt-get update \
&& apt-get -y install nano sox libsox-dev libsox-fmt-all fluidsynth ffmpeg \
&& rm -rf /var/lib/apt/lists/*
```

2. Install NVIDIA apex, if not already available:
```
git clone --recursive https://github.com/NVIDIA/apex.git
cd apex && pip install .
```

3. Install python dependencies.
```
pip install numpy scikit-learn pandas tqdm cython cffi python-levenshtein librosa madmom
```

4. Install pytorch and pytorch audio, from last stable, support for cuda111.
```
pip install torch==1.8.0+cu111 torchaudio==0.8.0 -f https://download.pytorch.org/whl/torch_stable.html
```

5. Install Humdrum extras from source and build it, and add them to $PATH.
```
git clone https://github.com/humdrum-tools/humextra.git
cd humextra && make library && make hum2mid && make tiefix
```


## Dataset preparation

1. Create a folder to store all kern-based repositories, for example:
```
mkdir datasets && cd datasets
git clone https://github.com/craigsapp/beethoven-piano-sonatas.git

```
2. Run data preparation script pointing to the folder you just created
```
./prepsonatas.sh id input_folder output_folder
```
The preparation script will create the following files in the current folder:
* train_id.csv with the training input and output file locations (stored in output_folder)
* val_id.csv with the validation input and output file locations (stored in output_folder)
* test_id.csv with the test input and output file locations (stored in output_folder)
* labels_id.json with the list of labels in the output representation

If you want to run the data preparation with other parameters, you may add them at the end of the previous command line, as in the following example:
```
./prepsonatas.sh id input_folder output_folder --label-encoder single
```

## Training

Run this shell script to start training with the default parameters:
```
./runtrain.sh config/quartets.cfg manifest_id model_id
```

If you want to run the training with other parameters, you may add them at the end of the previous command line, as in the following example:
```
./runtrain.sh config/quartets.cfg manifest_id model_id --num-workers 4
```
Please run ```python train.py --help``` for a complete list of options.

You may also check the [configuration file](config/quartets.cfg) for extended training parameters.

### Multi-GPU

Add -m multiproc to the training script as in the following snipet:
```
python -m multiproc train.py --cuda  # Add your parameters as normal
```

### Mixed Precision

```
python train.py --cuda --mixed-precision # Add your parameters as normal
```
Mixed precision can also be combined with multi-GPU:
```
python -m multiproc train.py --cuda --mixed-precision  # Add your parameters as normal
```

### Checkpoints

To continue from a checkpointed model that has been saved:

```
./runtrain.sh config/quartets.cfg manifest_id model_id --continue-from models/model_id.last.pth
```

If you would like to start from a previous checkpoint model but not continue training, add the `--finetune` flag to restart training from the `--continue-from` model state.

After each epoch a new checkpoint is always saved with one of these namings:
```
models/model_id.pth # For the best model so far
models/model_id.last.pth # For the last model that is not the best so far
```

## Testing

To evaluate a trained model on a test set:

```
./runtest.sh test_id.csv models/model_id.pth
```

An example script to output a single transcription has been provided:
```
python transcribe.py --model-path models/model_id.pth --audio-path /path/to/audio.flac
```

## Model

To display hyperparams and other training metadata of any checkpointed model:

```
python showmodel.py models/model_id.pth
```