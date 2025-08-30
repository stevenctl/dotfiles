#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Get dynamic modules list
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
export POLYBAR_MODULES_RIGHT="$("$SCRIPT_DIR/polybar-modules.sh")"

# Launch polybar
polybar example &



