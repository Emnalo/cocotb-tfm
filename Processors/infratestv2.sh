#!/bin/bash

# Comando a ejecutar
COMMAND="make SIM=(SIMULADOR)"

# Intervalo entre cada ejecución
INTERVAL=0

# Directorio actual donde está el script (raíz)
CURRENT_DIRECTORY="$(pwd)"

# Verificar entrada
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Uso: $0 <numero_de_test_inicio> <numero_de_test_fin>"
    exit 1
fi

START_TEST=$1
END_TEST=$2
start_time=$(date +%s)

# Función para calcular y mostrar el tiempo transcurrido
function show_elapsed_time {
    end_time=$(date +%s)
    elapsed_time=$((end_time - start_time))
    elapsed_minutes=$(echo "scale=2; $elapsed_time / 60" | bc)
    echo "Tiempo transcurrido: $elapsed_minutes minutos."
    echo "Script terminado."
}

# Configurar la trampa para capturar SIGINT (Ctrl+C) y ejecutar la función de tiempo
trap show_elapsed_time SIGINT

# Crear la carpeta de resultados si no existe
RESULTADOS_DIR="${CURRENT_DIRECTORY}/resultados"
mkdir -p "$RESULTADOS_DIR"

# Bucle para crear, ejecutar y eliminar directorios de prueba secuencialmente
for ((i=START_TEST; i<=END_TEST; i++)); do
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

# Mostrar el tiempo transcurrido al final del script
show_elapsed_time

