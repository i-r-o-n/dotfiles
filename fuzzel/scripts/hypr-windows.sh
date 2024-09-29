#!/bin/bash

windows=$(
  hyprctl clients -j |
    jq -r '.[] | select(.class != null) | "\(.address) \(.workspace.id) \(.class) - \(.title)"'
)

# Use Fuzzel to select a window, hiding the address
selected=$(echo "$windows" | sed 's/^[^ ]* //' | fuzzel --dmenu --config ~/.config/fuzzel/config.ini --prompt "  ")

# Get the selected window address
window_address=$(echo "$windows" | grep -E "$(echo "$selected" | sed 's/[][\.*^$/]/\\&/g')" | awk '{print $1}')

# Focus the selected window
hyprctl dispatch focuswindow "address:${window_address}"
