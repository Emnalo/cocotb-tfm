#!/bin/bash

# Comando a ejecutar
COMMAND="make SIM=nvc"

# Intervalo entre cada ejecución
INTERVAL=1

# Directorio actual donde está el script(raiz)
CURRENT_DIRECTORY="$(pwd)"


declare -a PROCESSED_DIRS

# Función procesado directorios
is_directory_processed() {
    local dir_to_check="$1"
    for processed_dir in "${PROCESSED_DIRS[@]}"; do
        if [ "$processed_dir" = "$dir_to_check" ]; then
            return 0 
        fi
    done
    return 1 
}

# Verificar entrada
if [ -z "$1" ]; then
    echo "Uso: $0 <numero_de_directorios_de_prueba>"
    exit 1
fi

NUM_TEST_DIRS=$1

# Crear directorios test$1 y copiar archivos
for ((i=1; i<=NUM_TEST_DIRS; i++)); do
    TEST_DIR="test${i}"
    mkdir -p "$TEST_DIR"
    cp config.json ParametricTest.py Makefile "$TEST_DIR"
done

while true; do
    directories_left=false
    
    # Iterar sobre cada directorio test
    for ((i=1; i<=NUM_TEST_DIRS; i++)); do
        DIRECTORY="${CURRENT_DIRECTORY}/test${i}"
        
        # Verificar si es directorio y no esta procesado
        if [ -d "$DIRECTORY" ] && ! is_directory_processed "$DIRECTORY"; then
            cd "$DIRECTORY" || { echo "No se pudo acceder al directorio $DIRECTORY"; continue; }

            # Ejecutar el comando
            eval "$COMMAND"

            # Verifica y copia fichero resultados test$1.xml
            RESULT_FILE="test${i}.xml"
            if [ -f "$RESULT_FILE" ]; then
                cp "$RESULT_FILE" "$CURRENT_DIRECTORY"
            else
                echo "Archivo de resultado $RESULT_FILE no encontrado en $DIRECTORY"
            fi

            # Agregar el directorio a la lista de procesados
            PROCESSED_DIRS+=("$DIRECTORY")

            # Vuelve a raiz
            cd "$CURRENT_DIRECTORY" || { echo "No se pudo volver al directorio $CURRENT_DIRECTORY"; exit 1; }

            # Espera intervalo y flag a true
            sleep $INTERVAL
            directories_left=true
        fi
    done
    
    # Si no quedan directorios por procesar, salir del bucle
    if [ "$directories_left" = false ]; then
        break
    fi
done
echo "Script terminado."
