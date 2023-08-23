#!/usr/bin/env bash

if [ -n "${SKIP_SETUP_SCRIPTS}" ]; then
  exit 0
fi

function setup_node() {
  if [ ! -f $HOME/.nvm/nvm.sh ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
  fi
  if which node > /dev/null 2>&1; then
    return 0
  fi
  source $HOME/.nvm/nvm.sh
  nvm install node
  source $HOME/.nvm/nvm.sh
  node || nvm use node 
}

setup_node
