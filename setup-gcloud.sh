
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

