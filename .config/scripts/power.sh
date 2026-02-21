#!/bin/bash

# Leer tema actual
CURRENT_THEME=$(cat "$HOME/.cache/current_theme" 2>/dev/null || echo "moki")
BASE_DIR="$HOME/.config/themes"

ops="Apagar\nReiniciar\nSuspender\nSalir\nBloquear"

# Ejecutar Rofi con el tema correspondiente
echo -e "$ops" | rofi -theme "$BASE_DIR/$CURRENT_THEME/rofi/power.rasi" \
                           -dmenu \
                           -p "Power" | while read -r op; do
    case "$op" in
        *"Apagar") systemctl poweroff ;;
        *"Reiniciar") systemctl reboot ;;
        *"Suspender") systemctl suspend ;;
        *"Salir") hyprctl dispatch exit ;;
        *"Bloquear") hyprlock ;;
    esac
done
