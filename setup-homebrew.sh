#!/bin/bash

if [ "$(uname)" != "Darwin" ]; then
	echo "not a mac" && exit 0
fi

# Check if Homebrew is installed
if which brew; then
  echo 'Updating homebrew'
  brew update
else
	echo "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

