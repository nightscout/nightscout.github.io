#!/bin/bash

set -e
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confnew" upgrade
sudo curl -fsSl https://get.docker.com | bash
sudo usermod -aG docker "$SUDO_USER"
wget https://raw.githubusercontent.com/nightscout/nightscout.github.io/refs/heads/source/docs/_static/raspberry/docker-compose.yaml
sudo reboot
