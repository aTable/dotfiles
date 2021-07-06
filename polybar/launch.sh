#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

### start the main polybar for all monitors
for monitor in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$monitor polybar --reload monitor-main &
done

### start the auxiliary polybar for non-primary monitors
# for monitor in $(polybar --list-monitors | grep --invert-match primary | cut -d":" -f1); do
#     MONITOR=$monitor polybar --reload monitor-auxiliary &
# done

echo "Polybar launched..."

