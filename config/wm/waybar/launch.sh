#!/bin/bash


CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css $HOME/.cache/wal/colors-waybar.css"

reloader() {
  trap "killall waybar" EXIT
  while true; do
      waybar &
      inotifywait -e create,modify $CONFIG_FILES
      killall waybar
  done
}

noreload() {
  waybar &
  exit 0
}

start() {
  # reloader should only have one instance
  (flock -n 100 || noreload; reloader) 100>~/dotfiles/config/wm/waybar/launch.lock 
}

killall waybar || start
