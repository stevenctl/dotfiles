XMODIFIERS=@im=fcitx
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx

# Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export DISABLE_AUTO_UPDATE=true
export ZSH_THEME="alanpeabody"
export ZSH="$HOME/.oh-my-zsh"
plugins=(git kubectl kubectx)
export ZSH_CUSTOM=~/dotfiles/zsh/oh-my-zsh-custom
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Don't make the terminal use vim keybindings
bindkey -e

# Fuzzy Finder
source ~/.fzf.zsh

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# setup autocompletion
zstyle :compinstall filename '/home/landow/.zshrc'
autoload -Uz compinit
compinit

# MAN
export MANPAGER="lvim -c 'Man!' -o -"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/llvm/bin:$PATH"


INPUT_METHOD=fcitx
GTK_IM_MODULE=fcitx
SDL_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
GLFW_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
IMSETTINGS_MODULE=fcitx

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/landow/google-cloud-sdk/path.zsh.inc' ]; then . '/home/landow/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/landow/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/landow/google-cloud-sdk/completion.zsh.inc'; fi
