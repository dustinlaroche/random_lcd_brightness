#!/bin/bash

# -----------------------------
# Random LCD Brightness Changer
# -----------------------------

# CONFIGURATION
BRIGHTNESS_PATH="/sys/class/backlight/amdgpu_bl1/brightness"
MAX_PATH="/sys/class/backlight/amdgpu_bl1/max_brightness"

# USER‑SET RANGE (edit these)
MIN=50        # minimum brightness value
MAX=500       # maximum brightness value
DELAY=0.25       # seconds between changes

# -----------------------------
# VALIDATION
# -----------------------------
if [ ! -f "$BRIGHTNESS_PATH" ]; then
    echo "Brightness file not found: $BRIGHTNESS_PATH"
    exit 1
fi

SYS_MAX=$(cat "$MAX_PATH")

if [ "$MAX" -gt "$SYS_MAX" ]; then
    echo "Warning: MAX exceeds system max ($SYS_MAX). Using system max."
    MAX=$SYS_MAX
fi

echo "Random brightness changer running..."
echo "Range: $MIN to $MAX"
echo "Press Ctrl+C to stop."

# -----------------------------
# MAIN LOOP
# -----------------------------
while true; do
    VALUE=$(( RANDOM % (MAX - MIN + 1) + MIN ))
    echo "$VALUE" | sudo tee "$BRIGHTNESS_PATH" > /dev/null
    sleep "$DELAY"
done

