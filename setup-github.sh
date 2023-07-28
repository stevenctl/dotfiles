#!/usr/bin/env bash

function setup_github() {
  if which pacman > /dev/null 2>&1; then
    ./aptbrew.sh github-cli
  elif which dnf > /dev/null 2>&1; then
    sudo dnf install -y gh
  elif which apt > /dev/null 2>&1; then
    # TODO this is untested on linux
    type -p curl >/dev/null || sudo apt install curl -y
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
  elif which brew > /dev/null 2>&1; then
    brew install gh
  fi
}

setup_github
