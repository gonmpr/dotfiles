#!/bin/bash

CURRENT_THEME=$(cat "$HOME/.cache/current_theme" 2>/dev/null || echo "moki")
BASE_DIR="$HOME/.config/themes"

rofi -show drun \
     -window-title "menu" \
     -theme "$BASE_DIR/$CURRENT_THEME/rofi/launcher.rasi"
