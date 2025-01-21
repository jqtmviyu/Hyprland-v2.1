#!/bin/bash

CONFIG=~/.config/hypr/waybar/config
STYLE=~/.config/hypr/waybar/style.css

if [[ ! $(pidof waybar) ]]; then
  waybar --bar main-bar --log-level error --config ${CONFIG} --style ${STYLE}
fi
