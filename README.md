# dotfiles by callyral

these are my dotfiles :3

recently switched from arch to void linux! repo will see changes

## installation

chezmoi:

- install [chezmoi](https://www.chezmoi.io)

- `chezmoi init callyral`

- `chezmoi apply` to apply the dotfiles

extra steps:

- move [start-sway](path/start-sway) to somewhere in your `$PATH` (e.g `/usr/local/bin/start-sway`)

- replace `/usr/share/wayland-sessions/sway.desktop` with [sway.desktop](usr/share/wayland-sessions/sway.desktop)

- install required software (linked in this README)

- TODO: complete list

## system info

[void linux](https://voidlinux.org)

[sway](https://swaywm.org)

- i3-compatible wlroots window manager

- [hyprpicker](https://github.com/hyprwm/hyprpicker)

- [swayidle](https://github.com/swaywm/swayidle)

- [swaylock](https://github.com/swaywm/swaylock)

- [waybar](https://github.com/Alexays/Waybar)

[catppuccin macchiato](https://github.com/catppuccin/catppuccin)

- a soothing pastel theme for the high-spirited

[emptty](https://github.com/tvrzna/emptty)

- command-line display manager

## screenshots

TODO: update screenshots

![screenshot one](screenshots/1.png)

![screenshot two](screenshots/2.png)

## multimedia 

[pipewire](https://wiki.archlinux.org/title/PipeWire)

- see [void - pipewire](https://docs.voidlinux.org/config/media/pipewire.html)

- [wireplumber](https://wiki.archlinux.org/title/WirePlumber)

  - session manager for pipewire

## fonts

[fira code](https://github.com/tonsky/FiraCode)

[font awesome](https://fontawesome.com)

[noto color emoji](https://fonts.google.com/noto/specimen/Noto+Color+Emoji)

[noto sans](https://fonts.google.com/noto/specimen/Noto+Sans)

## terminal utilities

[bat](https://github.com/sharkdp/bat)

[bottom](https://github.com/ClementTsang/bottom)
  
- system monitor

[eza](https://github.com/eza-community/eza)

- modern alternative to ls

[kittyfetch](https://github.com/callyral/kittyfetch)

- fetch system info (comes with free ascii cat)

[neovim](https://neovim.io)
  
- vim-based text editor

[zsh](https://www.zsh.org/)

- zsh, an interactive shell

- [antidote](https://getantidote.github.io) (requires installation)

  ```bash
  # first, run this from an interactive zsh terminal session:
  git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
  ```

  if that doesn't work, [check this out](https://getantidote.github.io/install)

- [oh my zsh](https://ohmyz.sh)

- [zsh autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

- [zsh completions](https://github.com/zsh-users/zsh-completions)

- [zsh syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## apps

[dunst](https://dunst-project.org)

- notification daemon

[foot](https://codeberg.org/dnkl/foot)

- terminal emulator

[firefox](https://www.mozilla.org/en-US/firefox/new/)

- TODO: add theme configuration to repo

- themed with [simplefox](https://github.com/migueravila/SimpleFox)

[pcmanfm](https://github.com/lxde/pcmanfm)

- graphical file manager

[zathura](https://pwmt.org/projects/zathura)

- document viewer

## other software

[copyq](https://github.com/hluk/CopyQ)

- clipboard management

[gammastep-indicator](https://gitlab.com/chinstrap/gammastep)

- night light (applet)

nm-applet

- network managemement (applet)

[wofi-emoji](https://github.com/Zeioth/wofi-emoji)

- emoji selector script for wofi

## gtk theme 

follow [catppuccin gtk instructions](https://github.com/catppuccin/gtk)

## themes

[catppuccin for dunst](https://github.com/catppuccin/dunst)

[catppuccin for foot](https://github.com/catppuccin/foot)

[catppuccin for gtk](https://github.com/catppuccin/gtk)

[catppuccin for kvantum](https://github.com/catppuccin/Kvantum)

[catppuccin for qt5ct](https://github.com/catppuccin/qt5ct)

[catppuccin for waybar](https://github.com/catppuccin/waybar)

## wallpaper

made by me using [krita](https://krita.org)

![A Catppuccin-themed wallpaper with GLaDOS and an Aperture Science logo](home/dot_config/wallpaper.png)
