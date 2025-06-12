#!/usr/bin/env sh
if pgrep -x polybar >/dev/null; then
  # Terminate already running bar instances
  killall -q polybar
  # Wait until the processes have been shut down
  while pgrep -x polybar >/dev/null; do sleep 1; done
else
  # Terminate already running bar instances
  killall -q polybar
  # Wait until the processes have been shut down
  while pgrep -x polybar >/dev/null; do sleep 1; done
  # Launch polybar
  polybar example &
fi



