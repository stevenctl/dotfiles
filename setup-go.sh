#!/bin/bash

if [ -n "${SKIP_SETUP_SCRIPTS}" ]; then
  exit 0
fi

function install_go() {
  GO_VERSION=1.23.0
  if which go > /dev/null 2>&1; then
    INSTALLED_VERSION=$(go version | grep -ohE '[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}')
    if [ "$GO_VERSION" == "$INSTALLED_VERSION" ]; then
      echo "Already Installed"
      return 0
    fi
  fi

  if [ "$(uname)" == "Darwin" ]; then
    echo "Use package from https://go.dev/doc/install"
    exit 0
  fi

  OS=linux
  ARCH="$(uname -m)"
  if [ "$ARCH" == "aarch64" ]; then
    ARCH="arm64"
  fi
  if [ "$ARCH" == "x86_64" ]; then
    ARCH="amd64"
  fi

  FILE="go${GO_VERSION}.${OS}-${ARCH}.tar.gz"
  if [ ! -f "${FILE}" ]; then
    URL="https://go.dev/dl/$FILE"
    echo "Downloading ${URL}"
    wget "${URL}" 
  fi
  sudo rm -rf /usr/local/go 
  sudo tar -C /usr/local -xzf "${FILE}"
  echo "Installed."
}

function install_utils() {
  go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
}

install_go
install_utils
