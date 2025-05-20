#!/usr/bin/env zsh
source ~/dotfiles/scripts/common.sh

install_cc() {
  if [[ "$(uname)" == "Darwin" ]]; then
    # macOS: install Apple's CLI tools (this gives you `/usr/bin/cc`)
    xcode-select --install

  elif command -v apt-get &>/dev/null; then
    # Debian/Ubuntu: build-essential pulls in gcc, libc-dev, make…
    sudo apt-get update
    sudo apt-get install -y build-essential

  elif command -v pacman &>/dev/null; then
    # Arch: base-devel has gcc, make, binutils, etc.
    sudo pacman -S --noconfirm --needed base-devel

  else
    echo "unsupported os" >&2
    return 1
  fi
}

install_cc
