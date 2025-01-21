#!/usr/bin/env bash

iDIR=~/.config/hypr/mako/icons

# Get brightness
get_backlight() {
  echo $(brightnessctl -m | cut -d, -f4)
}

# Get icons
get_icon() {
  # 直接使用 get_backlight 函数获取亮度值
  current=$(get_backlight | sed 's/%//')
  if   [ "$current" -le "20" ]; then
    icon="$iDIR/brightness-20.png"
  elif [ "$current" -le "40" ]; then
    icon="$iDIR/brightness-40.png"
  elif [ "$current" -le "60" ]; then
    icon="$iDIR/brightness-60.png"
  elif [ "$current" -le "80" ]; then
    icon="$iDIR/brightness-80.png"
  else
    icon="$iDIR/brightness-100.png"
  fi
}

# Notify
notify_user() {
  notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$icon" "Brightness : $current%"
}

# Change brightness
change_backlight() {
  brightnessctl set "$1" && get_icon && notify_user
}

# Execute accordingly
case "$1" in
  "--get")
    get_backlight
    ;;
  "--inc")
    change_backlight "+10%"
    ;;
  "--dec")
    change_backlight "10%-"
    ;;
  *)
    get_backlight
    ;;
esac