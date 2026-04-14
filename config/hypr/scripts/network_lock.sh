#!/bin/bash

WIFI=$(nmcli -t --fields in-use,ssid,signal device wifi list | grep "*")

if [[ -z "$WIFI" ]]; then
  exit
fi

delimiter=":"

# Temporarily set IFS to the delimiter and read the string into an array
IFS="$delimiter" read -ra string_array <<< "$WIFI"

WIFI_NAME=""
WIFI_STRENGTH=0

# Iterate and print each element
for idx in "${!string_array[@]}"; do
  case $idx in
    1)
      WIFI_NAME=${string_array[$idx]}
      ;;
    2)
      WIFI_STRENGTH=${string_array[$idx]}
      ;;
  esac
done

WIFI_ICON="󰤯"

if [ "$WIFI_STRENGTH" -gt 80 ]; then
  WIFI_ICON="󰤨"
elif [ "$WIFI_STRENGTH" -gt 60 ]; then
  WIFI_ICON="󰤥"
elif [ "$WIFI_STRENGTH" -gt 40 ]; then
  WIFI_ICON="󰤢"
elif [ "$WIFI_STRENGTH" -gt 20 ]; then
  WIFI_ICON="󰤟"
fi

echo "$WIFI_NAME $WIFI_ICON "
