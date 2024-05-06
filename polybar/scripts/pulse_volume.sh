#!/bin/sh
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//g')

if [ "$volume" -eq 0 ]; then
	echo "" # Icon for mute
elif [ "$volume" -lt 50 ]; then
	echo "" # Icon for low volume
else
	echo "" # Icon for high volume
fi
