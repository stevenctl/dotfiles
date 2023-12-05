KIND_REGISTRY_NAME="${KIND_REGISTRY_NAME:-kind-registry}"

kind delete cluster --name=ambient

read -r -d '' NODES << EOF
- role: control-plane
- role: worker
  extraMounts:
  - hostPath: /tmp/worker1-ztunnel/
    containerPath: /var/run/ztunnel/
- role: worker
EOF

if [ -n "$ONE_NODE" ]; then
  NODES="- role: control-plane"
fi

 kind create cluster --config=- <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: ambient
nodes:
$NODES
containerdConfigPatches:
- |-
  [plugins."io.containerd.grpc.v1.cri".registry.mirrors."localhost:5000"]
    endpoint = ["http://${KIND_REGISTRY_NAME}:5000"]
EOF
