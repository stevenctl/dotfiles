#!/usr/bin/env bash

sudo pacman -Sy --noconfirm ibus ibus-pinyin

### Add these to /etc/environment, ~/.xinitrc or ~/.xprofile 
### I'm not automating it because it's finicky on different machines.
# GTK_IM_MODULE=ibus
# QT_IM_MODULE=ibus
# XMODIFIERS=@im=ibus



# For whatever reason, I cant get fcitx5 working with i3/X.
# sudo pacman -S fcitx5-im fcitx5-chinese-addons
