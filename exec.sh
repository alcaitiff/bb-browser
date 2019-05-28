#!/bin/bash

sudo xhost +
sudo podman run --privileged -it --shm-size=2g --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/Downloads:/home/bank/Downloads \
    -v /dev/shm:/dev/shm \
    -v ${XAUTHORITY}:/tmp/.docker.xauth:ro  \
    --name warsaw-browser maxiwell/warsaw-browser
