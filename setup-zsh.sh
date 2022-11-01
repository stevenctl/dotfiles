# Download zsh
if which zsh; then
	echo "zsh already installed"
elif which brew; then
	brew install zsh
elif which apt-get; then
	sudo apt-get update
	sudo apt-get -y install zsh
else
	echo "Either brew or apt-get must be available".
	exit 1
fi

# Check if oh-my-zsh is installed
echo 'Installing oh-my-zsh'
rm -rf $HOME/.oh-my-zsh
/bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -rf $HOME/.oh-my-zsh/custom

# Change default shell
if [ ! $0 = "-zsh" ]; then
  echo 'Changing default shell to zsh'
  sudo chsh -s /bin/zsh
else
  echo 'Already using zsh'
fi

