#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# This is for custom version of waybar idle_inhibitor which activates / deactivates hypridle instead

PROCESS="hypridle"

if [[ "$1" == "status" ]]; then
    if pgrep "$PROCESS" >/dev/null; then
        echo '{"text": "", "alt": "activated", "tooltip": "idle activated"}'
    else
        echo '{"text": "", "alt": "deactivated", "tooltip": "idle deactivated"}'
    fi
elif [[ "$1" == "toggle" ]]; then
    if pgrep "$PROCESS" >/dev/null; then
        pkill "$PROCESS" >/dev/null
    else
        hypridle
    fi
else
    echo "Usage: $0 {status|toggle}"
fi