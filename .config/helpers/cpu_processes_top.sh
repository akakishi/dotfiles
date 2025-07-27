#!/usr/bin/bash

temp=$(cat /sys/class/hwmon/hwmon3/temp1_input)
tops=$(ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6 | tail -n 5)
if [[ -e "/sys/class/hwmon/hwmon1/temp1_input" ]]; then
  echo "Directory exists."
else
  echo "Directory does NOT exist."
fi

echo "{\"text\": \"$temp\", \"tooltip\": \"$tops\" }"
