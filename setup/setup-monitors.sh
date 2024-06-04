#!/bin/sh

# test
# export DISPLAY=:0

# make sure to spoof your monitor resolution in your browser anti-fingerprinting software
xrandr --output DP-2 --primary --mode 3840x2160 --rate 60 --pos 1080x0 --rotate normal --output DP-4 --mode 1920x1080 --rate 280 --pos 0x0 --rotate left
