#!/bin/sh

# git clone --recurse-submodules -j8 git://github.com/i-r-o-n/dotfiles.git .config
# git submodule update --init --recursive

# add reflector systemd service + timer to update mirrors

# Arch packages
sh install-packages.sh

# AUR packages thru yay
sh yay.sh

# pac-pacman-aliases
yay -S pac-pacman-aliases --noconfirm

# kanata keyboard manager
# yay -S kanata --noconfirm

# JetBrainsMono Nerd Font Mono
sh jetbrains-mono-nerd-font-install.sh &

# zsh
# powerlevel10k
# zsh plugins as git submodules

# texlive
sh langs/latex.sh &

# neovim utils
sh neovim.sh

# starship with nushell
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
