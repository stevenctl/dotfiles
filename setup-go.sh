#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
  echo "Use package from https://go.dev/doc/install"
  exit 0
fi

GO_VERSION=1.20.5
OS=linux
ARCH="$(uname -m)"
if [ "$ARCH" == "aarch64" ]; then
  ARCH="arm64"
fi

FILE="go${GO_VERSION}.${OS}-${ARCH}.tar.gz"
if [ ! -f "${FILE}" ]; then
  URL="https://go.dev/dl/$FILE"
  echo "Downloading ${URL}"
fi
wget "${URL}" 
sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf "${FILE}"

