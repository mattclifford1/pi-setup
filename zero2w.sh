#!/bin/bash

echo 'alias Syu="sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
echo 'alias temp="watch -n 2 vcgencmd measure_temp"' >> ~/.bashrc

sudo apt update && sudo apt upgrade -y
sudo apt install git -y

# modpiy
git clone https://github.com/pimoroni/pirate-audio
cd pirate-audio/mopidy
sudo ./install.sh

# remove light  -   https://forums.raspberrypi.com/viewtopic.php?t=328550
# echo 0  | sudo tee /sys/class/leds/led0/brightness

# add pirate audio DAC  -  https://github.com/pimoroni/pirate-audio
# echo "dtoverlay=hifiberry-dac" | sudo tee -a /boot/config.txt 
# echo "gpio=25=op,dh" | sudo tee -a /boot/config.txt 

# screen libs
# sudo apt install python-rpi.gpio python-spidev python-pip python-pil python-numpy
# sudo pip install st7789


# raspotify - you can edit the config in the file /etc/raspotify/conf
# sudo apt-get -y install curl && curl -sL https://dtcooper.github.io/raspotify/install.sh | sh

sudo reboot
