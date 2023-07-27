#!/usr/bin/env bash

if ! which pip3; then
  if which apt-get; then
    sudo apt-get update && sudo apt-get install -y python3-full
  elif [ "$(uname)" = "Darwin" ]; then
    if ! which python3; then
      brew install python3
    fi
    python3 -m ensurepip
  elif which dnf; then
    dnf install python3 
  else
    echo "No supported package manager"
  fi
fi
pip3 install -r requirements.txt

