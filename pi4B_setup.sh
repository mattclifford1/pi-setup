#!/bin/bash

echo 'alias Syu="sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
echo 'alias temp="watch -n 2 vcgencmd measure_temp"' >> ~/.bashrc

# remove lights
echo "dtparam=pwr_led_activelow=off" | sudo tee -a /boot/config.txt 
echo "dtparam=act_led_trigger=none" | sudo tee -a /boot/config.txt
echo "dtparam=act_led_activelow=off" | sudo tee -a /boot/config.txt

# DAC
echo "dtoverlay=iqaudio-dacplus" | sudo tee -a /boot/config.txt
# comment out rasberry pi audo in config if needed


source ~/.bashrc
sudo apt update && sudo apt upgrade -y

sudo apt remove pulseaudio -y
# sudo apt install alsa-base

sudo apt install sense-hat

# cd ~/Downloads
# wget https://dtcooper.github.io/raspotify/raspotify-latest_arm64.deb
# sudo apt install ./raspotify-latest_arm64.deb
# rm raspotify-latest_arm64.deb

sudo apt-get -y install curl && curl -sL https://dtcooper.github.io/raspotify/install.sh | sh

# you can edit the config in the file /etc/raspotify/conf
