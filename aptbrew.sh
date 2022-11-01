#!/usr/bin/env bash

if which apt-get; then
  CMD="sudo apt-get install -y "
elif which brew; then
  CMD="brew install "
  export NONINTERACTIVE=1
else
  echo "No brew or apt-get!"
fi

>&2 echo "$CMD $@"
sh -c "$CMD $@"

