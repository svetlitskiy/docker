#!/usr/bin/env bash
#
# Darkenet AB CPU
#
# @author Aleksey Svetlitskiy
# v1.0.0
#
# Copyright (c) 2019 Aleksey Svetlitskiy - https://github.com/svetlitskiy/docker
#
IMAGE=darknet_cpu
./build.sh && cd ../darknet/cpu && docker build -t $IMAGE .