#!/bin/bash

# --- Config ---
FILE_CACHE="/tmp/usr/weather_info.txt"
PYTHON_SCRIPT="$HOME/.config/waybar/scripts/wabar-wttr.py"
EXPIRATON_SECONDS=3600 # 1 hora (ajusta según prefieras)

# --- Logic ---

get_new_weather() {
    # Calls weather python script and stores outputa
    result=$(python3 "$PYTHON_SCRIPT")
    echo "$result" > "$FILE_CACHE"
    echo "$result"
}

# 1. Check if file exists
if [ -f "$FILE_CACHE" ]; then
    # Get date of last modification in seconds (Unix timestamp)
    LAST_MOD=$(stat -c %Y "$FILE_CACHE")
    NOW=$(date +%s)
    DIFF=$((NOW - LAST_MOD))

    # 2. Check if expired
    if [ $DIFF -lt $EXPIRATON_SECONDS ]; then
        if ! grep -q '[^[:space:]]' "$FILE_CACHE"; then
          # File is empty, delete and update
          rm "$FILE_CACHE"
          get_new_weather
        else
          # File is recent and not empty, return content
          cat "$FILE_CACHE"
        fi
    else
        # File has expired, delete and update
        rm "$FILE_CACHE"
        get_new_weather
    fi
else
    # 3. File doesn't exist, get for first time
    get_new_weather
fi
