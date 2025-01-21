#!/usr/bin/env bash

CONFIG=~/.config/hypr/mako/config

if ! pgrep mako > /dev/null; then
  mako --config ${CONFIG}
fi
