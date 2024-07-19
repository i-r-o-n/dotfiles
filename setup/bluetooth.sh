#!/bin/sh

sudo pacman -Syu
sudo pacman -S --needed pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber bluez bluez-utils

sudo systemctl enable --now pipewire-pulse wireplumber

sudo systemctl enable --now bluetooth

# sudo systemctl restart bluetooth

# instructions
echo "Bluetooth setup completed."
echo "You can now use 'bluetoothctl' to pair and connect to Bluetooth devices."
echo "Commands:"
echo "  bluetoothctl"
echo "  power on"
echo "  agent on"
echo "  default-agent"
echo "  scan on"
echo "  pair <MAC_ADDRESS>"
echo "  trust <MAC_ADDRESS>"
echo "  connect <MAC_ADDRESS>"

# may need to re-pair device if
# bluetoothctl error
# Failed to connect: org.bluez.Error.Failed br-connection-unknown
