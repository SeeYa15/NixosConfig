#!/usr/bin/env bash

SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

set_30hz() {
  sleep 2
  hyprctl keyword monitor "DVI-I-1,1280x720@30,1920x0,1"
  hyprctl keyword monitor "DVI-I-2,1280x720@30,4480x0,1"
}

# Apply on startup if already connected
CONNECTED=$(hyprctl monitors all | grep -c "DVI-I")
if [ "$CONNECTED" -gt 0 ]; then
  set_30hz
fi

socat - "UNIX-CONNECT:$SOCKET" | while read -r line; do
  case "$line" in
    monitoradded>>DVI-I*)
      set_30hz
      ;;
  esac
done