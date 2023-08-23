#!/usr/bin/env bash

if [ -n "${SKIP_SETUP_SCRIPTS}" ]; then
  exit 0
fi

PACKAGE=protobuf-compiler
if which brew > /dev/null 2>&1 || which pacman > /dev/null 2>&1; then
  PACKAGE=protobuf
fi  
./aptbrew.sh $PACKAGE
