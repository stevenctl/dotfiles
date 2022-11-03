#!/usr/bin/env bash

if which pip3; then exit 0; fi

if [ "$(uname)" = "Linux" ]; then
	sudo apt-get update && sudo apt-get install -y python3-pip
elif [ "$(uname)" = "Darwin" ]; then
	if ! which python3; then
		brew install python3
	fi
	python3 -m ensurepip
else
	echo "$(uname) was not Linux or Darwin."
fi

