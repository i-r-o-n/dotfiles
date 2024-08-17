#!/bin/bash

DIRECTION=$1
CURRENT_WS=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused) | .name')
if [[ $DIRECTION == "prev" ]]; then
  TARGET_WS=$((CURRENT_WS - 1))
elif [[ $DIRECTION == "next" ]]; then
  TARGET_WS=$((CURRENT_WS + 1))
fi

# Check if the workspace exists
if ! swaymsg -t get_workspaces | jq -r '.[].name' | grep -q "^$TARGET_WS$"; then
  swaymsg workspace number "$TARGET_WS"
else
  swaymsg workspace "$TARGET_WS"
fi
