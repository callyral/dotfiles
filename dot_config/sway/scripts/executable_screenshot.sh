#!/bin/sh
# simple screenshot script by callyral
# requires:
#  grim
#  slurp
#  wl-clipboard
#  a notification daemon (dunst)
DATE=$(date +"%Y%m%d%H%M%S")
if [ "$1" = "full" ]; then
    grim ~/Pictures/shot_$DATE.png
    notify-send "saved full screenshot to shot_$DATE.png"
elif [ "$1" = "full-copy" ]; then
    grim - | wl-copy
    notify-send "copied full screenshot"
elif [ "$1" = "sel" ]; then
    grim -g "$(slurp)" ~/Pictures/sel_$(date +"%Y%m%d%H%M%S").png
    notify-send "saved selection to sel_$DATE.png"
elif [ "$1" = "sel-copy" ]; then
    grim -g "$(slurp)" - | wl-copy
    notify-send "copied screenshot"
else
    printf "Invalid argument: '$1'\n"
fi
