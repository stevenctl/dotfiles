# Node
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Golang
GO_BIN_PATH="/usr/local/go/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
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

export PATH="$PATH:$HOME/.godot/"
export PATH="$PATH:/usr/share/dotnet"

# Flutter
export ANDROID_HOME="$HOME/Android/Sdk"
if [ -d "/usr/lib/android-sdk" ]; then
  export ANDROID_HOME="/usr/lib/android-sdk"
fi

export ANDROID_SDK_ROOT=$ANDROID_HOME
export CHROME_EXECUTABLE=google-chrome-stable
export FLUTTER_HOME="$HOME/flutter"
export PATH="$PATH:$FLUTTER_HOME/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/Android/Sdk/cmdline-tools/latest/bin"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
