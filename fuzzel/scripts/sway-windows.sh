#!/bin/bash

# Get a list of windows with their IDs
windows=$(
  swaymsg -t get_tree |
    jq -r '
    recurse(.nodes[]) |
    select(.type == "con" and .app_id != null) |
    "\(.id) \(.app_id) - \(.name)"'
)

# Use Fuzzel to select a window
selected=$(echo "$windows" | fuzzel --dmenu --config ~/.config/fuzzel/config.ini --prompt "  ")

# Get the selected window ID
window_id=$(echo "$selected" | awk '{print $1}')

# Switch to the selected window
swaymsg [con_id="$window_id"] focus
