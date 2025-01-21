#!/bin/bash

scripts_path=~/.config/hypr/scripts
current_wallpaper="$HOME/$($scripts_path/configEnvManage.sh get WALLPAPER_PATH)"
current_wallpaper_app="$($scripts_path/configEnvManage.sh get WALLPAPER_APP)"

swww_init() {
  if ! pidof swww-daemon > /dev/null; then
    swww-daemon &
  fi
  swww img "$current_wallpaper" --transition-fps 30 --transition-type any --transition-duration 3
}

swaybg_init() {
  if pidof swaybg > /dev/null; then
    pkill swaybg
  fi
  swaybg -m fill -i "$current_wallpaper" &
}

default() {
  if [ "$current_wallpaper_app" = "swww" ]; then
    swww_init
  else
    swaybg_init
  fi
}

toggle() {
  if pidof swaybg >/dev/null; then
    $scripts_path/configEnvManage.sh set WALLPAPER_APP swww
    pkill swaybg
    swww_init
  else
    $scripts_path/configEnvManage.sh set WALLPAPER_APP swaybg
    pkill swww
    swaybg_init
  fi
}

case "$1" in
  "toggle")
    toggle
    ;;
  *)
    default
    ;;
esac
