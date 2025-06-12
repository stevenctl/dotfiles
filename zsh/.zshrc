# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/dotfiles/zsh/custom"
ZSH_THEME="alanpeabody"
plugins=( git)
source $ZSH/oh-my-zsh.sh

# no vim keybindigs in the terminal
bindkey -e

# fuzzy finder (Ctrl+R: history, Ctrl+T: files)
source ~/.fzf.zsh

# history settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# autocomplete
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
