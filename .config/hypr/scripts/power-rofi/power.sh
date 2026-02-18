#!/bin/bash
option=$(printf "Bloquear\nSuspender\nReiniciar\nApagar\nSalir" | rofi -theme ~/.config/hypr/scripts/power-rofi/power.rasi -dmenu -p "Power")

case $option in
    Bloquear) hyprlock ;;
    Suspender) 
      hyprlock &
      sleep 1
      systemctl suspend ;;

    Reiniciar) systemctl reboot ;;
    Apagar) systemctl poweroff ;;
    Salir) hyprctl dispatch exit ;;
esac
