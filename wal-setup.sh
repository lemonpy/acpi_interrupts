#!/usr/bin/bash
source vars
WALCMD="wal -i $WALLPAPER"
wal -c
${WALCMD}
ln -fs $(pwd)/colors-rofi-dark.rasi ~/.config/wal/templates/
${WALCMD}
