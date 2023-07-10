#!/usr/bin/env bash
rm -rf $HOME/.local/share/lunarvim.old/
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

