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

