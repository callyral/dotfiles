#!/bin/sh
lxpolkit &
pipewire &
pipewire-pulse &
pgrep wireplumber || wireplumber &

waybar &

nm-applet &
copyq &
gammastep-indicator -m wayland &

pgrep OpenTabletDrive || otd-daemon &
