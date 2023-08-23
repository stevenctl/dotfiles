#!/usr/bin/env bash

if [ -n "${SKIP_SETUP_SCRIPTS}" ]; then
  exit 0
fi

gcloud components install kubectl
go install sigs.k8s.io/kind@latest
