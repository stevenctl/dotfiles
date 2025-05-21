#!/usr/bin/env zsh

mkdir -p $HOME/go/src/istio.io
pushd $HOME/go/src/istio.io
for repo in istio ztunnel test-infra common-files proxy tools; do
  git clone git@github.com:istio/$repo
  pushd $repo
  GH_USER=$(ssh -T git@github.com 2>&1|sed -r 's/.* (.*)! .*/\1/g')
  if [ -n $GH_USER ]; then
    git remote add fork git@github.com:$GH_USER/$repo
    git fetch fork
  fi
  popd
done
popd
