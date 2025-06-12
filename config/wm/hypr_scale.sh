#!/usr/bin/env bash

get_adjacent_item() {
  local array=("1.00" "1.25" "1.33" "2.00")
  local element="$1"
  local direction="$2"  # "next" or "prev"

  for i in "${!array[@]}"; do
    if [[ "${array[$i]}" == "$element" ]]; then
      if [[ "$direction" == "next" ]]; then
        next_index=$(( (i + 1) % ${#array[@]} ))
      elif [[ "$direction" == "prev" ]]; then
        next_index=$(( (i - 1 + ${#array[@]}) % ${#array[@]} ))
      else
        echo "Invalid direction. Use 'next' or 'prev'."
        return
      fi

      echo "${array[$next_index]}"
      return
    fi
  done

  echo "Element not found in the array"
}

MONITOR_NAME=$(hyprctl -j monitors | jq -r '.[] | select(.focused) | .name')
CURRENT_SCALE=$(hyprctl -j monitors | jq -r '.[] | select(.focused) | .scale')
NEXT_SCALE=$(get_adjacent_item $CURRENT_SCALE $1)
hyprctl keyword monitor "$MONITOR_NAME,preferred,auto,$NEXT_SCALE"
notify-send -t 1000 "$MONITOR_NAME: $NEXT_SCALE"

