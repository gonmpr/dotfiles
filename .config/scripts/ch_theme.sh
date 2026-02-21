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

# change gtk theme (TODO)
if [[ "$THEME" == *"morning"* ]] || [[ "$THEME" == *"white"* ]]; then
    gsettings set org.gnome.desktop.interface gtk-theme "Granite" 2>/dev/null
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light' 2>/dev/null
else
    gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark" 2>/dev/null
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null
fi

# kill and restart apps
killall waybar 2>/dev/null && waybar &
killall swaync 2>/dev/null
swaync &
