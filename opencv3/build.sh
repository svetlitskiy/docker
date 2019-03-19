#!/bin/bash

IMAGE=opencv3
# execute docker run with nvidia driver and device
docker build -t $IMAGE .
