#/bin/bash

sudo podman build --build-arg HOSTNAME=$HOSTNAME --build-arg DISPLAY=$DISPLAY -t maxiwell/warsaw-browser container

