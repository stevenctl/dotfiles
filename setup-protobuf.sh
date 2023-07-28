#!/usr/bin/env bash

PACKAGE=protobuf-compiler
if which brew > /dev/null 2>&1 || which pacman > /dev/null 2>&1; then
  PACKAGE=protobuf
fi  
./aptbrew.sh $PACKAGE
