#!/usr/bin/env bash

CUDNN_TAR_FILE="cudnn-9.0-linux-x64-v7.3.1.20"

wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.3.1/prod/9.0_2018927/${CUDNN_TAR_FILE}
#tar -xzvf cudnn-9.0-linux-x64-v7.1.tgz
tar -xzvf ${CUDNN_TAR_FILE}

sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*


echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda' >> .bashrc

nvidia-smi
nvcc -V