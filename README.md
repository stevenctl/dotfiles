stov's dotfiles 
=================

This repo aims to setup _my_ dev environment on Linux (ubuntu) and Mac OSX.
It is most likely not going to work well for others without removing/modifying things.

## Usage

This is not well tested yet for either OS. 

Linux must have:

* git
* sudo
* apt-get
* python (TODO, make the python automatic install work)

Macs must have:

* git 
* probably some other stuff.. not sure (TODO!)

## Outline

### Software Installation

* homebrew for mac
* utils like: `yq`, `jq`, `ripgrep`.
* gcloud + kubectl
* neovim
* zsh (this will be the default shell)

### Programming Languages & Toolchains

* Python3 (including pip3)
* Go/Golang (TODO)
* Rust via rustup

### zsh with ohmyzsh

* Theme: Powerlevel10k
* Configuration: As little as I can in vimrc. Most is in separate files under ~/.oh-my-zsh/custom.

The files under `/.oh-my-zsh/custom` are separated into stages by prefixing them with a number
(ex. `0.setup.zsh`). Each one does things like adding dirs to `PATH`, exposing util `functions`
and some (ba|z)sh `VARIABLE`s I find useful.

### NeoVim

The neovim setup is customized towards being an IDE. It's probably going to be an indefinite WIP.


License
-------

This software is hereby released into the public domain. That means you can do
whatever you want with it without restriction. See `LICENSE.md` for details.

That being said, I would appreciate it if you could maintain a link back to
Dotbot (or this repository) to help other people discover Dotbot.

[dotbot]: https://github.com/anishathalye/dotbot
[fork]: https://github.com/anishathalye/dotfiles_template/fork
[template]: https://github.com/anishathalye/dotfiles_template/generate
[anishathalye_dotfiles]: https://github.com/anishathalye/dotfiles
[csivanich_dotfiles]: https://github.com/csivanich/dotfiles
[m45t3r_dotfiles]: https://github.com/m45t3r/dotfiles
[alexwh_dotfiles]: https://github.com/alexwh/dotfiles
[azd325_dotfiles]: https://github.com/Azd325/dotfiles
[wazery_dotfiles]: https://github.com/wazery/dotfiles
[thirtythreeforty_dotfiles]: https://github.com/thirtythreeforty/dotfiles
[dotbot-users]: https://github.com/anishathalye/dotbot/wiki/Users
