#!/bin/sh

CONF_PATH="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# source env vars
source "$CONF_PATH/env"

# Launch polybars for every connected monitor
polybar -c "$CONF_PATH/config" main &

echo "Bars launched..."

