#!/bin/sh

while true; do
  date_time=$(date +"%Y-%m-%d %H:%M:%S")
  battery=$(cat /sys/class/power_supply/BAT1/capacity)
  status=$(cat /sys/class/power_supply/BAT1/status)

  if [ "$status" = "Charging" ]; then
    charging_status="+"
  else
    charging_status=""
  fi

  echo "$charging_status $battery% | $date_time"
  sleep 1
done
