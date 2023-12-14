#!/bin/bash
# make sure to be using 32bit OS

echo 'alias Syu="sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
source ~/.bashrc
sudo apt update && sudo apt upgrade -y

sudo apt remove pulseaudio -y
# sudo apt install alsa-base

# cd ~/Downloads
# wget https://dtcooper.github.io/raspotify/raspotify-latest_arm64.deb
# sudo apt install ./raspotify-latest_arm64.deb
# rm raspotify-latest_arm64.deb

sudo apt-get -y install curl && curl -sL https://dtcooper.github.io/raspotify/install.sh | sh

# you can edit the config in the file /etc/raspotify/conf
