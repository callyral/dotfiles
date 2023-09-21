# dotfiles

Here are my dotfiles!

## System

* [Arch Linux](https://archlinux.org/)

  Rolling-release Linux distribution.

* [GNU GRUB](https://www.gnu.org/software/grub/)

  A Multiboot boot loader.

* [Sway](https://swaywm.org)

  i3-compatible wlroots window manager.

* [Waybar](https://github.com/Alexays/Waybar)

  Status bar for Sway.

* [SDDM](https://github.com/sddm/sddm)

  X11 and Wayland display manager.

* [Wayland](https://wayland.freedesktop.org/)

  Replacement protocol for X11.

* [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin)

  A soothing pastel theme for the high-spirited.

## Screenshots

![Screenshot Number One](screenshots/1.png)

## Media

* [PipeWire](https://wiki.archlinux.org/title/PipeWire)

  Multimedia framework.

  * pipewire-alsa

  * pipewire-audio

  * pipewire-pulse

* [WirePlumber](https://wiki.archlinux.org/title/WirePlumber)

  Session/policy manager for PipeWire.

## Fonts

* Jetbrains Mono

* Font Awesome

* Noto Color Emoji

* Noto Sans

## Command-line and TUI

* [bat](https://github.com/sharkdp/bat)

  Pager.

* [bottom](https://github.com/ClementTsang/bottom)
  
  System monitor written in Rust.

* [eza](https://github.com/eza-community/eza)

  Alternative to ls written in Rust. 

* [neovim](https://neovim.io)
  
  Text editor, based on Vim.

* [zsh](https://www.zsh.org/)

  zsh, an interactive shell.

  * [antidote](https://getantidote.github.io) (requires installation)

    ```bash
    # first, run this from an interactive zsh terminal session:
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
    ```

    After that, using [my .zshrc](home/cally/.zshrc) and related files should get it working.

    Otherwise, you can [check this out](https://getantidote.github.io/install).

  * [oh my zsh](https://ohmyz.sh/)

  * [zsh autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

  * [zsh completions](https://github.com/zsh-users/zsh-completions)

  * [zsh syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## Apps

* [dunst](https://dunst-project.org/)

  Notification daemon.

* [Foot](https://codeberg.org/dnkl/foot)

  Terminal emulator.

* [Librewolf](https://librewolf.net) 
  
  Private web browser, based on Firefox. Theme is [SimpleFox](https://github.com/migueravila/SimpleFox) with some tweaks and Catppuccin Macchiato.

* [PCManFM](https://github.com/lxde/pcmanfm)

  File manager.

## Other software 

* copyq

* gammastep-indicator

* nm-applet

* [OpenTabletDriver](https://github.com/OpenTabletDriver/OpenTabletDriver)

* [wofi-emoji](https://github.com/Zeioth/wofi-emoji)

## Install the GTK Theme

* On Arch, install [catppuccin-gtk-theme-macchiato](https://aur.archlinux.org/packages/catppuccin-gtk-theme-macchiato) from the AUR and apply the peach theme.

* Otherwise, follow [these instructions](https://github.com/catppuccin/gtk).

* You can use lxappearance to switch themes, although GTK\_THEME and ICON_THEME are configured in `start_sway`

## Themes Used

[Catppuccin for dunst](https://github.com/catppuccin/dunst)

[Catppuccin for Foot](https://github.com/catppuccin/foot)

[Catppuccin for GTK](https://github.com/catppuccin/gtk)

[Catppuccin for qt5ct](https://github.com/catppuccin/qt5ct)

[Catppuccin for Waybar](https://github.com/catppuccin/waybar)

## Other themes

~~If they weren't mentioned, it's likely they're included in the dotfiles.~~

TODO

## Wallpaper

Made by me using Krita!

![A Catppuccin wallpaper with GLaDOS and an Aperture Science logo](home/cally/.config/wallpaper.png)
