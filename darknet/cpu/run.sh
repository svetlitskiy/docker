#
# Darkenet AB CPU
#
# @author Aleksey Svetlitskiy
# v1.0.0
#
# Copyright (c) 2019 Aleksey Svetlitskiy - https://github.com/svetlitskiy/docker
#
xhost +local:
IMAGE=darknet_cpu
docker run -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/:/root/home --rm -it $IMAGE bash
#docker run -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix darknet_cpu ./darknet detector test cfg/coco.data cfg/yolo.cfg yolo.weights data/dog.jpg

