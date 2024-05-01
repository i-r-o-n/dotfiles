#!/bin/sh

# packages
# ly
# bspwm
# sxhkd
# signal-desktop
# alacritty
# nvim
# tmux
# polybar
# zathura
# poppler zathura-pdf-poppler
# firefox - vimium + config
# fd-find
# rg

# AUR packages

# yay-bin
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
MAKEFLAGS="--noconfirm" makepkg -si --noconfirm

# pac-pacman-aliases
yay -S pac-pacman-aliases --noconfirm

# kanata keyboard manager
yay -S kanata --noconfirm

# fonts

# JetBrainsMono Nerd Font Mono

# zsh
# powerlevel10k

# for neovim
sudo pac install nodejs npm
sudo npm install -g tree-sitter-cli
