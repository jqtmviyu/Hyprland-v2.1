#!/bin/sh

if [[ "$1" == "clean" ]]; then
  echo "input sudo pass to clean"
  sudo pacman -Rs $(pacman -Qdtq)
  sudo pacman -Sc
else
  num=$(checkupdates | wc -l)
  echo '{"text": '"$num"', "alt": "", "tooltip": "L:update\nR:clean"}'
fi
