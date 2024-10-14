#!/bin/sh

# TexLive
curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat <install-tl-unx.tar.gz | tar xf -
cd install-tl-* || die
sudo perl ./install-tl --no-interaction

# this takes some time to complete
