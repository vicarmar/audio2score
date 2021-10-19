# Installation

## Clone the project 
```
git clone https://github.com/vicarmar/audio2score.git
```

## Installation procedures

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