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

# autocomplete (compinit is already run by oh-my-zsh)


# nvm is loaded in custom/1.node.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/landow/.bun/_bun" ] && source "/home/landow/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH=/home/landow/.opencode/bin:$PATH

# Reduce Flutter/Dart LSP network chatter on slow connections
export FLUTTER_SUPPRESS_ANALYTICS=true

export PATH="$PATH:$HOME/.huse"
