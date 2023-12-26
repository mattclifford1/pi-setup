#!/bin/bash
# raspberry pi zero 2w with pirate audio DAC setup
# code adapted from https://github.com/pimoroni/pirate-audio/blob/master/mopidy/install.sh

function add_to_config_text {
    CONFIG_LINE="$1"
    CONFIG="$2"
    sed -i "s/^#$CONFIG_LINE/$CONFIG_LINE/" $CONFIG
    if ! grep -q "$CONFIG_LINE" $CONFIG; then
		printf "$CONFIG_LINE\n" >> $CONFIG
    fi
}

echo 'alias Syu="sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
echo 'alias temp="watch -n 2 vcgencmd measure_temp"' >> ~/.bashrc

sudo apt update && sudo apt upgrade -y
sudo apt install git -y

# libs for pirate audio
sudo apt install -y python3-rpi.gpio python3-spidev python3-pip python3-pil python3-numpy libopenjp2-7
# Enable SPI
sudo raspi-config nonint do_spi 0
# Add necessary lines to config.txt (if they don't exist)
sudo add_to_config_text "gpio=25=op,dh" /boot/config.txt
sudo add_to_config_text "dtoverlay=hifiberry-dac" /boot/config.txt
# Install support plugins for Pirate Audio
inform "Installing Pirate Audio plugins..."
pip3 install --upgrade pidi-display-pil pidi-display-st7789
echo



# remove light  -   https://forums.raspberrypi.com/viewtopic.php?t=328550
# echo 0  | sudo tee /sys/class/leds/led0/brightness


# screen libs from https://github.com/pimoroni/st7789-python
# sudo apt install python-rpi.gpio python-spidev python-pip python-pil python-numpy
# sudo pip install st7789


# raspotify - you can edit the config in the file /etc/raspotify/conf
sudo apt-get -y install curl && curl -sL https://dtcooper.github.io/raspotify/install.sh | sh
echo "you can edit raspotify config at: /etc/raspotify/conf"

sudo reboot
