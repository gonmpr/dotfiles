#!/usr/bin/env bash

DIR="$HOME/Imágenes/Wallpapers"
MAX=8

mapfile -t files < <(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \))

count=${#files[@]}

if [ "$count" -gt "$MAX" ]; then
    lines=$MAX
else
    lines=$count
fi

img=$(printf '%s\n' "${files[@]##*/}" \
    | rofi -theme ~/.config/hypr/scripts/wallpaper-selector-rofi/wallset.rasi \
           -dmenu \
           -lines "$lines" \
           -p "Wallpaper")

[ -z "$img" ] && exit 0

swww img "$DIR/$img" --transition-type grow --transition-duration 1.2 --transition-fps 60
