export PATH="$PATH:$HOME/Android/Sdk/cmdline-tools/latest/bin"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export ANDROID_HOME="$HOME/Android/Sdk"
if [ -d "/usr/lib/android-sdk" ]; then
  export ANDROID_HOME="/usr/lib/android-sdk"
fi
export ANDROID_SDK_ROOT=$ANDROID_HOME
