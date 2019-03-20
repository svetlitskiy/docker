#
# Darkenet AB GPU Dockerfile
# @author Aleksey Svetlitskiy
# v1.0.0
#
# Copyright (c) 2019 Aleksey Svetlitskiy - https://github.com/svetlitskiy/docker
#

#FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

MAINTAINER Aleksey Svetlitskiy a.svetlitskiy@gmail.com

# working directory
WORKDIR /root

ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# install
RUN \
	apt-get update && apt-get install -y \
	autoconf \
    automake \
	libtool \
	build-essential \
	git \
	wget \
	nano

# openCV
RUN \
	apt-get install -y \
	libopencv-dev \
	python3 \
    python3-pip \
	python3-opencv && \
    pip3 install --upgrade pip && \
    pip install numpy configparser numpy

# build repo
RUN \
	git clone https://github.com/AlexeyAB/darknet darknet_AB && \
	cd darknet_AB

WORKDIR /root/darknet_AB

#COPY ./Makefile ./

# download weights full (accurate most) and tiny (faster , less accurate) models
# darknet rnns

#	wget http://pjreddie.com/media/files/yolo.weights
	#wget http://pjreddie.com/media/files/yolo9000.weights >/dev/null 2>&1 && \

	
# darknet nightmare	
#RUN \
	#wget http://pjreddie.com/media/files/vgg-conv.weights >/dev/null 2>&1

# darknet rnns
#RUN \
	#wget http://pjreddie.com/media/files/shakespeare.weights >/dev/null 2>&1 && \
	#wget http://pjreddie.com/media/files/grrm.weights >/dev/null 2>&1 && \
	#wget http://pjreddie.com/media/files/tolstoy.weights >/dev/null 2>&1 && \
	#wget http://pjreddie.com/media/files/kant.weights >/dev/null 2>&1

# darknet rnns train shakespeare
#RUN \
	#wget https://ocw.mit.edu/ans7870/6/6.006/s08/lecturenotes/files/t8.shakespeare.txt >/dev/null 2>&1

# darknet go


RUN \
	sed -i 's/GPU=.*/GPU=1/' Makefile && \
	sed -i 's/CUDNN=.*/CUDNN=1/' Makefile && \
	sed -i 's/OPENCV=.*/OPENCV=1/' Makefile && \
	sed -i 's/LIBSO=.*/LIBSO=1/' Makefile && \
	make


RUN \
    wget http://pjreddie.com/media/files/yolov3-tiny.weights

# apt-get install -y x11vnc && \

RUN \
    mkdir /root/home
ENV DISPLAY :0

# test nvidia docker
CMD nvidia-smi -q

# defaults command
CMD ["bash"]

