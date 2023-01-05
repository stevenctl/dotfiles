stov's dotfiles 
=================

This repo aims to setup _my_ dev environment on Linux (ubuntu) and Mac OSX.
It is most likely not going to work well for others without removing/modifying things.

Some of the things this will set up:

* homebrew for mac
* some utilities like: `yq`, `jq`, `ripgrep`, `fzf`.
* Window Management
  * For mac: [yabai](https://github.com/koekeishiya/yabai) + [skhd](https://github.com/koekeishiya/skhd)
  * For linux: i3 at some point with wayland and other cool stuff
* neovim (actually [LunarVim](https://github.com/LunarVim/LunarVim)) with heavy customization
  - An initial `PackerSync` is required.
  - Some (not all) `:mason` stuff needs to be manually installed for now.
  - Support works well for Rust, Go and Python. Other languages are untested.
* zsh (this will be the default shell) with oh-my-zsh
  - including a `~/.oh-my-zsh/custom/` with several scripts that set envs, paths, and util functions
  - The files under `/.oh-my-zsh/custom` are separated into stages by prefixing them with a number
    (ex. `0.setup.zsh`). Each one does things like adding dirs to `PATH`, exposing util `functions`
    and some (ba|z)sh `VARIABLE`s I find useful.

## Running the Installer

```shell
./install
```

This is not well tested yet for either OS. 

Prerequisites:

* git
* sudo
* apt-get (on Linux)
* python3 (the scripts will install pip)

## Outline

```
dotfiles/
├─ dotbot/ # dotbot repo as git submodule
├─ editors/ # LunarVim config and fallback .vimrc
├─ wm/ # Config for window management (i3 or yabai)
├─ zsh/ # base .zshrc, Powerlevel10k theme
   ├─ oh-my-zsh-custom/ # several util scripts sourced like .zshrc
├─ requirements.txt # some global python packages
├─ setup-*.sh # setup scripts for non-oneliners
├─ aptbrew.sh # one liner for both mac and linux
├─ install.conf.yaml # dotbot config; triggers scripts and symlinks
├─ install # script that actually triggers setup
├─ README.md
```

## Notes

Homebrew is set up inside of `install` instead of `install.conf.yaml` so that
it's properly loaded/sourced when those commands run.

At one point, I had to run the script once, then again after restarting the shell
to get things to work. This should be fixed, but I haven't tested it. 

At some point, I want to get a decent test setup using docker for both OSes.

License (from dotbot)
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
