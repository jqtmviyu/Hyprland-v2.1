#!/bin/sh

if [[ "$1" == "clean" ]]; then
  echo "input sudo pass to clean"
  sudo pacman -Rns $(pacman -Qdtq)
  sudo pacman -Sc
	sudo paccache -r
	rm -rf ~/.cache/yay
  sudo journalctl --vacuum-time=1month
  sudo journalctl --vacuum-size=500M
else
  num=$(checkupdates | wc -l)
  echo '{"text": '"$num"', "alt": "", "tooltip": "L:update\nR:clean"}'
fi
