#!/bin/bash/
# Date: 2025-12-12

sudo apt-get install \
    git \
    cmake \
    ninja-build \
    build-essential \
    libboost-program-options-dev \
    libboost-filesystem-dev \
    libboost-graph-dev \
    libboost-system-dev \
    libboost-test-dev \
    libeigen3-dev \
    libflann-dev \
    libfreeimage-dev \
    libmetis-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libsqlite3-dev \
    libglew-dev \
    qtbase5-dev \
    libqt5opengl5-dev \
    libcgal-dev \
    libceres-dev

echo "Press Enter to continue..."
read

# patch up ceres-solver (>=2.1.0)
wget http://ceres-solver.org/ceres-solver-2.1.0.tar.gz
tar zxf ceres-solver-2.1.0.tar.gz
mkdir ceres-bin
cd ceres-bin
cmake ../ceres-solver-2.2.0
sudo make install


# Using CUDA >=12.0 requires a recent colmap build eg/ 3.13.0
git clone https://github.com/colmap/colmap.git && cd colmap && git checkout 3.13.0
echo "Clone and checkout Press Enter to continue..."
read


# Pay attention to the compute capability of the device and set appropriately
mkdir build && cd build && cmake .. -DCUDA_ENABLED=ON -DCMAKE_CUDA_ARCHITECTURES="61;70;72;75;80;86" -GNinja

ninja && sudo ninja install

echo "Installation complete. Press Enter to exit."
read
