#
# Darkenet AB CPU Dockerfile
# @author Aleksey Svetlitskiy
# v1.0.0
#
# Copyright (c) 2019 Aleksey Svetlitskiy - https://github.com/svetlitskiy/docker
#

FROM ubuntu:16.04


MAINTAINER Aleksey Svetlitskiy a.svetlitskiy@gmail.com

# working directory
WORKDIR /root

# install
RUN \
	apt-get update && apt-get install -y \
	autoconf \
    automake \
	libtool \
	build-essential \
	git \
	libssl-dev \
	libcrypto++-dev

# addons
RUN \
	apt-get install -y \
	wget

# openCV
RUN \
	apt-get install -y \
	libopencv-dev \
	python-opencv

# build repo
RUN \
	git clone https://github.com/AlexeyAB/darknet darknet_AB && \
	cd darknet_AB

WORKDIR /root/darknet_AB


# download weights full (accurate most) and tiny (faster , less accurate) models
# darknet rnns
#RUN \
	#wget http://pjreddie.com/media/files/yolo.weights
	
# darknet nightmare	
#RUN \
#	wget http://pjreddie.com/media/files/vgg-conv.weights >/dev/null 2>&1

# darknet rnns
#RUN \
#	wget http://pjreddie.com/media/files/shakespeare.weights >/dev/null 2>&1 && \
#	wget http://pjreddie.com/media/files/grrm.weights >/dev/null 2>&1 && \
#	wget http://pjreddie.com/media/files/tolstoy.weights >/dev/null 2>&1 && \
#	wget http://pjreddie.com/media/files/kant.weights >/dev/null 2>&1

# darknet rnns train shakespeare
#RUN \
#	wget https://ocw.mit.edu/ans7870/6/6.006/s08/lecturenotes/files/t8.shakespeare.txt >/dev/null 2>&1

# darknet go
#RUN \
#	wget pjreddie.com/media/files/go.weights >/dev/null 2>&1

# test executable
#RUN \
#	./darknet
# test yolo
	#./darknet detector test cfg/coco.data cfg/yolo.cfg yolo.weights data/dog.jpg
# test rnns
	#./darknet rnn generate cfg/rnn.cfg /root/shakespeare.weights -srand 0 -seed CLEOPATRA -len 300

RUN \
	sed -i 's/OPENCV=.*/OPENCV=1/' Makefile && \
	sed -i 's/LIBSO=.*/LIBSO=1/' Makefile && \
	make

RUN apt-get install -y x11vnc && \
    mkdir /root/home
ENV DISPLAY :0

# defaults command
CMD ["bash"]

