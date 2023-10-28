#!/bin/sh
pipewire &
pipewire-pulse &
pgrep wireplumber || wireplumber &

pgrep dunst || dunst &

nm-applet &
copyq &
gammastep-indicator -m wayland &

gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-purple-dark" &
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Macchiato-Standard-Peach-Dark" &
gsettings set org.gnome.desktop.interface cursor-theme "Catppuccin-Macchiato-Peach-Cursors" &
