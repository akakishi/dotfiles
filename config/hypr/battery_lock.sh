#!/bin/bash

batdir="/sys/class/power_supply/BAT0"
if [ ! -d "$batdir" ]; then
  echo ""
  exit
fi

status=$(cat "$batdir/status")
capacity=$(cat "$batdir/capacity")
icon="<span foreground=\"#f38ba8\">󰂎</span>"

if [[ "$status" == *"Charging"* ]]; then
  icon=""
elif [ "$capacity" -gt 95 ]; then
  icon="󰁹"
elif [ "$capacity" -gt 85 ]; then
  icon="󰂂"
elif [ "$capacity" -gt 75 ]; then
  icon="󰂁"
elif [ "$capacity" -gt 65 ]; then
  icon="󰂀"
elif [ "$capacity" -gt 55 ]; then
  icon="󰁿"
elif [ "$capacity" -gt 45 ]; then
  icon="󰁾"
elif [ "$capacity" -gt 35 ]; then
  icon="󰁽"
elif [ "$capacity" -gt 25 ]; then
  icon="<span foreground=\"#f38ba8\">󰁼</span>"
elif [ "$capacity" -gt 15 ]; then
  icon="<span foreground=\"#f38ba8\">󰁻</span>"
fi

echo "$capacity% $icon"
