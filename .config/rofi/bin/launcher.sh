#!/usr/bin/env bash
rofi \
	-show drun \
	-modi run,drun,ssh \
	-drun-match-fields all \
	-drun-display-format "{name}" \
	-no-drun-show-actions \
	-terminal kitty \
  -scroll-method 1 \
	-theme "$HOME"/.config/rofi/config/launcher.rasi \
  -icon-theme "Papirus-Dark"
