#!/bin/bash

# Base modules that are always shown
MODULES_RIGHT="filesystem pulseaudio memory cpu temperature"

# Check for NVIDIA GPU
if command -v nvidia-smi >/dev/null 2>&1; then
    MODULES_RIGHT="$MODULES_RIGHT system-nvidia-smi system-nvidia-smi-temp"
fi

# Check for battery
if [ -d /sys/class/power_supply/ ]; then
    for supply in /sys/class/power_supply/BAT*; do
        if [ -e "$supply" ]; then
            MODULES_RIGHT="$MODULES_RIGHT battery"
            break
        fi
    done
fi

# Add network and date modules at the end
MODULES_RIGHT="$MODULES_RIGHT wlan eth date"

echo "$MODULES_RIGHT"