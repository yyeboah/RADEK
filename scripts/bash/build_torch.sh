#!/bin/bash/
# 9th January 2026

# ensure CUDA and CUDNN are installed (Tested on CUAD >12.8)

# ensure CMAKE is the correct version (eg. Tested on 3.27 )

conda ceate -n pytorch python=3.10 -y
conda activate pytorch

pip install pyyaml # install other packages as and when required during build

git clone https://github.com/pytorch/pytorch

cd pytorch

git submodule sync
git submodule update --init --recursive

python setup.py develop
