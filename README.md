# audio2score

Implementation of audio-to-score task.

The neural network architecture is based on [DeepSpeech2](https://arxiv.org/abs/1512.02595).

## Clone the project 
```
git clone https://github.com/vicarmar/audio2score.git
```

## Installation

### Method 1) Use docker image.

The docker image will provide all the dependencies and requirements. Build the image and run a container, and you will be fine.

Note that the audio2score package is already installed in develop mode in the image. Therefore if you mount the package source code folder as a volume in the docker container, it is possible to edit the code from outside the container, reflecting the change and having effect in the container inmediately, without having to build again the image. 

1. Build the docker image:
```
cd audio2score/docker
./docker_build.sh
```
2. Run docker container: Set your gpu id if any or use --all; set the path to datasets folder for the volume mounts; set the desired name for the container. Optionally, mount a volume mapping the host audio2score source package folder to the given container folder. 
```
docker run --gpus "device=0" -it --shm-size=4g [-v audio2score:/home/user/a2s] -v datasets_path/:/home/user/a2s/datasets --name a2s_container_name audio2score
```

### Method 2) Installing on host.

    Tested on Ubuntu Server 20.04, with python 3.8, Pytorch support for CUDA 11.1.

1. Install Ubuntu dependencies.
```
sudo apt-get update \
&& apt-get -y install nano sox libsox-dev libsox-fmt-all fluidsynth ffmpeg \
&& rm -rf /var/lib/apt/lists/*
```

2. Install Humdrum extras from source and build it, and add them to $PATH.
```
git clone https://github.com/humdrum-tools/humextra.git
cd humextra && make library && make hum2mid && make tiefix
```

3. Install python dependencies.

    A) Directly on host:

        Use the requirements.txt file:

            ```
            pip install -r requirements.txt
            ```

        OR manually:

            4.1. General dependencies.
            ```
            pip install numpy scikit-learn pandas tqdm cython cffi python-levenshtein librosa madmom
            ```

            4.2. Install pytorch and pytorch audio, from last stable, support for cuda111.
            ```
            pip install torch==1.8.0+cu111 torchaudio==0.8.0 -f https://download.pytorch.org/whl/torch_stable.html
            ```

            4.3 Install NVIDIA apex, if not already available:
            ```
            git clone --recursive https://github.com/NVIDIA/apex.git
            cd apex && pip install .
            ```


    B) On a Conda environment on host.
    ```
    conda env create --file=audio2score/environment.yaml
    conda activate a2s
    ```

4. Install Audio2Score package (development mode)

```
pip install -e .
```

# Audio2Score tools:

There exist several ways of using Audio2Score package:
* Run python scripts from CLI.
* Run the console scripts installed with the package, similarly to python scripts.
* Run shell scripts that call any of the previous, but with already set parameters for specific scenarios.

TODO: Complete description here or in docs about the library.
TODO: Provide scripts that download everything for first data prep stage.


## Dataset preparation

There exists specific commands for dataset preparation providing default configurations, in order to have homogeneous ouputs.
* `a2s-prepare-sonatas` or `a2s-prepare`: Sets the instruments to 'piano'.
* `a2s-prepare-quartets`: Sets the instrument to 'cello,viola,violn,flt'.

Main options to take into account are:
* `--label-encoder`: `single` for compact encoding, `multi` for multiple encoding, and extended versions of them.
* `--constrained`: Whether a voice reduction process must be done to have constrained polyphony. If not provided, `unconstrained` polyphony to be kept. 

Run ```a2s-prepare-sonatas --help``` or ```a2s-prepare-quartets --help``` for a complete list of options and default values.

#### Example

1. Create a folder to store all kern-based repositories, for example:
```
mkdir datasets && cd datasets
git clone https://github.com/craigsapp/beethoven-piano-sonatas.git
```
2. Run data preparation script pointing to the folder you just created
```
a2s-prepare-sonatas --id tag --data-dir input_folder --out-dir output_folder
```
The preparation script will create in the ouput folder a new folder with the name `<tag>_<label-encoder>_[un]constrained`, depending on the options values used for `--id`, `--label-encoder` and if `--constrained` option is used or not, with the following files:
* train_tag.csv with the training input and output file locations (stored in output_folder)
* val_tag.csv with the validation input and output file locations (stored in output_folder)
* test_tag.csv with the test input and output file locations (stored in output_folder)
* labels_tag.json with the list of labels in the output representation

If you want to run the data preparation with other parameters, you may add them at the end of the previous command line, as in the following example:
```
a2s-prepare-sonatas --id mani input_folder output_folder --constrained
```

### Combining datasets

With `a2s-combine-dataset`, it is possible to combine datasets created with different options by merging their manifests (csv), if they have been created with the same label encoder and same constrained/unconstrained polyphony conditions.

`a2s-combine-dataset` will look insided the provided `--data-dir` recursively for folders with `<label-encoder>_[un]constrained`, depending on the `--label-encoder` option and if `--constrained` option is provided, and merge the different dataset partitions into new files with the the new `--id` tag provided.

There exist a `--dry-run` option that will not create the output files, but will process the inputs, to get a summary of the number of samples and durations that the combined dataset would have.

For example:
```
a2s-combine-dataset --data-dir input/to/data --id tag --label-encoder single_ext [--constrained] 
```

Run `a2s-combine-dataset --help` for a complete list of options and default values.

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

Use `a2s-test` to evaluate a trained model on a test set:

```
a2s-test --test-manifest test_id.csv --model-path models/model_id.pth
```
This will create in the same model path a `test_result.csv` with the WER, CER and LER metrics for the current dataset and model. The results will be appended in the same file if it already exists.

Also, by default if  `--silent` option is not provided, a log file `<date>_test_<pathto/test_manifest.csv>_<model_id>.log` is created with the decoded output and metrics for each sample in the dataset.

Run `a2s-test --help` for a complete list of options and default values.


Also, `a2s-transcribe` script is provided to output a single transcription from an audio file:
```
a2s-transcribe --model-path models/model_id.pth --audio-path /path/to/audio.flac
```

## Model

To display hyperparams and other training metadata of any checkpointed model:

```
a2s-showmodel models/model_id.pth
```

## Acknowledgements

Initially project forked from [Miguel Ángel Román](https://github.com/mangelroman/audio2score.git)

Some code is borrowed from [Sean Naren](https://github.com/SeanNaren/deepspeech.pytorch).