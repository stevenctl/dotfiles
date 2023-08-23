#!/usr/bin/env bash

if [ -n "${SKIP_SETUP_SCRIPTS}" ]; then
  exit 0
fi

if ! which rustup > /dev/null 2>&1; then
  curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path -c rust-analyzer -c clippy
else
  rustup update
fi

