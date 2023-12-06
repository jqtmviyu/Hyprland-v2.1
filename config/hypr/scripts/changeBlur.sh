#!/bin/bash

STATE=$(hyprctl -j getoption decoration:blur:enabled | jq ".int")

if [ "${STATE}" == "1" ]; then
  hyprctl keyword decoration:blur:enabled false
  notify-send "disable blur"
else
  hyprctl keyword decoration:blur:enabled true
  notify-send "Glassmorphism blur"
fi
