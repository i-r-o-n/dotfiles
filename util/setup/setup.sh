#!/bin/sh

# git clone --recurse-submodules -j32 git://github.com/i-r-o-n/dotfiles.git .config
# git submodule update --init --recursive

# JetBrainsMono Nerd Font Mono
sh jetbrains-mono-nerd-font-install.sh &

# texlive
sh langs/latex.sh &

# neovim utils
sh neovim.sh

# starship with nushell
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
