#!/usr/bin/env bash

# fzf
if [ ! -d $HOME/.fzf ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
~/.fzf/install --all

# yq & jq
which yq > /dev/null || go install github.com/mikefarah/yq/v4@latest
which jq > /dev/null || ./aptbrew.sh jq

# cool rust powered stuff
cargo install bottom # top
cargo install bat # cat
cargo install ripgrep # cat

# things i'm trying out for now
go install github.com/jesseduffield/lazydocker@latest

