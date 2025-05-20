#!/usr/bin/env zsh
source ~/dotfiles/scripts/common.sh

do_install zsh


# git managed installation of ohmyzsh
if [ ! -f $HOME/.oh-my-zsh/oh-my-zsh.sh ]; then
	git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
else
	pushd ~/.oh-my-zsh
	git pull
	popd
fi
