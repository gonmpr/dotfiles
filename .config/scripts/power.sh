#!/bin/bash

ops="Apagar\nReiniciar\nSuspender\nSalir\nBloquear"

echo -e "$ops" | rofi -theme "$HOME/.config/rofi/power.rasi" \
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
