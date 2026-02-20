#!/bin/bash

CURRENT_THEME=$(cat "$HOME/.cache/current_theme" 2>/dev/null || echo "moki")
BASE_DIR="$HOME/.config/themes"
WALLPAPER_DIR="$HOME/Imágenes/Wallpapers"
CURRENT_WALLPAPER=$(cat "$HOME/.cache/current_wallpaper" 2>/dev/null || echo "")

# get wallpapers
mapfile -t files < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \) | sort)

# mark actual
inputs=()
for file in "${files[@]}"; do
    name=$(basename "$file")
    if [ "$name" = "$CURRENT_WALLPAPER" ]; then
        inputs+=("● $name  ")
    else
        inputs+=("  $name  ")
    fi
done

# select wallpaper
selection=$(printf '%s\n' "${inputs[@]}" \
    | rofi -theme "$BASE_DIR/$CURRENT_THEME/rofi/wallset.rasi" \
           -dmenu \
           -p "Wallpapers")

[ -z "$selection" ] && exit 0

# clean up then apply
img=$(echo "$selection" | sed -e 's/^[● ]*//' -e 's/[[:space:]]*$//')
swww img "$WALLPAPER_DIR/$img" --transition-type grow --transition-duration 1.2 --transition-fps 60

# save current and set hyprlock wallpaper
echo "$img" > "$HOME/.cache/current_wallpaper"
sed -i "s|^\$WALLPAPER = .*|\$WALLPAPER = $WALLPAPER_DIR/$img|" ~/.config/hypr/hyprlock.conf
