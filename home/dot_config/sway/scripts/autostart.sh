#!/bin/sh
# . multimedia .
pipewire &
pipewire-pulse &
pgrep wireplumber || wireplumber &


# . notification daemon .
pgrep dunst || dunst &


# . systray applets .
nm-applet &
copyq &
gammastep-indicator -m wayland &


# . gtk .
gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-purple-dark" &
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Macchiato-Standard-Peach-Dark" &
gsettings set org.gnome.desktop.interface cursor-theme "Catppuccin-Macchiato-Peach-Cursors" &


# . layout .
pkill autotiling; autotiling -l 2 &
