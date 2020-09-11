#!/bin/sh

CONF_PATH="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# source env vars
source "$CONF_PATH/env"

# Launch polybars for every connected monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" = "eDP-1" ]; then
        MONITOR=$m polybar -c "$CONF_PATH/config" main &
    else
        MONITOR=$m polybar -c "$CONF_PATH/config" secondary &
    fi
  done
else
  polybar -c "$CONF_PATH/config" main &
fi

echo "Bars launched..."

