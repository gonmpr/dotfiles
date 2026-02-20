#!/bin/bash

BASE_DIR="$HOME/.config/themes"
CURRENT_THEME=$(cat "$HOME/.cache/current_theme" 2>/dev/null || echo "moki")

# Obtener lista de temas disponibles
mapfile -t temas < <(ls -1 "$BASE_DIR")

# Preparar entrada para Rofi (marcar tema actual)
entradas=()
for tema in "${temas[@]}"; do
    if [ "$tema" = "$CURRENT_THEME" ]; then
        entradas+=("✓ $tema (actual)")
    else
        entradas+=("  $tema")
    fi
done

# Seleccionar tema
tema_seleccionado=$(printf '%s\n' "${entradas[@]}" \
    | rofi -dmenu \
           -p "🎨 Tema" \
           -theme-str 'window {width: 30%;}')

if [ -n "$tema_seleccionado" ]; then
    # Extraer nombre del tema (eliminar ✓ y (actual))
    tema=$(echo "$tema_seleccionado" | sed 's/^[✓ ]*//' | sed 's/ (actual)//')
    
    # Cambiar tema
    ~/.config/themes/ch_theme.sh "$tema"
    
    # Notificación
    notify-send "Tema cambiado" "Ahora usando: $tema" -i preferences-desktop-theme
fi
