export ISTIO=$HOME/go/src/istio.io/istio
export ISTIO_VERSION=1.15.1
export ISTIO_DIR="$HOME/istio-${ISTIO_VERSION}"
export PATH="$PATH:${ISTIO_DIR}/bin"
export ENVOY_DOCKER_OPTIONS="-v $GCP_CREDENTIALS:$GCP_CREDENTIALS"

function download_istio_bin() {
	[ -d "${ISTIO_DIR}" ] && return 0
	pushd $HOME
	curl -L https://istio.io/downloadIstio | sh -
	popd
}

