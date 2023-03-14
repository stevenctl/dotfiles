export ISTIO=$HOME/go/src/istio.io/istio
export ZTUNNEL=$ISTIO/../ztunnel
export ISTIO_VERSION=1.17.1
export ISTIO_DIR="$HOME/istio-${ISTIO_VERSION}"
export PATH="$PATH:${ISTIO_DIR}/bin"
export ENVOY_DOCKER_OPTIONS="-v $GCP_CREDENTIALS:$GCP_CREDENTIALS"

function download_istio_bin() {
	[ -d "${ISTIO_DIR}" ] && return 0
	pushd $HOME
	curl -L https://istio.io/downloadIstio | sh -
	popd
}

function istio_build_core() {
	if [ "$(pwd)" != "$ISTIO" ]; then
		echo "Must run from $ISTIO"
		return 1
	fi
  tools/docker --targets=pilot,proxyv2,app,install-cni,ztunnel --hub=$HUB --tag=$TAG --push
}

function istioctl_install() {
	if [ "$(pwd)" != "$ISTIO" ]; then
		echo "Must run from $ISTIO"
		return 1
	fi
	go run ./istioctl/cmd/istioctl install -y --manifests manifests --set hub=$HUB --set tag=$TAG $@
}

function istioctl_install_ambient() {
	if [ "$(pwd)" != "$ISTIO" ]; then
		echo "Must run from $ISTIO"
		return 1
	fi
  go run ./istioctl/cmd/istioctl install -y --manifests manifests --set hub=$HUB --set tag=$TAG --set profile=ambient $@ 
}

function split_bug_report() {
  for n in nsdumps_cr nsdumps; do
    rm -rf $n; mkdir $n
  done
  cat crs | yq '.items | groupby(.metadata.namespace) | .[]' -s '"nsdumps_cr/" + .[0].metadata.namespace + ".ns.yaml"'
  cat k8s-resources | yq '.items | groupby(.metadata.namespace) | .[]' -s '"nsdumps/" + .[0].metadata.namespace + ".ns.yaml"'
}
