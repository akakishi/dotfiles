#!/bin/bash

is_waybar_ServerExist=`ps -ef|grep -m 1 waybar|grep -v "grep"|wc -l`
if [ "$is_waybar_ServerExist" = "0" ]; then
    echo "waybar_server not found" > /dev/null 2>&1
elif [ "$is_waybar_ServerExist" = "1" ]; then
  killall waybar
fi

SDIR="$HOME/.config/waybar"
for i in /sys/class/hwmon/hwmon*/temp*_input; do 
    if [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "coretemp: Core 0" ]; then
        export HWMON_PATH="$i"
    fi
done

#sed -i "/hwmon-path/c\ \ \ \ \"hwmon-path\": \"$HWMON_PATH\"," $SDIR/mocha.jsonc

JSON=${1:-"default.jsonc"}
CSS=${2:-"mocha.css"}
waybar -c "$SDIR"/"$JSON" -s "$SDIR"/"$CSS" &
