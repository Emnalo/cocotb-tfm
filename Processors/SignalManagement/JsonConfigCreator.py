import argparse
import json

def create_json(signals):
    tests = {}
    for i, signal in enumerate(signals, start=1):
        test_name = f"test{i}"
        fault_type = "transient"
        fault_value = 0

        if fault_type == "transient":
            tests[test_name] = {
                "signal_name": signal,
                "fault_type": fault_type,
                "fault_value": fault_value,
                "injection_interval": [1800, 8200],
                "duration": 10
            }
        else:
            tests[test_name] = {
                "signal_name": signal,
                "fault_type": fault_type,
                "fault_value": fault_value,
                "injection_time": 1,
                "duration": 0
            }
    return {"exp": tests}

parser = argparse.ArgumentParser()
parser.add_argument("input_file", type=str, help="Señales en TXT")
parser.add_argument("output_file", type=str, help="Nombre JSON")

args = parser.parse_args()

with open(args.input_file, 'r') as file:
    signals = [line.strip() for line in file.readlines()]

test_config = create_json(signals)

with open(args.output_file, 'w') as json_file:
    json.dump(test_config, json_file, indent=4)

print("JSON creado.")


