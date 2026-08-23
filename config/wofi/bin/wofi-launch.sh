#!/usr/bin/bash

wofi \
    --width 450 \
    --show drun \
    --hide-scroll \
    --insensitive \
    --define=allow_markup=true \
    --define=prompt=Search \
    --define=allow_images=true \
    --no-actions \
    --define=use_search_box=false \
    --lines=9 \
    -s ~/.config/wofi/wofi-launch.css
