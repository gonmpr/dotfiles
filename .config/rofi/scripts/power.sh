#!/bin/bash

# Leer tema actual
CURRENT_THEME=$(cat "$HOME/.cache/current_theme" 2>/dev/null || echo "moki")
BASE_DIR="$HOME/.config/themes"

# Opciones del menú de power
opciones="󰐥 Apagar\n󰜉 Reiniciar\n󰒲 Suspender\n󰍃 Cerrar sesión\n󰤄 Bloquear"

# Ejecutar Rofi con el tema correspondiente
echo -e "$opciones" | rofi -theme "$BASE_DIR/$CURRENT_THEME/rofi/power.rasi" \
                           -dmenu \
                           -p "⏻" | while read -r opcion; do
    case "$opcion" in
        *"Apagar") systemctl poweroff ;;
        *"Reiniciar") systemctl reboot ;;
        *"Suspender") systemctl suspend ;;
        *"Cerrar sesión") hyprctl dispatch exit ;;
        *"Bloquear") hyprlock ;;
    esac
done
