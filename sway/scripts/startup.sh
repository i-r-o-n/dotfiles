#!/bin/bash

# Launch Alacritty on workspace 1
swaymsg workspace 1
alacritty &

# Launch Firefox on workspace 2
swaymsg workspace 2
firefox &

# Launch Spotify on workspace 4
swaymsg workspace 4
spotify-launcher &
