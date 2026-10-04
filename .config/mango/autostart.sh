#!/bin/bash

# Autostart xdg-desktop-portal-wlr
/usr/lib/xdg-desktop-portal-wlr &

# Keep clipboard content after app closes
wl-clip-persist --clipboard regular --reconnect-tries 0 &

# Watch clipboard and store history
wl-paste --type text --watch cliphist store &
