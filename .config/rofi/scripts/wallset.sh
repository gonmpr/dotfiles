#!/bin/bash

CURRENT_THEME=$(cat "$HOME/.cache/current_theme" 2>/dev/null || echo "moki")
BASE_DIR="$HOME/.config/themes"
WALLPAPER_DIR="$HOME/Imágenes/Wallpapers"
MAX=8

# Obtener lista de wallpapers
mapfile -t files < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \))
count=${#files[@]}
lines=$(( count > MAX ? MAX : count ))

# Seleccionar wallpaper
img=$(printf '%s\n' "${files[@]##*/}" \
    | rofi -theme "$BASE_DIR/$CURRENT_THEME/rofi/wallset.rasi" \
           -dmenu \
           -lines "$lines" \
           -p "🖼️")

[ -z "$img" ] && exit 0

# Aplicar wallpaper
swww img "$WALLPAPER_DIR/$img" --transition-type grow --transition-duration 1.2 --transition-fps 60

# Opcional: Guardar wallpaper actual
echo "$img" > "$HOME/.cache/current_wallpaper"
