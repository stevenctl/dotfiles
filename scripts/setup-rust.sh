#!/usr/bin/env zsh
source ~/dotfiles/scripts/common.sh

if ! which rustup > /dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
else
  rustup update
fi



