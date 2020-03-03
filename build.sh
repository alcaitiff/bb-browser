#!/bin/bash
cd container
wget -c "http://ftp.br.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb"
wget -c "https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_setup64.deb"
cd -
sudo podman build -t bb-browser container

