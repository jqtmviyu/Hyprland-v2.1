#!/bin/bash

# WOFI STYLES
CONFIG=~/.config/hypr/wofi/config
STYLE=~/.config/hypr/wofi/style.css
COLORS=~/.config/hypr/wofi/colors

hyprDir=~/.config/hypr/configs

# wofi window config (in %)
WIDTH=10
HEIGHT=30

## Wofi Command
wofi_command="wofi --show dmenu \
      --prompt choose...
      --conf $CONFIG --style $STYLE --color $COLORS \
      --width=$WIDTH% --height=$HEIGHT% \
      --cache-file=/dev/null \
      --hide-scroll --no-actions \
      --matching=fuzzy"


menu(){
  printf "0. entry\n"
  printf "1. keybinds\n"
  printf "2. rules\n"
  printf "3. startup\n"
  printf "4. monitors\n"
}

main() {
    choice=$(menu | ${wofi_command} | cut -d. -f1)
    case $choice in
        0)
            foot -e vim -R "$hyprDir/../hyprland.conf"
            ;;
        1)
            foot -e vim -R "$hyprDir/keybinds.conf"
            ;;
        2)
            foot -e vim -R "$hyprDir/window_rules.conf"
            ;;
        3)
            foot -e vim -R "$hyprDir/exec.conf"
            ;;
        4)
            foot -e vim -R "$hyprDir/monitors.conf"
            ;;
        *)
            ;;
    esac
}

main