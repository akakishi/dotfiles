#!/bin/bash

if [ $(swaync-client -D) = "false" ]; then
  play "~/.config/swaync/pop.mp3"
fi
