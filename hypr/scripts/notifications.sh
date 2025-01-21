#!/usr/bin/env bash

CONFIG=~/.config/hypr/mako/config

if ! pidof mako > /dev/null; then
  mako --config ${CONFIG}
fi
