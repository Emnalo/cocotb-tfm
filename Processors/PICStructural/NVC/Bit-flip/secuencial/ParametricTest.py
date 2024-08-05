import os
import cocotb
import random
import json
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
from cocotb.handle import Force, Release, Deposit
import xml.etree.ElementTree as ET

# Función para generar el instante de inyección
def instante_inyeccion(valor=None, intervalo=None):
    """
    Genera la duración del fallo, asegurándose de que no se pase del tiempo total.
    
    :param injection_time: Tiempo de inicio de la inyección.
    :param total_duration: Duración total del experimento.
    :param valor: Un valor fijo (opcional).
    :param intervalo: Una tupla que representa el intervalo (min, max) (opcional).
    :return: Un valor fijo o un valor aleatorio dentro del intervalo, ajustado si es necesario.
    """
    if valor is not None:
        return valor
    elif intervalo is not None and isinstance(intervalo, list) and len(intervalo) == 2:
        return round(random.uniform(intervalo[0], intervalo[1]))
    else:
        raise ValueError("Debe proporcionar un valor fijo o un intervalo válido.")

# Función para generar la duración del fallo
def duracion_fallo(injection_time, total_duration, valor=None, intervalo=None):
    """
    Inyecta un fallo en una señal específica del DUT.
    
    :param dut: El DUT en el que inyectar el fallo.
    :param signal_name: Nombre de la señal (puede contener índices).
    :param fault_type: Tipo de fallo ("permanent" o "transient").
    :param fault_value: Valor del fallo a inyectar.
    :param duration: Duración del fallo (sólo para fallos transitorios).
    """
    if valor is not None:
        return min(valor, total_duration - injection_time)
    elif intervalo is not None and isinstance(intervalo, list) and len(intervalo) == 2:
        max_duration = min(intervalo[1], total_duration - injection_time)
        return round(random.uniform(intervalo[0], max_duration))
    else:
        raise ValueError("Debe proporcionar un valor fijo o un intervalo válido.")

# Función para inyectar fallo
async def inject_fault(dut, signal_name, fault_type, fault_value, duration):
    parts = signal_name.split('[')
    base_signal = parts[0]
    signal = getattr(dut, base_signal, None)
    if signal is None:
        raise AttributeError(f"La señal '{base_signal}' no existe en 'dut'.")

    if len(parts) > 1:
        index_str = parts[1].rstrip(']')
        try:
            index = int(index_str)
            signal = signal[index]
        except (ValueError, IndexError):
            raise AttributeError(f"Índice '{index_str}' fuera de rango o inválido para '{base_signal}'.")

    if fault_type == "permanent":
        signal.value = Force(fault_value)
    elif fault_type == "transient":
        inverse_value = ~signal.value
        signal.value = Deposit(inverse_value)

# Función para observar señales y escribir resultados
def observe_signals(dut):
    for signal_name in observed_signals:
        signal = getattr(dut, signal_name)
        add_signal(signal._name, str(signal.value))

# Función para añadir señal al archivo XML
def add_signal(signal_name, final_value):
    results_namefile = f"{os.path.basename(os.path.dirname(__file__))}.xml"
    try:
        tree = ET.parse(results_namefile)
        root = tree.getroot()
    except FileNotFoundError:
        root = ET.Element("signals")
        tree = ET.ElementTree(root)

    signal_element = ET.SubElement(root, "signal")
    key_element = ET.SubElement(signal_element, "nombre")
    key_element.text = signal_name
    value_element = ET.SubElement(signal_element, "valor")
    value_element.text = final_value
    tree.write(results_namefile, encoding="utf-8", xml_declaration=True)

# Parámetros globales
observed_signals = [
    "top.register_file.r8", "top.register_file.r9", "top.register_file.r10",
    "top.register_file.r11", "top.register_file.r12", "top.register_file.r13",
    "top.register_file.r14", "top.register_file.r15", "top.register_file.r16",
    "top.register_file.r17"
]

# Leer configuración del experimento JSON
with open("config.json", "r") as config_file:
    config_data = json.load(config_file)
    folder_name = os.path.basename(os.path.dirname(__file__))
    exp = config_data["exp"][folder_name]

# Definición de test
@cocotb.test(skip=False)
async def dynamic_test(dut):
    total_duration = 9000
    injection_time = instante_inyeccion(valor=exp.get("injection_time"), intervalo=exp.get("injection_interval"))
    duration = duracion_fallo(injection_time, total_duration, valor=exp.get("duration"), intervalo=exp.get("duration_interval"))
    await Timer(injection_time, units='ns')
    await inject_fault(dut, exp["signal_name"], exp["fault_type"], exp["fault_value"], duration)
    remaining_time = total_duration - injection_time - duration
    if (remaining_time > 0):
        await Timer(remaining_time, units='ns')
    observe_signals(dut)

