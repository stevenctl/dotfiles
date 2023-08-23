#!/usr/bin/env bash

if [ -n "${SKIP_SETUP_SCRIPTS}" ]; then
  exit 0
fi

function setup_gcp() {
	if uname | grep -i linux; then
    VERSION=440.0.0
    ARCH="$(uname -m)"
    if [ "$ARCH" == "aarch64" ] || [ "$ARCH" == "arm64" ]; then
      ARCH="arm"
    fi
    if [ "$ARCH" == "amd64" ]; then
      ARCH="x86_64"
    fi
    FILE="google-cloud-cli-$VERSION-linux-$ARCH.tar.gz"
    pushd $HOME
    curl -O "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$FILE"
    tar -xf "$FILE"    
    ./google-cloud-sdk/install.sh
    popd
	elif uname | grep -i darwin; then
		brew install --cask google-cloud-sdk	
	else
		echo "Can't setup gcloud. Unknown $(uname -a). Must contain 'Darwin' or 'Linux'."
	fi
  source $HOME/.oh-my-zsh/custom/1.gcp.zsh
  gcloud init
}

if ! which gcloud > /dev/null ; then
	setup_gcp
fi

