#!/usr/bin/env zsh
source ~/dotfiles/scripts/common.sh

do_install i3

[ -f /usr/bin/kde-i3.sh ] || sudo ln -s $HOME/dotfiles/config/i3wm/kde-i3.sh /usr/bin/kde-i3.sh
[ -f /usr/share/xsessions/kde-i3.desktop ] || sudo ln -s $HOME/dotfiles/config/i3wm/kde-i3.desktop /usr/share/xsessions/kde-i3.desktop
