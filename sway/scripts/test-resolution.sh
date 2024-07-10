#!/bin/bash

swaymsg -- output DP-3 mode --custom 3840x2160@160Hz

sleep 10

swaymsg -- output DP-3 mode --custom 3840x2160@60Hz
