#!/bin/bash
set -x

# Define paths and themes
wallpaper_path=~/Pictures/wallpapers/Dynamic-Wallpapers
hypr_config_path=~/.config/hypr
declare -A themes=( ["light"]="Mojave-Light" ["dark"]="Mojave-Dark" )
declare -A icons=( ["light"]="McMojave-circle-blue" ["dark"]="McMojave-circle-blue-dark" )

# Function to notify user
notify_user() {
  notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Switching to $1 mode"
}

# Determine current and next mode
current_mode="$(~/.config/hypr/scripts/configEnvManage.sh get THEME_MODE)"
current_path_param=$(echo $current_mode | sed 's/.*/\u&/')
next_mode="$([ "$current_mode" = "light" ] && echo "dark" || echo "light")"
next_path_param=$(echo $next_mode | sed 's/.*/\u&/')

# Notify user and update symlinks
notify_user "$next_mode"
ln -sf "${hypr_config_path}/waybar/style/style-${next_mode}.css" "${hypr_config_path}/waybar/style.css"
ln -sf "${hypr_config_path}/mako/styles/config-${next_mode}" "${hypr_config_path}/mako/config"
ln -sf "${hypr_config_path}/wofi/styles/style-${next_mode}.css" "${hypr_config_path}/wofi/style.css"

# Update GTK and icon themes
gsettings set org.gnome.desktop.interface gtk-theme "${themes[$next_mode]}"
gsettings set org.gnome.desktop.interface icon-theme "${icons[$next_mode]}"

# Find and set the next wallpaper
current_wallpaper=~/$(~/.config/hypr/scripts/configEnvManage.sh get WALLPAPER_PATH)
next_wallpaper=$(echo "$current_wallpaper" | sed "s/${current_mode}/${next_mode}/" | sed "s/${current_path_param}/${next_path_param}/")

if ! [ -f "$next_wallpaper" ]; then
  next_wallpaper=$(find "${wallpaper_path}/${next_path_param}" -type f -iname "*_${next_mode}.jpg" -print0 | shuf -n1 -z | xargs -0)
fi

if pgrep swaybg > /dev/null; then
  pkill swaybg
  swaybg -m fill -i ${next_wallpaper}
else
  swww query || swww init
  swww img ${next_wallpaper} --transition-bezier .43,1.19,1,.4 --transition-fps 60 --transition-type grow --transition-pos 0.925,0.977 --transition-duration 3
fi

# Update configuration files
~/.config/hypr/scripts/configEnvManage.sh set THEME_MODE $next_mode
~/.config/hypr/scripts/configEnvManage.sh set WALLPAPER_PATH "${next_wallpaper#$HOME/}"

exec ~/.config/hypr/scripts/startup.sh