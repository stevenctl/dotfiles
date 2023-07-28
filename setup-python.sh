#!/usr/bin/env bash

if ! which pip3 > /dev/null 2>&1; then
  if which apt-get > /dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y python3-full
  elif [ "$(uname)" = "Darwin" ]; then
    if ! which python3 > /dev/null 2>&1; then
      brew install python3
    fi
    python3 -m ensurepip
  elif which dnf > /dev/null 2>&1; then
    dnf install python3 
  elif which pacman > /dev/null 2>&1; then
    sudo pacman -Sy python-pip
  else
    echo "No supported package manager"
  fi
fi

# manjaro/arch doesn't like this (probably for good reason)
which pacman > /dev/null || pip3 install -r requirements.txt

