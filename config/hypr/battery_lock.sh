#!/bin/bash

batdir="/sys/class/power_supply/BAT0"
if [ ! -d "$batdir" ]; then
  echo ""
  exit
fi

status=$(cat "$batdir/status")
capacity=$(cat "$batdir/capacity")

if [[ "$status" == *"Charging"* ]]; then
  echo " $capacity%"
else
  echo "󰁾 $capacity%"
fi

