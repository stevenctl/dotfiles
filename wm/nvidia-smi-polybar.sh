#!/bin/sh

AWK_PROG='{ print ""$1"'$2'"}'
nvidia-smi --query-gpu=$1.gpu --format=csv,noheader,nounits | awk "$AWK_PROG"
