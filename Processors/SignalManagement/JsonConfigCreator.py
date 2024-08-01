import json

def read_signals(filename):
    with open(filename, 'r') as file:
        signals = [line.strip() for line in file.readlines()]
    return signals

def create_json(signals):
    tests = {}
    for i, signal in enumerate(signals, start=1):
        test_name = f"test{i}"
        fault_type = "permanent"
        fault_value = 1
        
        if fault_type == "transient":
            tests[test_name] = {
                "signal_name": signal,
                "fault_type": fault_type,
                "fault_value": fault_value,
                "injection_interval": [0,9000],
                "duration_interval": [1,20]
            }
        else:
            tests[test_name] = {
                "signal_name": signal,
                "fault_type": fault_type,
                "fault_value": fault_value,
                "injection_time": 0,
                "duration": 0
            }

    return {"exp": tests}

signals = read_signals('usimplezsignalsSecuencial.txt')
test_config = create_json(signals)
with open('SIMPLEZSECUENCIALconfig.json', 'w') as json_file:
    json.dump(test_config, json_file, indent=4)
print("JSON creado.")

