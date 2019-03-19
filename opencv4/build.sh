#!/bin/bash

IMAGE=opencv4
# execute docker run with nvidia driver and device
docker build -t $IMAGE .
