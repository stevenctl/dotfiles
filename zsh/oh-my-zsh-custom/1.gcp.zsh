# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# This may be annoying in some environments, but for most of my work I need it. 
# export GCP_CREDENTIALS="${HOME}/.config/gcloud/application_default_credentials.json"
# if which gcloud > /dev/null && [ ! -f "${GCP_CREDENTIALS}" ]; then gcloud auth application-default login; fi

