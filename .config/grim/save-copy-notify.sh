#!/bin/bash

picturesPath=$(xdg-user-dir PICTURES)
dateFormat=$(date +%Y%m%d-%H%M%S)
folderPath=$picturesPath"/Screenshots"

if [ ! -d "$folderPath" ]; then
  mkdir $folderPath
fi

filePath=$folderPath"/"$dateFormat".png"
notifyPath=$(xdg-user-dir)"/.config/grim/notify-screenshot.sh"

grim -g "$(slurp)" -t png $filePath &&
    wl-copy < $filePath &&
    $notifyPath $filePath 
