#!/usr/bin/env zsh
source ~/dotfiles/scripts/common.sh

do_install i3

sudo rm /usr/local/bin/kde-i3.sh
sudo rm /usr/share/xsessions/kde-i3.desktop
[ -f /usr/bin/kde-i3.sh ] || sudo cp $HOME/dotfiles/config/i3wm/kde-i3.sh /usr/local/bin/kde-i3.sh
[ -f /usr/share/xsessions/kde-i3.desktop ] || sudo cp $HOME/dotfiles/config/i3wm/kde-i3.desktop /usr/share/xsessions/kde-i3.desktop
