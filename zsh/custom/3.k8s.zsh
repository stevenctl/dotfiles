alias k=kubectl

kfp() {
  if [[ $1 == -h || $1 == --help || -z $1 ]]; then
    cat <<-EOF
    Usage: kfp <label|selector> [kubectl options]
      <label>           shorthand for app=<label>
      <selector>        any valid label selector (e.g. foo=bar,env=prod)
      [kubectl options] any additional kubectl flags (--namespace, --context, etc.)

    Description:
      Fetches and prints the name of the first pod matching the given label or selector.
EOF
    return
  fi

  local sel
  if [[ $1 == *=* ]]; then
    sel="$1"
  else
    sel="app=$1"
  fi
  shift
  kubectl get pods -l "$sel" "$@" -o jsonpath='{.items[0].metadata.name}'
}

kefp() {
  if [[ $1 == -h || $1 == --help || -z $1 ]]; then
    cat <<-EOF
    Usage: kefp <label|selector> [kubectl options]
      <label>           shorthand for app=<label>
      <selector>        any valid label selector (e.g. foo=bar,env=prod)
      [kubectl options] any additional kubectl flags (--namespace, --context, etc.)

    Description:
      Finds the first pod matching the given label or selector and opens an interactive shell (sh) in it.
EOF
    return
  fi

  local pod
  pod=$(kfp "$@") || return
  kubectl exec "$@" -it "$pod" -- sh
}
