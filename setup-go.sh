#!/bin/bash

function install_go() {
  if [ "$(uname)" == "Darwin" ]; then
    echo "Use package from https://go.dev/doc/install"
    exit 0
  fi

  GO_VERSION=1.20.6
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
}

function install_utils() {
  go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
}

install_go
install_utils
