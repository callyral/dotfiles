#!/bin/sh
pgrep -x pipewire || pipewire &
pgrep -x pipewire-pulse || pipewire-pulse &
pgrep wireplumber || wireplumber &

waybar &

pgrep dunst || dunst &

pgrep nm-applet || nm-applet &
pgrep copyq || copyq &
pgrep gammastep || gammastep-indicator -m wayland &

gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-purple-dark" &
gsettings set org.gnome.desktop.interface cursor-theme "Catppuccin-Macchiato-Peach-Cursors" &

pgrep swayidle || swayidle -w \
         timeout 300 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
         timeout 600 'swaylock -f -c 000000' \
         before-sleep 'swaylock -f -c 000000' &
