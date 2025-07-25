FROM ubuntu:22.04

# Avoid interactive prompts during package installs
ENV DEBIAN_FRONTEND=noninteractive

ENV HOME=/home/coniferest
ENV INSTALL_DIR=/opt/coniferest
RUN mkdir $INSTALL_DIR

# Define Conda installation directory and update PATH
ENV CONDA_DIR=$INSTALL_DIR/conda
ENV PATH=$CONDA_DIR/bin:$PATH

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    bzip2 \
    ca-certificates \
    git \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Install Miniconda
ARG PYTHON_VERSION=py39_4.11.0
ENV PYTHON_VERSION=$PYTHON_VERSION
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-${PYTHON_VERSION}-Linux-x86_64.sh -O /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -b -p $CONDA_DIR && \
    rm /tmp/miniconda.sh

# Install required packages
ADD rootfs /
ENV PIP_NO_CACHE_DIR=1
RUN pip install -r $INSTALL_DIR/requirements.txt

# Set working directory
WORKDIR $HOME

# Use bash shell for proper conda activation
SHELL ["/bin/bash", "-c"]

# Start Jupyter Lab when container starts
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=''
