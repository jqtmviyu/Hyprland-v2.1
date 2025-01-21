#!/bin/bash
set -x

scripts_path=~/.config/hypr/scripts
current_mode="$($scripts_path/configEnvManage.sh get THEME_MODE)"
current_path_param=$(echo $current_mode | sed 's/.*/\u&/')
wallpaper_path=~/Pictures/wallpapers/Dynamic-Wallpapers/${current_path_param}
PICS=($(find "$wallpaper_path" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))
RANDOMPICS="${PICS[RANDOM % ${#PICS[@]}]}"

change_swaybg() {
  pkill swww
  pkill swaybg
  swaybg -m fill -i "$RANDOMPICS" &
  $scripts_path/configEnvManage.sh set WALLPAPER_APP swaybg
  $scripts_path/configEnvManage.sh set WALLPAPER_PATH "${RANDOMPICS#$HOME/}"
}

change_swww() {
  pkill swaybg
  if ! pgrep swww-daemon > /dev/null; then
    swww-daemon &
  fi
  swww img "$RANDOMPICS" --transition-fps 30 --transition-type any --transition-duration 3
  $scripts_path/configEnvManage.sh set WALLPAPER_APP swww
  $scripts_path/configEnvManage.sh set WALLPAPER_PATH "${RANDOMPICS#$HOME/}"
}

change_current() {
  if pgrep swaybg >/dev/null; then
    change_swaybg
  else
    change_swww
  fi
}

case "$1" in
  "swaybg")
    change_swaybg
    ;;
  "swww")
    change_swww
    ;;
  *)
    change_current
    ;;
esac
