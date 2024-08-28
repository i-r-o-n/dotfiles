#!/bin/sh

# yay-bin
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin || return
MAKEFLAGS="--noconfirm" makepkg -si --noconfirm
