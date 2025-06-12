#!/usr/bin/env zsh
source ~/dotfiles/scripts/common.sh

# fzf
if [ ! -d $HOME/.fzf ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
~/.fzf/install --all

# yq & jq
go install github.com/mikefarah/yq/v4@latest
do_install jq

# rg: ripgrep is used in neovim plugins and it's just useful
cargo install ripgrep

