#!/bin/bash

SCRIPTSDIR=~/.config/hypr/scripts

# Kill already running process
_ps=(waybar mako)
for _prs in "${_ps[@]}"; do
  if [[ $(pidof ${_prs}) ]]; then
    killall -9 ${_prs}
  fi
done

# Lauch notification daemon (mako)
${SCRIPTSDIR}/notifications.sh &

# Lauch statusbar (waybar)
${SCRIPTSDIR}/statusbar.sh &
