import xml.etree.ElementTree as ET
import os
import re

# Parsea un archivo XML y devuelve un diccionario con los nombres de las señales y sus valores.
def parse_xml(file_path):
    tree = ET.parse(file_path)
    root = tree.getroot()
    signals = {}
    for signal in root.findall('signal'):
        name = signal.find('nombre').text
        value = signal.find('valor').text
        signals[name] = value
    return signals

# Compara las señales entre el golden run y los experimentos.
def compare_signals(golden_run, experiments):
    golden_signals = parse_xml(golden_run)
    results = {}
    for experiment in experiments:
        experiment_signals = parse_xml(experiment)
        differences = {}
        for name, value in golden_signals.items():
            if name in experiment_signals:
                if experiment_signals[name] != value:
                    differences[name] = (value, experiment_signals[name])
        total_signals = len(golden_signals)
        different_signals = len(differences)
        same_signals = total_signals - different_signals
        percentage_same = (same_signals / total_signals) * 100
        results[experiment] = {
            "different_signals": differences,
            "percentage_same": percentage_same
        }
    return results

# Extrae el número del nombre del archivo para ordenar los archivos.
def extract_number(filename):
    match = re.search(r'test(\d+)\.xml', filename)
    return int(match.group(1)) if match else float('inf')

# Convierte una lista de números en una lista de intervalos.
def convert_to_intervals(numbers):
    sorted_numbers = sorted(numbers)
    intervals = []
    start = sorted_numbers[0]
    end = sorted_numbers[0]

    for num in sorted_numbers[1:]:
        if num == end + 1:
            end = num
        else:
            if start == end:
                intervals.append(str(start))
            else:
                intervals.append(f"{start}-{end}")
            start = num
            end = num

    if start == end:
        intervals.append(str(start))
    else:
        intervals.append(f"{start}-{end}")

    return ", ".join(intervals)

def main():
    golden_run = "goldenrun.xml"
    experiment_files = [f for f in os.listdir() if f.startswith('test') and f.endswith('.xml')]

    # Ordenar los archivos por número extraído.
    sorted_experiment_files = sorted(experiment_files, key=extract_number)

    # Verificar si hay archivos faltantes en la secuencia
    experiment_numbers = [extract_number(f) for f in sorted_experiment_files]
    all_numbers = set(range(1, max(experiment_numbers) + 1))
    missing_numbers = all_numbers - set(experiment_numbers)

    results = compare_signals(golden_run, sorted_experiment_files)
    
    masked_faults_count = 0
    faults_count = 0
    total_comparisons = len(sorted_experiment_files)

    for experiment, result in results.items():
        if result["different_signals"]:
            print(f"En el archivo {experiment}:")
            for signal, (golden_value, exp_value) in result["different_signals"].items():
                print(f"- La señal '{signal}' difiere: valor golden '{golden_value}', valor experimento '{exp_value}'")
            print(f"{result['percentage_same']}% de las señales son iguales.")
            faults_count += 1
        else:
            print(f"En el archivo {experiment}: No ha habido ningún fallo, todas las señales son iguales.")
            masked_faults_count += 1

    masked_faults_percentage = (masked_faults_count / total_comparisons) * 100
    faults_percentage = (faults_count / total_comparisons) * 100

    print(f"\nResultados Totales:")
    print(f"Masked Faults: {masked_faults_count} ({masked_faults_percentage:.2f}%)")
    print(f"Faults: {faults_count} ({faults_percentage:.2f}%)")
    print(f"Total Comparisons: {total_comparisons}")

    if missing_numbers:
        missing_intervals = convert_to_intervals(missing_numbers)
        print(f"\nFaltan los siguientes archivos de prueba: {missing_intervals}")
    else:
        print("\nNo faltan archivos de prueba en la secuencia.")

if __name__ == "__main__":
    main()

