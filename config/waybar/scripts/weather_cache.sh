#!/bin/bash

# --- Configuración ---
FILE_CACHE="weather_info.txt"
PYTHON_SCRIPT="wabar-wttr.py"
EXPIRATON_SECONDS=3600 # 1 hora (ajusta según prefieras)

# --- Lógica ---

# Función para obtener clima nuevo
get_new_weather() {
    # Ejecuta el script de python y guarda la salida
    # Asegúrate de usar 'python3' o el comando que uses habitualmente
    resultado=$(python3 "$PYTHON_SCRIPT")
    echo "$resultado" > "$FILE_CACHE"
    echo "$resultado"
}

# 1. Verificar si el archivo existe
if [ -f "$FILE_CACHE" ]; then
    # Obtener la fecha de última modificación en segundos (Unix timestamp)
    ULTIMA_MOD=$(stat -c %Y "$FILE_CACHE")
    AHORA=$(date +%s)
    DIFERENCIA=$((AHORA - ULTIMA_MOD))

    # 2. Verificar si expiró
    if [ $DIFERENCIA -lt $EXPIRATON_SECONDS ]; then
        # El archivo es reciente, devolver contenido
        cat "$FILE_CACHE"
    else
        # El archivo expiró, borrar y actualizar
        rm "$FILE_CACHE"
        get_new_weather
    fi
else
    # 3. El archivo no existe, obtener por primera vez
    get_new_weather
fi
