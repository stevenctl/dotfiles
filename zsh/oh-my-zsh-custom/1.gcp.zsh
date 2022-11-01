function setup_gcp() {
	if uname | grep -i linux; then
		sudo apt-get install -y apt-transport-https ca-certificates gnupg

		echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list
		curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg
	
	
		sudo apt-get update && sudo apt-get install -y google-cloud-cli kubectl
		gcloud init
	elif uname | grep -i darwin; then
		brew install --cask google-cloud-sdk	
	else
		echo "Can't setup gcloud. Unknown $(uname -a). Must contain 'Darwin' or 'Linux'."
	fi
}

if ! which gcloud > /dev/null ; then
	setup_gcp
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/landow/google-cloud-sdk/path.zsh.inc' ]; then . '/home/landow/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/landow/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/landow/google-cloud-sdk/completion.zsh.inc'; fi

# This may be annoying in some environments, but for most of my work I need it. 
export GCP_CREDENTIALS="${HOME}/.config/gcloud/application_default_credentials.json"
if [ ! -f "${GCP_CREDENTIALS}" ]; then gcloud auth application-default login; fi

