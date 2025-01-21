#!/bin/bash
set -x

current_mode="$(~/.config/hypr/scripts/configEnvManage.sh get THEME_MODE)"
current_path_param=$(echo $current_mode | sed 's/.*/\u&/')
wallpaper_path=~/Pictures/wallpapers/Dynamic-Wallpapers/${current_path_param}
PICS=($(find "$wallpaper_path" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))
RANDOMPICS="${PICS[RANDOM % ${#PICS[@]}]}"

change_swaybg() {
  pkill swww
  pkill swaybg
  swaybg -m fill -i "$RANDOMPICS" &
  ~/.config/hypr/scripts/configEnvManage.sh set WALLPAPER_APP swaybg
  ~/.config/hypr/scripts/configEnvManage.sh set WALLPAPER_PATH "${RANDOMPICS#$HOME/}"
}

change_swww() {
  pkill swaybg
  swww query || swww init
  swww img "$RANDOMPICS" --transition-fps 30 --transition-type any --transition-duration 3
  ~/.config/hypr/scripts/configEnvManage.sh set WALLPAPER_APP swww
  ~/.config/hypr/scripts/configEnvManage.sh set WALLPAPER_PATH "${RANDOMPICS#$HOME/}"
}

change_current() {
  if pidof swaybg >/dev/null; then
    change_swaybg
  else
    change_swww
  fi
}

toggle() {
  if pidof swaybg >/dev/null; then
    change_swww
  else
    change_swaybg
  fi
}

case "$1" in
  "swaybg")
    change_swaybg
    ;;
  "swww")
    change_swww
    ;;
  "toggle")
    toggle
    ;;
  *)
    change_current
    ;;
esac