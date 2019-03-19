#
# OpenCV 4 - http://opencv.org/
#
# @author Aleksey Svetlitskiy
# v1.0.0
#
# Copyright (c) 2019 Aleksey Svetlitskiy - https://github.com/svetlitskiy/docker
#

FROM ubuntu:16.04

MAINTAINER Aleksey Svetlitskiy a.svetlitskiy@gmail.com

RUN \
    echo "PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '" >> ~/.bashrc

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    ffmpeg \
    build-essential \
    cmake git pkg-config libswscale-dev \
    libtbb2 libtbb-dev libjpeg-dev \
	libpng-dev libtiff-dev libjasper-dev \
    python3-numpy \
    python3-pip

RUN apt-get update && apt-get install -y \
  build-essential \
  checkinstall \
  cmake \
  pkg-config \
  yasm \
  libtiff5-dev \
  libjpeg-dev \
  libjasper-dev \
  libavcodec-dev \
  libavformat-dev \
  libswscale-dev \
  libdc1394-22-dev \
 # libxine-dev \
  libgstreamer0.10-dev \
  libgstreamer-plugins-base0.10-dev \
  libv4l-dev \
  python-dev \
  python-numpy \
  python-pip \
  libtbb-dev \
  libeigen3-dev \
  libqt4-dev \
  libgtk2.0-dev \
  # Doesn't work libfaac-dev \
  libmp3lame-dev \
  libopencore-amrnb-dev \
  libopencore-amrwb-dev \
  libtheora-dev \
  libvorbis-dev \
  libxvidcore-dev \
  x264 \ 
  v4l-utils \
 # Doesn't work ffmpeg \
  libgtk2.0-dev \
#  zlib1g-dev \
#  libavcodec-dev \
  unzip \
  libhdf5-dev \
  wget \
  sudo

RUN mkdir opencv4


ARG cvVersion="master"


# source
RUN \
	git clone https://github.com/opencv/opencv_contrib && \
	cd opencv_contrib && \
	git checkout $cvVersion


RUN \
	git clone https://github.com/opencv/opencv && \
	cd opencv && \
	git checkout $cvVersion && \
    mkdir build

WORKDIR /opencv/build

RUN \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
          -D CMAKE_INSTALL_PREFIX=/usr/local \
          -D INSTALL_C_EXAMPLES=ON \
          -D INSTALL_PYTHON_EXAMPLES=ON \
          -D WITH_TBB=ON \
          -D WITH_V4L=ON \
          -D BUILD_NEW_PYTHON_SUPPORT=ON \
          -D BUILD_TIFF=ON \
          -D ENABLE_PRECOMPILED_HEADERS=OFF \
          #-D OPENCV_PYTHON3_INSTALL_PATH=$cwd/OpenCV-$cvVersion-py3/lib/python3.5/site-packages \
          -D WITH_QT=ON \
          -D WITH_OPENGL=ON \
          -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
          -D BUILD_EXAMPLES=ON ..


RUN \
    export cpus=$(grep -c ^processor /proc/cpuinfo) && \
    make -j$cpus

RUN \
    make install




#WORKDIR /opencv/build

#WORKDIR /root/
