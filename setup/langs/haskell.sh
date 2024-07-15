#!/bin/sh

sudo pac install ghc cabal-install haskell-language-server stack -y &

stack upgrade
stack install haskell-dap ghci-dap haskell-debug-adapter

yay -S ghcup-hs-bin --no-confirm &
