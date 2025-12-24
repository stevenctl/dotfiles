#!/usr/bin/env sh

#!/usr/bin/env sh

if pgrep -x polybar >/dev/null; then
    killall -q polybar
else
    SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
    export POLYBAR_MODULES_RIGHT="$("$SCRIPT_DIR/polybar-modules.sh")"

    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar example &
    done
fi
