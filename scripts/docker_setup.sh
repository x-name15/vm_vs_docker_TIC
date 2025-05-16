#!/bin/bash
# docker_setup.sh: Preparar entorno en Docker o WSL2
set -e
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip sysbench git curl procps
pip3 install --upgrade pip
pip3 install jupyter matplotlib psutil
echo "Entorno Docker/WSL2 configurado."
