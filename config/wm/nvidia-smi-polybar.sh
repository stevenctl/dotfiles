#!/bin/sh

# Check if nvidia-smi is installed
if ! command -v nvidia-smi >/dev/null 2>&1; then
    echo "."
    exit 0
fi

AWK_PROG='{ print ""$1"'$2'"}'
nvidia-smi --query-gpu=$1.gpu --format=csv,noheader,nounits | awk "$AWK_PROG"
