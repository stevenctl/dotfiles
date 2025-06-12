alias k=kubectl
export ISTIO=$HOME/go/src/istio.io/istio
export ZTUNNEL=$ISTIO/../ztunnel
export ISTIO_VERSION=1.25.0
export ISTIO_DIR="$HOME/istio-${ISTIO_VERSION}"
export PATH="${ISTIO_DIR}/bin:$PATH"
export ENVOY_DOCKER_OPTIONS="-v $GCP_CREDENTIALS:$GCP_CREDENTIALS"

function download_istio_bin() {
	[ -d "${ISTIO_DIR}" ] && return 0
	pushd $HOME
	curl -L https://istio.io/downloadIstio | sh -
	popd
}

function istio_build_docker_push() {
	if [ "$(pwd)" != "$ISTIO" ]; then
		echo "Must run from $ISTIO"
		return 1
	fi
  tools/docker --targets=pilot,proxyv2,app,install-cni,ztunnel --push --builder crane --hub=$HUB --tag=$TAG --variants distroless
}

function istio_build_docker() {
	if [ "$(pwd)" != "$ISTIO" ]; then
		echo "Must run from $ISTIO"
		return 1
	fi
  tools/docker --targets=pilot,proxyv2,app,install-cni,ztunnel --hub=$HUB --tag=$TAG --variants distroless
}

function istio_split_bug_report() {
  for n in nsdumps_cr nsdumps; do
    rm -rf $n; mkdir $n
  done
  cat crs | yq '.items | groupby(.metadata.namespace) | .[]' -s '"nsdumps_cr/" + .[0].metadata.namespace + ".ns.yaml"'
  cat k8s-resources | yq '.items | groupby(.metadata.namespace) | .[]' -s '"nsdumps/" + .[0].metadata.namespace + ".ns.yaml"'
}


function kfp() {
  LABEL=$1
  shift 1
  kubectl get po -lapp=${LABEL} $@ -ojsonpath='{.items[0].metadata.name}'
}

function kefp() {
  LABEL=$1
  shift 1
  echo kubectl get po -lapp=${LABEL} $@ -ojsonpath='{.items[0].metadata.name}'
  POD=$(kubectl get po -lapp=${LABEL} $@ -ojsonpath='{.items[0].metadata.name}')
  kubectl exec -it $@ $POD -- sh
}
