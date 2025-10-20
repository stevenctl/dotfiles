#!/usr/bin/env zsh
source ~/dotfiles/scripts/common.sh

install_go() {
  local GO_VERSION="1.25.3"
  if command -v go &>/dev/null; then
    local INSTALLED_VERSION
    INSTALLED_VERSION=$(go version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
    [[ $INSTALLED_VERSION == $GO_VERSION ]] && echo "Already Installed" && return 0
  fi

  if [[ $(uname) == Darwin ]]; then
    echo "Use package from https://go.dev/doc/install"
    return 0
  fi

  local OS="linux"
  local ARCH=$(uname -m)
  [[ $ARCH == aarch64 ]] && ARCH=arm64
  [[ $ARCH == x86_64  ]] && ARCH=amd64

  local FILE="go${GO_VERSION}.${OS}-${ARCH}.tar.gz"
  [[ ! -f $FILE ]] && {
    local URL="https://go.dev/dl/$FILE"
    echo "Downloading ${URL}"
    wget "$URL"
  }

  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf "$FILE"
  echo "Installed."
  rm "$FILE"
}

install_utils() {
  go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
}

install_go
install_utils

