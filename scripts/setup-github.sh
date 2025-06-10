#!/usr/bin/env zsh
source ~/dotfiles/scripts/common.sh

if [ -n "$SKIP_GITHUB" ]; then
  exit 0
fi

function setup_github() {
  if which pacman > /dev/null 2>&1; then
    do_install github-cli
  elif which apt > /dev/null 2>&1; then
    # TODO untested
    type -p curl >/dev/null || sudo apt install curl -y
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && do_install gh
  elif which brew > /dev/null 2>&1; then
    brew install gh
  fi
}

setup_gh_ssh() {
  if ! gh auth status --hostname github.com; then
    gh auth login --hostname github.com --scopes admin:public_key --web -p ssh
  fi
}

setup_github
setup_gh_ssh
