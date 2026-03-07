#!/bin/bash

rofi_command="rofi -theme $HOME/.config/rofi/config/sinkmenu.rasi"

# Options
fullscreen=" Fullscreen"
region=" Region"

options="$fullscreen\n$region"

chosen="$(echo -e "$options" | $rofi_command -p "Record" -dmenu -selected-row 0)"

case $chosen in
  $fullscreen)
    "$HOME/.config/waybar/scripts/recording.sh" toggle fullscreen
    ;;
  $region)
    "$HOME/.config/waybar/scripts/recording.sh" toggle region
    ;;
esac
