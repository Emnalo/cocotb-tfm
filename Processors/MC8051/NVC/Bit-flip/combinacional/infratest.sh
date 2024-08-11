#!/bin/bash

# Comando a ejecutar
COMMAND="make SIM=nvc"

# Intervalo entre cada ejecución
INTERVAL=0

# Directorio actual donde está el script (raíz)
CURRENT_DIRECTORY="$(pwd)"

# Verificar entrada
if [ -z "$1" ]; then
    echo "Uso: $0 <numero_de_directorios_de_prueba>"
    exit 1
fi

NUM_TEST_DIRS=$1
start_time=$(date +%s)

# Crear la carpeta de resultados si no existe
RESULTADOS_DIR="${CURRENT_DIRECTORY}/resultados"
mkdir -p "$RESULTADOS_DIR"

# Bucle para crear, ejecutar y eliminar directorios de prueba secuencialmente
for ((i=1; i<=NUM_TEST_DIRS; i++)); do
    TEST_DIR="test${i}"

    # Crear directorio de prueba y copiar archivos
    mkdir -p "$TEST_DIR"
    cp config.json ParametricTest.py Makefile "$TEST_DIR"

    # Cambiar al directorio de prueba
    cd "$TEST_DIR" || { echo "No se pudo acceder al directorio $TEST_DIR"; continue; }

    # Ejecutar el comando
    eval "$COMMAND"

    # Verificar y copiar fichero resultados test${i}.xml
    RESULT_FILE="test${i}.xml"
    if [ -f "$RESULT_FILE" ]; then
        cp "$RESULT_FILE" "$RESULTADOS_DIR"
    else
        echo "Archivo de resultado $RESULT_FILE no encontrado en $TEST_DIR"
    fi

    # Volver a la raíz
    cd "$CURRENT_DIRECTORY" || { echo "No se pudo volver al directorio $CURRENT_DIRECTORY"; exit 1; }

    # Eliminar el directorio de prueba
    rm -rf "$TEST_DIR"

    # Espera el intervalo antes de proceder con el siguiente directorio
    sleep $INTERVAL
done

end_time=$(date +%s)
elapsed_time=$((end_time - start_time))
elapsed_minutes=$(echo "scale=2; $elapsed_time / 60" | bc)

echo "Tiempo transcurrido: $elapsed_minutes minutos."
echo "Script terminado."

