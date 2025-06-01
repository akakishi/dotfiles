#!/usr/bin/bash

# dispatch monitor for laptop
if [[ $HOSTNAME == *-lt ]]
then
  hyprctl keyword monitor "eDP-1,preferred,auto,1"
else
  hyprctl keyword monitor "HDMI-A-1,1920x1080,-1920x0,1" &&\
  hyprctl keyword monitor "DP-1,1920x1080,0x0,1" &&\
  hyprctl keyword monitor "DP-2,1920x1080,1920x0,1"
fi

