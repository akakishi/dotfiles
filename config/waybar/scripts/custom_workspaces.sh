#!/bin/bash

current_ws=$(hyprctl activeworkspace -j | jq -r '.id')
workspaces=$(hyprctl workspaces -j)

info=$(echo "$workspaces" | jq -r --arg cur "$current_ws" '
  [.[] |
    if (.id | tostring) == $cur then
      ""
    else
      "\(.windows)"
    end
  ] | join(" ")
')

      #"<span foreground=\"orange\" weight=\"bold\">\(.windows)</span>"
echo "{\"text\": \"$info\"}"
