#!/usr/bin/env bash

# fzf
if [ ! -d $HOME/.fzf ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
~/.fzf/install --all

# yq & jq
which yq || go install github.com/mikefarah/yq/v4@latest
which jq || ./aptbrew.sh jq

# cool rust powered stuff
cargo install bottom # top
cargo install bat # cat

# things i'm trying out for now
go install github.com/jesseduffield/lazydocker@latest

