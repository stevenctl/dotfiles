#!/usr/bin/env zsh


function ind_registry() {
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
	kind_registry
	KIND_CONFIG="${KIND_CONFIG:-$HOME/dotfiles/zsh/custom/kind/kind-cluster.yaml}"
	kind delete cluster --name istio-localdev || true
	kind create cluster --config "${KIND_CONFIG}"
	kind_registry
}
