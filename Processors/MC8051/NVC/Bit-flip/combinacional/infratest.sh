#!/bin/bash

# Comando a ejecutar
COMMAND="make SIM=nvc"

# Intervalo entre cada ejecución
INTERVAL=1

# Directorio actual donde está el script (raíz)
CURRENT_DIRECTORY="$(pwd)"

declare -a PROCESSED_DIRS

# Función para verificar si un directorio ya ha sido procesado
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
start_time=$(date +%s)
# Crear directorios test$1 y copiar archivos
for ((i=1; i<=NUM_TEST_DIRS; i++)); do
    TEST_DIR="test${i}"
    mkdir -p "$TEST_DIR"
    cp config.json ParametricTest.py Makefile "$TEST_DIR"
done

# Crear la carpeta de resultados si no existe
RESULTADOS_DIR="${CURRENT_DIRECTORY}/resultados"
mkdir -p "$RESULTADOS_DIR"

while true; do
    directories_left=false

    # Iterar sobre cada directorio test
    for ((i=1; i<=NUM_TEST_DIRS; i++)); do
        DIRECTORY="${CURRENT_DIRECTORY}/test${i}"

        # Verificar si es directorio y no está procesado
        if [ -d "$DIRECTORY" ] && ! is_directory_processed "$DIRECTORY"; then
            cd "$DIRECTORY" || { echo "No se pudo acceder al directorio $DIRECTORY"; continue; }

            # Ejecutar el comando
            eval "$COMMAND"

            # Verificar y copiar fichero resultados test$1.xml
            RESULT_FILE="test${i}.xml"
            if [ -f "$RESULT_FILE" ]; then
                cp "$RESULT_FILE" "$RESULTADOS_DIR"
            else
                echo "Archivo de resultado $RESULT_FILE no encontrado en $DIRECTORY"
            fi

            # Agregar el directorio a la lista de procesados
            PROCESSED_DIRS+=("$DIRECTORY")

            # Volver a la raíz
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

# Borrar los directorios de prueba
for ((i=1; i<=NUM_TEST_DIRS; i++)); do
    TEST_DIR="test${i}"
    rm -rf "$TEST_DIR"
done

end_time=$(date +%s)
elapsed_time=$((end_time - start_time))
elapsed_minutes=$(echo "scale=2; $elapsed_time / 60" | bc)

echo "Tiempo transcurrido: $elapsed_minutes minutos."
echo "Script terminado."

