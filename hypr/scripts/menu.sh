#!/bin/bash

CONFIG=~/.config/hypr/wofi/config
STYLE=~/.config/hypr/wofi/style.css
COLORS=~/.config/hypr/wofi/colors

if ! pgrep wofi > /dev/null; then
  wofi --show drun --prompt 'Search...' --conf ${CONFIG} --style ${STYLE} --color ${COLORS}
else
  pkill wofi
fi
