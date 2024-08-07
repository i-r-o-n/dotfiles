#!/bin/sh

# need git installed
# git clone --recurse-submodules -j8 git://github.com/i-r-o-n/dotfiles.git .config
# git submodule update --init --recursive

# add reflector systemd service + timer to update mirrors

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
# ripgrep
# fuzzel - menu

# AUR packages

# yay-bin
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin || return
MAKEFLAGS="--noconfirm" makepkg -si --noconfirm

# pac-pacman-aliases
yay -S pac-pacman-aliases --noconfirm

# kanata keyboard manager
yay -S kanata --noconfirm

# fonts

# JetBrainsMono Nerd Font Mono

# zsh
# powerlevel10k
# zsh plugins as git submodules

# for neovim
sudo pac install nodejs npm
sudo npm install -g tree-sitter-cli

# texlive
curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat <install-tl-unx.tar.gz | tar xf -
cd install-tl-* || return
sudo perl ./install-tl --no-interaction
# then this takes some time to complete
