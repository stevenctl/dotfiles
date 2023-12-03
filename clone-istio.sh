#!/usr/bin/env bash

mkdir -p $HOME/go/src/istio.io
pushd $HOME/go/src/istio.io
for repo in istio ztunnel test-infra common-files proxy; do
  git clone git@github.com:istio/$repo
  pushd $repo
  git remote add fork git@github.com:stevenctl/$repo
  git fetch fork
  popd
done
popd
