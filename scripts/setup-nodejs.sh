#!/usr/bin/env zsh
source ~/dotfiles/scripts/common.sh

DOWNLOAD_NVM_VERSION=0.40.3

if which node > /dev/null 2>&1; then
	exit 0
fi


# code copied from https://nodejs.org/en/download

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$DOWNLOAD_NVM_VERSION/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 22

# Verify the Node.js version:
node -v # Should print "v22.15.1".
nvm current # Should print "v22.15.1".

# Verify npm version:
npm -v # Should print "10.9.2".
