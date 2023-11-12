#!/bin/bash

if [ -n "${SKIP_SETUP_SCRIPTS}" ]; then
  exit 0
fi

function setup_brew() {
	if [ "$(uname)" != "Darwin" ]; then
		echo "not a mac" && return 0
	fi

	# Check if Homebrew is installed
	if which brew; then
	  echo 'Updating homebrew'
	  brew update
	else
		echo "Installing Homebrew"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
}
setup_brew

