#!/usr/bin/env bash

function setup_node() {
  if ! which nvm; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
  fi
  source $HOME/.nvm/nvm.sh
  nvm install node
  source $HOME/.nvm/nvm.sh
  node || nvm use node 
}

setup_node
