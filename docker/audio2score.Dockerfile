# Imagen base:
FROM nvcr.io/nvidia/pytorch:20.12-py3
# Parámetro que podemos pasar desde ‘docker build’ y valor por defecto si no se indica:
ARG lang=en
# Variable de entorno para la imagen; se le asigna el valor del parámetro:
ENV INPUT_LANG ${lang}
# Instalación de paquetes y borrado de ficheros auxiliares para reducir el tamaño de
# la imagen (si en lugar de -y ponemos -yqq se mostrará menos texto al crear la imagen);
# la variable DEBIAN_FRONTEND evita en este caso algunos errores de debconf:
RUN apt-get -y update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install sudo curl locales \ 
&& rm -rf /var/lib/apt/lists/*
# Atención: upgrade puede hacer que se instalen nuevas versiones de ciertos programas: 
RUN apt-get -y upgrade
# Algunos programas pueden requerir que esté instalada una locale adecuada para
# trabajar con cadenas en UTF-8:
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8   
ENV LANGUAGE en_US:en ENV LC_ALL en_US.UTF-8
# Directorios a crear dentro de la imagen:
RUN mkdir /app
RUN mkdir /app/code
# Descomentar si no usamos volúmenes para copiar el contenido del directorio a la imagen:
# COPY code/ /app/code/
# Más parámetros de ‘docker build’: 
ARG USER_ID=10008
ARG GROUP_ID=10001
# Crea en la imagen el usuario ‘user’ con el id de usuario y el id de grupo indicado
# en los parámetros:
RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
# Cambia al usuario recién creado: USER user
ENV HOME=/home/user
# Permite el acceso al directorio HOME para cualquier otro usuario que se pueda crear:
RUN chmod 777 /home/user
# Los ejecutables de Python se instalan en este directorio; el programa pip se quejaría
# si no está en el PATH:
ENV PATH="/home/user/.local/bin:${PATH}"
# Cambia al directorio del usuario por si es necesario descargar o copiar algo:
WORKDIR /home/user
# Cambia la zona para tzdata
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

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

# Cambia al directorio de la aplicación:
# WORKDIR /app/code

