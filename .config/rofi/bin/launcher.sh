#!/usr/bin/env bash
rofi \
	-show drun \
	-modi run,drun,ssh \
	-scroll-method 0 \
	-drun-match-fields all \
	-drun-display-format "{name}" \
	-no-drun-show-actions \
	-terminal kitty \
  -scroll-method 1 \
	-theme "$HOME"/.config/rofi/config/launcher.rasi
