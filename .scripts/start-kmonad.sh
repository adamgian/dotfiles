#!/bin/bash

XENV="export XAUTHORITY=$XAUTHORITY; export DISPLAY=$DISPLAY; export HOME=$HOME"
NH=/usr/bin/nohup
KEYBOARD="$HOME/.config/kmonad/keymap-vortex-race-3.kbd"
KMONAD="/usr/bin/kmonad"

echo "sleep 1; $XENV; $NH $KMONAD $KEYBOARD > /dev/null 2 > &1 &" | at now
