# Node
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Golang
GO_BIN_PATH="/usr/local/go/bin"
WEBI_GO="$([ -d $HOME/.local/opt/ ] && ls $HOME/.local/opt/ | grep go-v)"
[ -n "${WEBI_GO}" ] && GO_BIN_PATH="$HOME/.local/opt/${WEBI_GO}/bin"
export PATH="$PATH:$GO_BIN_PATH"
export PATH="$PATH:$HOME/go/bin"
export GOPATH="$HOME/go"

# export LD_LIBRARY_PATH="/home/landow/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib:${LD_LIBRARY_PATH}"
#
#

export DOTNET_ROOT=/usr/local/share/dotnet

if [ $(uname) = "Darwin" ]; then
  export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
fi
