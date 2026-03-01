#!/run/current-system/sw/bin/bash

startd=$(pgrep waybar)

if [ -n "$startd" ]; then
  pkill waybar

else
  waybar -c ~/.config/waybar/config -s ~/.config/waybar/style.css
fi
