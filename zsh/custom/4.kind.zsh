#!/usr/bin/env zsh


function kind_registry() {
	export KIND_REGISTRY_NAME="kind-registry"
	export KIND_REGISTRY_PORT="5000"
	export KIND_REGISTRY="localhost:${KIND_REGISTRY_PORT}"
	export KIND_REGISTRY_DIR="/etc/containerd/certs.d/localhost:${KIND_REGISTRY_PORT}"
  # initialize DEVCONTAINER if not set
  DEVCONTAINER="${DEVCONTAINER:-}"

  # create a registry container if it not running already
  running="$(docker inspect -f '{{.State.Running}}' "${KIND_REGISTRY_NAME}" 2>/dev/null || true)"
  if [[ "${running}" != 'true' ]]; then
      docker run \
        -d --restart=always -p "${KIND_REGISTRY_PORT}:5000" --name "${KIND_REGISTRY_NAME}" \
        gcr.io/istio-testing/registry:2

    # Allow kind nodes to reach the registry
    docker network connect "kind" "${KIND_REGISTRY_NAME}"
  fi

  # https://docs.tilt.dev/choosing_clusters.html#discovering-the-registry
  for cluster in $(kind get clusters); do
    # TODO get context/config from existing variables
    if [[ "${DEVCONTAINER}" ]]; then
      kind export kubeconfig --name="${cluster}" --internal
    else
      kind export kubeconfig --name="${cluster}"
    fi
    for node in $(kind get nodes --name="${cluster}"); do
      docker exec "${node}" mkdir -p "${KIND_REGISTRY_DIR}"
      cat <<EOF | docker exec -i "${node}" cp /dev/stdin "${KIND_REGISTRY_DIR}/hosts.toml"
[host."http://${KIND_REGISTRY_NAME}:5000"]
EOF

      kubectl annotate node "${node}" "kind.x-k8s.io/registry=kind-registry:${KIND_REGISTRY_PORT}" --overwrite;
    done

    # Document the local registry
    cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: local-registry-hosting
  namespace: kube-public
data:
  localRegistryHosting.v1: |
    host: "localhost:${KIND_REGISTRY_PORT}"
    help: "https://kind.sigs.k8s.io/docs/user/local-registry/"
EOF
  done
}



function kind_registry() {
	# create registry container unless it already exists
	reg_name='kind-registry'
	reg_port='5000'
	running="$(docker inspect -f '{{.State.Running}}' "${reg_name}" 2>/dev/null || true)"
	if [ "${running}" != 'true' ]; then
		docker run \
			-d --restart=always -p "127.0.0.1:${reg_port}:5000" --name "${reg_name}" \
			registry:2
	fi

	docker network connect "kind" "${reg_name}" || true

	REGISTRY_DIR="/etc/containerd/certs.d/localhost:${reg_port}"
	for node in $(kind get nodes); do
		docker exec "${node}" mkdir -p "${REGISTRY_DIR}"
		cat <<EOF | docker exec -i "${node}" cp /dev/stdin "${REGISTRY_DIR}/hosts.toml"
[host."http://${reg_name}:5000"]
EOF
	done

	cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: local-registry-hosting
  namespace: kube-public
data:
  localRegistryHosting.v1: |
    host: "localhost:${reg_port}"
    help: "https://kind.sigs.k8s.io/docs/user/local-registry/"
EOF
}


function make_kind_cluster() {
	local cluster_name="${1:-istio-localdev}"
	kind_registry
	KIND_CONFIG="${KIND_CONFIG:-$HOME/dotfiles/zsh/custom/kind/kind-cluster.yaml}"
	kind delete cluster --name "${cluster_name}" || true
	kind create cluster --name "${cluster_name}" --config "${KIND_CONFIG}"
	kind_registry
}

function kind_export_kubeconfig() {
    clusters=("${(s: :)$(kind get clusters | tr '\n' ' ')}")
    for cluster in "${clusters[@]}"; do
        if [[ -n "${cluster// }" ]]; then
            kind export kubeconfig --name "$cluster"
        fi
    done
}
