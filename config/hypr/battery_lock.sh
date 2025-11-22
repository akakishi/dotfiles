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
elif [ "$capacity" -gt 90 ]; then
  icon="󰁹"
elif [ "$capacity" -gt 80 ]; then
  icon="󰂂"
elif [ "$capacity" -gt 70 ]; then
  icon="󰂁"
elif [ "$capacity" -gt 60 ]; then
  icon="󰂀"
elif [ "$capacity" -gt 50 ]; then
  icon="󰁿"
elif [ "$capacity" -gt 40 ]; then
  icon="󰁾"
elif [ "$capacity" -gt 30 ]; then
  icon="󰁽"
elif [ "$capacity" -gt 20 ]; then
  icon="<span foreground=\"#f38ba8\">󰁼</span>"
elif [ "$capacity" -gt 10 ]; then
  icon="<span foreground=\"#f38ba8\">󰁻</span>"
fi

echo "$capacity% $icon"
