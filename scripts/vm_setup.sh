#!/bin/bash
# vm_setup.sh: Preparar entorno en VM
set -e
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip sysbench docker.io git curl procps
pip3 install --upgrade pip
pip3 install jupyter matplotlib psutil
sudo usermod -aG docker $USER
echo "VM configurada. Reinicia para aplicar permisos de Docker."
