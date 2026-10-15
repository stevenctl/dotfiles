export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# --no-use skips nvm's slow version resolution; put the newest installed node on PATH directly
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
_nvm_latest=($NVM_DIR/versions/node/v*(NnOn[1]))
[ -n "$_nvm_latest" ] && export PATH="$_nvm_latest/bin:$PATH"
unset _nvm_latest
