#!/bin/bash

BASE_DIR="$HOME/.config/themes"
CURRENT_THEME=$(cat "$HOME/.cache/current_theme" 2>/dev/null || echo "moki")

# get themes
mapfile -t themes < <(ls -1 "$BASE_DIR" 2>/dev/null)

if [ ${#themes[@]} -eq 0 ]; then
    notify-send "No hay temas en $BASE_DIR"
    exit 1
fi

# mark actual theme
inputs=()
for theme in "${themes[@]}"; do
    if [ "$theme" = "$CURRENT_THEME" ]; then
        inputs+=("● $theme  ")
    else
        inputs+=("  $theme  ")
    fi
done

# show selector 
selected_theme=$(printf '%s\n' "${inputs[@]}" \
    | rofi -dmenu \
           -p "Theme selector" \
           -theme "$BASE_DIR/$CURRENT_THEME/rofi/theme_selector.rasi")

if [ -n "$selected_theme" ]; then
    theme=$(echo "$selected_theme" | sed -e 's/^[● ]*//' -e 's/[[:space:]]*$//')
    
    # change the theme with the sh
    ~/.config/scripts/theme-changer/ch_theme.sh "$theme"
    
fi
