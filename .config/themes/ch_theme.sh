#!/bin/bash

NUEVO_TEMA="$1"
BASE_DIR="/home/gonmpr/.config/themes"
CACHE_FILE="$HOME/.cache/current_theme"

# Verificar que el tema existe
if [ ! -d "$BASE_DIR/$NUEVO_TEMA" ]; then
    echo "❌ El tema '$NUEVO_TEMA' no existe"
    exit 1
fi

# Guardar tema actual en archivo de cache (variable global persistente)
echo "$NUEVO_TEMA" > "$CACHE_FILE"

# Actualizar archivos de importación
echo "@import \"../themes/$NUEVO_TEMA/waybar/style.css\";" > ~/.config/waybar/style.css
echo "@import \"../themes/$NUEVO_TEMA/swaync/style.css\";" > ~/.config/swaync/style.css
echo "@import \"$BASE_DIR/$NUEVO_TEMA/rofi/launcher.rasi\"" > ~/.config/rofi/config.rasi

# Recargar aplicaciones
killall waybar 2>/dev/null && waybar &
killall swaync 
swaync &

