#!/bin/bash

VOL_TEXT=$(wpctl get-volume @DEFAULT_SINK@ | tr -d -c .0-9)
VOL_INT=$(echo "$VOL_TEXT * 100 / 1" | bc)
dunstify \
  -h int:value:"$VOL_INT" \
  -h int:transient:1 \
  -i ~/.config/dunst/assets/volume.svg \
  -t 2000 \
  -r 2593 "Volume: $VOL_INT%"
