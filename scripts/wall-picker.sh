#!/usr/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"

# Pick something then export WALLPAPER var
WALLPAPER=$(nsxiv -t -o "$WALLPAPER_DIR" | head -n 1)

# Or just exit if nothing was picked
[[ -z "$WALLPAPER" ]] && exit 0 

# Pick scheme using rofi
SCHEMES="scheme-content\nscheme-expressive\nscheme-fidelity\nscheme-fruit-salad\nscheme-monochrome\nscheme-neutral\nscheme-rainbow\nscheme-tonal-spot\nscheme-vibrant\nscheme-smart"
SELECTED_SCHEME=$(echo -e "$SCHEMES" | rofi -dmenu -i -p "M3 Scheme")
[[ -z "$SELECTED_SCHEME" ]] && exit 0

# Apply the wallpaper
awww img "$WALLPAPER" --transition-type random --transition-fps 60

# Let matugen generate the palettes
matugen image "$WALLPAPER" -j hex -t "$SELECTED_SCHEME" -m "dark"
