#!/bin/sh

# yay-bin
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
MAKEFLAGS="--noconfirm" makepkg -si --noconfirm

# pac-pacman-aliases
yay -S pac-pacman-aliases --noconfirm

# kanata keyboard manager
yay -S kanata --noconfirm
