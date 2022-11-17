#!/usr/bin/env bash

PREFIX=https://github.com/neovim/neovim/releases/latest/download/

if which nvim; then
	echo "neovim already installed"
elif [ "$(uname)" = "Linux" ]; then
	rm nvim-linux64.deb || echo "noop"
        wget "${PREFIX}/nvim-linux64.deb"
	DEBIAN_FRONTEND=noninteractive sudo dpkg -i nvim-linux64.deb
elif [ "$(uname)" = "Darwin" ]; then
	brew install neovim # TODO ensure this gets the latest version
else
	echo "$(uname) was not Linux or Darwin."
fi

if [ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

pip3 install pynvim
npm i -g neovim
which tree-sitter || npm i -g tree-sitter-cli
curl -sS https://webi.sh/nerdfont | sh

nvim --headless +PackerSync +qa

