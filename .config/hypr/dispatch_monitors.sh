#!/usr/bin/bash

# dispatch monitor for laptop
if [[ hostname == "*-lt" ]]
then
  hyprctl keyword monitor "auto,auto,0x0,1"
else
  hyprctl keyword monitor "HDMI-A-1,1920x1080,-1920x0,1" &&\
  hyprctl keyword monitor "DP-1,1920x1080,0x0,1" &&\
  hyprctl keyword monitor "DP-2,1920x1080,1920x0,1"
fi

