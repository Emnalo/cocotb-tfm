import re
import sys

def process_vcd(filename):
    signals = {}
    with open(filename, 'r') as file:
        for line in file:
            match = re.match(r'\$var wire (\d+) (.) (.+) \$end', line)
            if match:
                width, symbol, name = match.groups()
                signals[symbol] = {'name': name, 'values': set()}
            match = re.match(r'b([01]+) (.)', line)
            if match:
                value, symbol = match.groups()
                if symbol in signals:
                    signals[symbol]['values'].add(value)
    for symbol, data in signals.items():
        sorted_values = sorted(data['values'], key=lambda x: int(x, 2))
        print(f"Señal {data['name']} ({symbol}):")
        for value in sorted_values:
            decimal_value = int(value, 2)
            print(f"  {decimal_value}")
        print()
     
if len(sys.argv) < 2:
    print("Proporciona el nombre del archivo VCD")
    sys.exit(1)
filename = sys.argv[1]
process_vcd(filename)

