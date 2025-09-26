#!/usr/bin/bash

DIR=$1
up="up"
down="down"

case $DIR in
  $up)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    ;;
  $down)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    ;;
esac

vol=$(wpctl get-volume @DEFAULT_SINK@)

notify-send $vol -t 2000 -e
