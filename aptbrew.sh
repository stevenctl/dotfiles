#!/usr/bin/env bash

if which apt-get > /dev/null 2>&1; then
  CMD="sudo apt-get install -y "
elif which brew > /dev/null 2>&1; then
  CMD="brew install "
  export NONINTERACTIVE=1
elif which dnf > /dev/null 2>&1; then
  CMD="sudo dnf install -y "
elif which pacman > /dev/null 2>&1; then
  CMD="sudo pacman --noconfirm -Sy "
else
  echo "No brew or apt-get!"
fi

>&2 echo "$CMD $@"
sh -c "$CMD $@"

