# Imagen base:
FROM nvcr.io/nvidia/pytorch:20.12-py3
ARG lang=en
ENV INPUT_LANG ${lang}
RUN apt-get -y update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install sudo curl locales \ 
&& rm -rf /var/lib/apt/lists/*
RUN apt-get -y upgrade
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8   
ENV LANGUAGE en_US:en ENV LC_ALL en_US.UTF-8
RUN mkdir /app
RUN mkdir /app/code
ARG USER_ID=10008
ARG GROUP_ID=10001
RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
ENV HOME=/home/user
RUN chmod 777 /home/user
ENV PATH="/home/user/.local/bin:${PATH}"
WORKDIR /home/user

# Audio2Score dependencies:
# Install Ubuntu dependencies.
RUN apt-get update \
&& apt-get -y install nano sox libsox-dev libsox-fmt-all fluidsynth ffmpeg \
&& rm -rf /var/lib/apt/lists/*

# Install python dependencies.
RUN pip install numpy scikit-learn pandas tqdm cython cffi python-levenshtein librosa madmom

# Install pytorch and pytorch audio, from last stable, support for cuda111.
RUN pip install torch==1.8.0+cu111 torchaudio==0.8.0 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip list

# Install Humdrum extras from source and build it, and add to PATH.
RUN git clone https://github.com/mangelroman/humextra.git
RUN cd humextra && make library && make hum2mid && make tiefix && make xml2hum
ENV PATH="/home/user/humextra/bin:${PATH}"

RUN git clone https://github.com/humdrum-tools/humdrum
RUN cd humdrum && make bin && make install
ENV PATH="/home/user/humdrum/bin:${PATH}"

# CUSTOM PROMPT.
ENV TERM=xterm-256color
RUN echo 'export PS1="${debian_chroot:+($debian_chroot)}\[\e[1;32m\]\u@audio2score(\h)\[\e[m\] \[\e[1;36m\]\w\a\[\e[m\]\$ "' >> .bashrc

# Change to user
USER user
