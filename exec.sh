#!/bin/bash

sudo podman run --privileged -it --shm-size=2g --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v $HOME/Downloads:/home/bank/Downloads \
    -v /dev/shm:/dev/shm \
    -v ${XAUTHORITY}:/tmp/.docker.xauth:ro  \
    -p 127.0.0.1:10000:10000 \
    --name warsaw-browser maxiwell/warsaw-browser
