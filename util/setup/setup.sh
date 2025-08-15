#!/bin/sh

# git clone --recurse-submodules -j32 git://github.com/a-lipson/dotfiles.git .config
# git submodule update --init --recursive

# JetBrainsMono Nerd Font Mono
sh jetbrains-mono-nerd-font-install.sh &

# texlive
sh langs/latex.sh &

# starship with nushell
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
