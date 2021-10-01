#!/bin/bash
## Automating the CUDA and CuDNN installation process.
## official guide: http://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html 

### steps ####
# verify the system has a cuda-capable gpu
# verify the system has gcc installed
# download and install the nvidia cuda toolkit
# download cudnn
# setup environment variables
# verify the system
###

### checking your NVIDIA gpu is cuda enable or not got to https://developer.nvidia.com/cuda-gpus
### to verify your gpu is cuda enable enter in to the comman line
lspci | grep -i nvidia

### gcc compiler is required for development using the cuda toolkit. to verify the version of gcc install enter
gcc --version

# to download go to https://developer.nvidia.com/cuda-downloads
# set (linux -> x86_64 -> Ubuntu -> 16.04 -> deb (network))
# CUDA_REPO_PKG="cuda-repo-ubuntu1604_8.0.61-1_amd64.deb"
CUDA_REPO_PKG="cuda-repo-ubuntu1604_10.2.89-1_amd64.deb" # toolkit 10.2

wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/${CUDA_REPO_PKG}
sudo dpkg -i ${CUDA_REPO_PKG}
sudo apt-get update

# to install cuda toolkit set cuda-10-2
sudo apt-get install cuda-10-2

# install cuDNN v7.6.5
# We do not download from Nvidia Developer hub, but pull from an unofficial repo in order to side-step complex login and authenticated protocols.
CUDNN_TAR_FILE="cudnn-10.2-linux-x64-v7.6.5.32.tgz"

wget http://people.cs.uchicago.edu/~kauffman/nvidia/cudnn/${CUDNN_TAR_FILE}
tar -xzvf ${CUDNN_TAR_FILE}

#copy the following files into the cuda toolkit directory.
sudo cp -P cuda/include/cudnn.h /usr/local/cuda-10.2/include
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-10.2/lib64/
sudo chmod a+r /usr/local/cuda-10.2/lib64/libcudnn*

# set environment variables permanently on ~/.bashrc file 
export PATH=/usr/local/cuda-10.2/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# need to logout once to get the effect of these variables 

### verify installation
# check driver version
cat /proc/driver/nvidia/version
# to verify current cuda toolkit version
nvcc -V
# to check which processes are running on gpu
nvidia-smi
# if above command shows output. then we are done !!