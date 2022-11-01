if which pip3; then exit 0; fi

if [ "$(uname)" = "Linux" ]; then
	sudo apt-get update && sudo apt-get install -y python3-pip
elif [ "$(uname)" = "Darwin" ]; then
	python3 -m ensurepip
else
	echo "$(uname) was not Linux or Darwin."
fi

