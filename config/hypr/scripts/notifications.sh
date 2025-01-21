#!/usr/bin/env bash

CONFIG=~/.config/hypr/mako/config

if [[ ! $(pidof mako) ]]; then
  mako --config ${CONFIG}
fi
