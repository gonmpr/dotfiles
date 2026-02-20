#!/bin/bash

THEME="$1"
BASE_DIR="/home/gonmpr/.config/themes"
CACHE_FILE="$HOME/.cache/current_theme"

if [ ! -d "$BASE_DIR/$THEME" ]; then
    echo "El tema '$THEME' no existe"
    exit 1
fi

# save theme
echo "$THEME" > "$CACHE_FILE"

# update configs files
echo "@import \"../themes/$THEME/waybar/style.css\";" > ~/.config/waybar/style.css
echo "@import \"../themes/$THEME/swaync/style.css\";" > ~/.config/swaync/style.css
echo "@import \"$BASE_DIR/$THEME/rofi/launcher.rasi\"" > ~/.config/rofi/config.rasi


killall waybar 2>/dev/null && waybar &
killall swaync 
swaync &

