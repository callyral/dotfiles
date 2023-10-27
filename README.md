# dotfiles by callyral

these are my dotfiles :3

## installation

### step one: 

- make sure you have the necessary software listed in this README

### step two: 

root config (unmanaged by chezmoi)

- clone this repo

- move relevant things in [repo/path](path/) to somewhere in your `$PATH` (e.g `/usr/local/bin/`)

- move relevant things in [repo/usr](usr/) and in [repo/etc](etc/) to their respective directories in root

### step three:

- install [chezmoi](https://www.chezmoi.io) (dotfile management)

- `chezmoi init callyral`

- `chezmoi apply` to apply the dotfiles

## basic system info

[void linux](https://voidlinux.org)

- enter the void

[river](https://github.com/riverwm/river)

- dynamic wayland tiling compositor

- [swayidle](https://github.com/swaywm/swayidle)

- [swaylock](https://github.com/swaywm/swaylock)

- [Waybar](https://github.com/Alexays/Waybar)

## screenshots

![screenshot one](screenshots/1.png)

![screenshot two](screenshots/2.png)

## multimedia 

[PipeWire](https://pipewire.org)

- see [this void documentation](https://docs.voidlinux.org/config/media/pipewire.html)

- [WirePlumber](https://wiki.archlinux.org/title/WirePlumber)

  - session manager for pipewire

## fonts

[FiraCode](https://github.com/tonsky/FiraCode)

[Font Awesome](https://fontawesome.com)

[Noto Color Emoji](https://fonts.google.com/noto/specimen/Noto+Color+Emoji)

[Noto Sans](https://fonts.google.com/noto/specimen/Noto+Sans)

## terminal utilities

[bat](https://github.com/sharkdp/bat)

[bottom](https://github.com/ClementTsang/bottom)
  
- system monitor

[emptty](https://github.com/tvrzna/emptty)

- tty display manager

[eza](https://github.com/eza-community/eza)

- modern alternative to ls

[lowfetch](https://github.com/callyral/lowfetch)

- minimal system info tool by me!

[neovim](https://neovim.io)
  
- vim-based text editor

- this list contains the more major plugins. see [plugins.lua](home/dot_config/nvim/lua/executable_plugins.lua)

- [ale](https://github.com/dense-analysis/ale)

  - code linting

- [alpha](https://github.com/goolord/alpha-nvim)

  - greeter

- [catppuccin](https://github.com/catppuccin/nvim)

- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)

  - git decorations

- [mini.nvim](https://github.com/echasnovski/mini.nvim)

  - mini.tabline, mini.statusline, mini.comment, mini.pick and mini.jump2d.

- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

  - better code highlighting

[zsh](https://www.zsh.org)

- zsh, an interactive shell

- [antidote](https://getantidote.github.io)

  - [requires installation](https://getantidote.github.io/install)

  ```bash
  # first, run this from an interactive zsh terminal session:
  git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
  ```

- [zsh autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

- [zsh completions](https://github.com/zsh-users/zsh-completions)

- [zsh syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

- [zsh abbr](https://github.com/olets/zsh-abbr)

- [zsh utils](https://github.com/belak/zsh-utils)

  - completion, editor and prompt

## apps

[dunst](https://dunst-project.org)

- notification daemon

[foot](https://codeberg.org/dnkl/foot)

- terminal emulator

[firefox](https://www.mozilla.org/en-US/firefox/new/)

- TODO: add theme configuration to repo

- themed with [SimpleFox](https://github.com/migueravila/SimpleFox)

[pcmanfm](https://github.com/lxde/pcmanfm)

- graphical file manager

[zathura](https://pwmt.org/projects/zathura)

- document viewer

## other software

[CopyQ](https://github.com/hluk/CopyQ)

- clipboard management

[gammastep](https://gitlab.com/chinstrap/gammastep)

- adjust the screen's color temperature

- gammastep-indicator

  - applet for gammastep

[NetworkManager](https://networkmanager.dev/)

- network managemement

- [iwd](https://iwd.wiki.kernel.org/)

  - backend for NetworkManager

- [network-manager-applet](https://gitlab.gnome.org/GNOME/network-manager-applet)

[wofi-emoji](https://github.com/Zeioth/wofi-emoji)

- emoji selector script for wofi

## themes

[catppuccin macchiato peach](https://github.com/catppuccin/catppuccin)

- a soothing pastel theme for the high-spirited

- [catppuccin for dunst](https://github.com/catppuccin/dunst)

- [catppuccin for firefox](https://github.com/catppuccin/firefox)

- [catppuccin for foot](https://github.com/catppuccin/foot)

- [catppuccin for gtk](https://github.com/catppuccin/gtk)

  - follow [these instructions](https://github.com/catppuccin/gtk)

- [catppuccin for kvantum](https://github.com/catppuccin/Kvantum)

- [catppuccin for qt5ct](https://github.com/catppuccin/qt5ct)

- [catppuccin for waybar](https://github.com/catppuccin/waybar)

## wallpaper

made by me using [krita](https://krita.org)

![A Catppuccin-themed wallpaper with GLaDOS and an Aperture Science logo](home/dot_config/wallpaper.png)
