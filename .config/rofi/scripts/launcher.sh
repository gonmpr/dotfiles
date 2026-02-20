#!/bin/bash
# ~/.config/rofi/scripts/menu.sh

# Leer tema actual
CURRENT_THEME=$(cat "$HOME/.cache/current_theme" 2>/dev/null || echo "moki")
BASE_DIR="$HOME/.config/themes"

# Ejecutar rofi con el tema correspondiente
rofi -show drun \
     -window-title "menu" \
     -theme "$BASE_DIR/$CURRENT_THEME/rofi/launcher.rasi"
