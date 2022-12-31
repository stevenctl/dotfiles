#!/usr/bin/env bash

function setup_yabai() {
	if [ "$(uname)" != "Darwin" ]; then
		return 0
	fi
  brew install koekeishiya/formulae/yabai
  brew services start yabai
}

function setup_skhd() {
	if [ "$(uname)" != "Darwin" ]; then
		return 0
	fi
  brew install koekeishiya/formulae/skhd
  brew services start skhd
}

setup_yabai
setup_skhd
# TODO i3?

