#!/bin/bash

### first update and upgrade
sudo apt-get update
sudo apt-get upgrade

### Remove any previous installations of x264</h3>
sudo apt-get remove x264 libx264-dev

### install developer tools
sudo apt -y install build-essential checkinstall cmake pkg-config
sudo apt -y install git gfortran


### install image I/O packages for loading various image file formats from disk
sudo apt-get install libjpeg8-dev libjasper-dev libpng12-dev

sudo apt-get install libtiff5-dev

sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt install libjasper1 libjasper-dev

###  Install the GTK development library to build Graphical User Interfaces
sudo apt -y install libgtk-3-dev libtbb-dev qt5-default

### Install otehr pertinent libraries
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libdc1394-22-dev
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install libxvidcore-dev libx264-dev
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen x264 v4l-utils

sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt-get install libxine2-dev libv4l-dev
sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install qt5-default libgtk2.0-dev libtbb-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get install libvorbis-dev libxvidcore-dev
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install x264 v4l-utils

# Pick up some additional packages that may come in handy
sudo apt-get install libprotobuf-dev protobuf-compiler
sudo apt-get install libgoogle-glog-dev libgflags-dev
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

### Download opencv and opecv_contrib packages from their respective GitHub repositories
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

### checkout the same version opencv and opencv_contrib
cd opencv 
git checkout 3.4.1 
cd ..

cd opencv_contrib
git checkout 3.4.1
cd ..

#### now compile and install OpenCV with contrib modules
# create a build directory
cd opencv
mkdir build
cd build

#  configure our build using cmake
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_C_EXAMPLES=ON \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
        -D PYTHON_EXECUTABLE=/usr/bin/python3 \
	-D BUILD_EXAMPLES=ON ..

# OPENCV_EXTRA_MODULES_PATH path can be differenet depending upon opencv_contrib/modules location
# python executable path can be found by entering following code in python terminal 
# for python3 execuatable path open the terminal and type python3. and then enter
# import sys; print(sys.executable)

# compile opencV in the same the build folder using maximum available cores.

cores=$(nproc)

make -j$cores

# now  install it on your ubuntu system
sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig


# opencv’s Python binary (cv2.so) can be installed either in directory site-packages or dist-packages
# for finding corrent location enter
find /usr/local/lib/ -type f -name "cv2*.so"

# my binary is installed in dist-packages. above command shows following output
#/usr/local/lib/python3.6/dist-packages/cv2.cpython-36m-x86_64-linux-gnu.so
# now we need to rename it to cv2.so

cd /usr/local/lib/python3.6/dist-packages/
sudo mv cv2.cpython-36m-x86_64-linux-gnu.so cv2.so

## well that's it! to confirm your installation go to the python terminal and enter
## import cv2; print(cv2.__version__)
## if that outputs "3.4.1" and we are done !!!
