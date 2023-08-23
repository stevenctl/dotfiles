# Download zsh

if [ -n "${SKIP_SETUP_SCRIPTS}" ]; then
  exit 0
fi

if which zsh > /dev/null 2>&1; then
	echo "zsh already installed"
elif which brew > /dev/null 2>&1; then
	brew install zsh
elif which apt-get > /dev/null 2>&1; then
	sudo apt-get update
	sudo apt-get -y install zsh unzip
elif which dnf > /dev/null 2>&1; then
	sudo dnf update -y
	sudo dnf install -y zsh unzip
else
	echo "Either brew or apt-get must be available".
	exit 1
fi

# Check if oh-my-zsh is installed
if [ ! -f $HOME/.oh-my-zsh/oh-my-zsh.sh ]; then
  echo 'Installing oh-my-zsh'
  rm -rf $HOME/.oh-my-zsh
  /bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  rm -rf $HOME/.oh-my-zsh/custom
fi

# Change default shell 
# TODO i think it's different on mac)
# in silverblue i'm editing /etc/conf
if [ "${SHELL}" != "zsh" ] && which chsh > /dev/null 2>&1; then
  echo 'Changing default shell to zsh'
  sudo chsh -s /bin/zsh $USER
fi

