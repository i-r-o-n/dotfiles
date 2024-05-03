#!/bin/sh

sudo groupadd uinput

sudo usermod -aG input $USER
sudo usermod -aG uinput $USER

sudo su - $USER

echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' | sudo tee /etc/udev/rules.d/01-input.rules

sudo udevadm control --reload-rules
sudo udevadm trigger

# verify
ls -l /dev/uinput
