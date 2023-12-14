#!/bin/bash

echo 'alias Syu="sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
source ~/.bashrc
Syu

# cd ~/Downloads
# wget https://dtcooper.github.io/raspotify/raspotify-latest_arm64.deb
# sudo apt install ./raspotify-latest_arm64.deb
# rm raspotify-latest_arm64.deb

sudo apt-get -y install curl && curl -sL https://dtcooper.github.io/raspotify/install.sh | sh
sudo reboot

# you can edit the config in the file /etc/raspotify/conf
