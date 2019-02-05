#!/bin/bash

# Terminate already running polybar instances
killall -q polybar

# Wait until processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
# polybar [barname] [&]
polybar main -r &

echo "Bars launched..."
