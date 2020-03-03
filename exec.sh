#!/bin/bash

sudo xhost +
sudo podman run --privileged=true -it --shm-size=2g --rm \
	-v /etc/localtime:/etc/localtime:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=unix${DISPLAY}" \
    -v "${HOME}/Downloads:/home/bank/Downloads:Z" \
    -v "${XAUTHORITY}:/tmp/.docker.xauth:ro"  \
    -v /dev/shm:/dev/shm \
    -v /etc/hosts:/etc/hosts \
    --net host \
    --name bb bb-browser
