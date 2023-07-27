#!/usr/bin/env bash

if which dnf; then
  sudo dnf install -y protobuf-compiler
elif which apt-get; then
  sudo apt-get install -y protobuf-compiler
elif which brew; then
  brew install protobuf
fi
