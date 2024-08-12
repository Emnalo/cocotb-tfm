import re
import sys

def expand_signal(signal):
    # Encuentra todos los índices en el formato [x:y]
    matches = re.findall(r'\[(\d+):(\d+)\]', signal)
    if not matches:
        return [signal]
    expanded_signals = []
    for match in matches:
        x, y = map(int, match)
        for i in range(y, x + 1):
            expanded_signals.append(re.sub(r'\[\d+:\d+\]', f'[{i}]', signal, count=1))
    return expanded_signals

def process_file(input_file, output_file):
    with open(input_file, 'r') as infile:
        lines = infile.readlines()
    new_lines = []
    for line in lines:
        expanded_signals = expand_signal(line.strip())
        new_lines.extend(expanded_signals)
    with open(output_file, 'w') as outfile:
        outfile.write('\n'.join(new_lines) + '\n')

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Uso: python rewrite_signals.py archivo_entrada archivo_salida")
        sys.exit(1)
    input_filename = sys.argv[1]
    output_filename = sys.argv[2]
    process_file(input_filename, output_filename)
    print(f"Señales expandidas guardadas en {output_filename}")

