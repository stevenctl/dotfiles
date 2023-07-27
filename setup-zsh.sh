# Download zsh
if which zsh; then
	echo "zsh already installed"
elif which brew; then
	brew install zsh
elif which apt-get; then
	sudo apt-get update
	sudo apt-get -y install zsh unzip
elif which dnf; then
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
if [ "${SHELL}" != "zsh" ] && which chsh; then
  echo 'Changing default shell to zsh'
  sudo chsh -s /bin/zsh $USER
fi

