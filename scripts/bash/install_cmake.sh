#!/bin/bash/

cmake_version=cmake-3.29.2.tar.gz
sudo apt update
sudo apt install build-essential 
sudo apt install libssl-dev
export OPENSSL_ROOT_DIR=/usr/include/openssl
wget https://cmake.org/files/v3.29/${cmake_version}
tar -xzvf cmake-3.29.2.tar.gz
cd cmake-3.29.2
./bootstrap
make -j$(nproc)
sudo make install
# Update PATH Environment Variable
which cmake
/usr/local/bin/cmake
export PATH=/usr/local/bin/cmake:$PATH
source ~/.bashrc
cmake --version