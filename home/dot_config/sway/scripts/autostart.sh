#!/bin/sh
lxpolkit &
pipewire &
pipewire-pulse &
pgrep wireplumber || wireplumber &

waybar &

nm-applet &
copyq &
gammastep-indicator -m wayland &

mpd --no-daemon $HOME/.config/mpd/mpd.conf &

#pgrep OpenTabletDrive || otd-daemon &

gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-purple-dark" &
gsettings set org.gnome.desktop.interface cursor-theme "Catppuccin-Macchiato-Peach-Cursors" &
