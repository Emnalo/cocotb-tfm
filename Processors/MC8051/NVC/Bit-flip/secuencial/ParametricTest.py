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
    Genera un instante de inyección.
    
    :param valor: Un valor fijo (opcional).
    :param intervalo: Una tupla que representa el intervalo (min, max) (opcional).
    :return: Un valor fijo o un valor aleatorio dentro del intervalo.
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
    Genera la duración del fallo, asegurándose de que no se pase del tiempo total.
    
    :param injection_time: Tiempo de inicio de la inyección.
    :param total_duration: Duración total del experimento.
    :param valor: Un valor fijo (opcional).
    :param intervalo: Una tupla que representa el intervalo (min, max) (opcional).
    :return: Un valor fijo o un valor aleatorio dentro del intervalo, ajustado si es necesario.
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
    """
    Inyecta un fallo en una señal específica del DUT.
    
    :param dut: El DUT en el que inyectar el fallo.
    :param signal_name: Nombre de la señal (puede contener índices).
    :param fault_type: Tipo de fallo ("permanent" o "transient").
    :param fault_value: Valor del fallo a inyectar.
    :param duration: Duración del fallo (sólo para fallos transitorios).
    """
    signal = get_signal(dut, signal_name)
    # Aplicar el fallo
    if fault_type == "permanent":
        signal.value = Force(fault_value)
    elif fault_type == "transient":
        inverse_value = ~signal.value
        signal.value = Deposit(inverse_value)

# Función para observar señales y escribir los resultados
def observe_signals(dut):
    for signal in observed_signals:
        signal_obj = get_signal(dut, signal)
        if signal_obj is not None:
            signal_name = signal
            value = signal_obj.value
            add_signal(signal_name, str(value))

# Función para obtener el objeto de señal del DUT
def get_signal(dut, signal_name):
    try:
        parts = signal_name.split('.')
        signal_obj = dut
        for part in parts:
            while '[' in part and ']' in part:
                base_part, rest = part.split('[', 1)
                signal_obj = getattr(signal_obj, base_part)
                while ']' in rest:
                    index_str, rest = rest.split(']', 1)
                    index = int(index_str)
                    signal_obj = signal_obj[index]
                    if '[' in rest:
                        rest = rest.split('[', 1)[1]
                    else:
                        rest = ''
                part = rest
            if part:
                signal_obj = getattr(signal_obj, part)
        return signal_obj
    except AttributeError:
        return None
    except IndexError:
        return None
    except ValueError:
        return None

# Función para añadir señal al archivo XML
def add_signal(signal_name, final_value):
    # Leer el archivo XML existente
    results_namefile = f"{os.path.basename(os.path.dirname(__file__))}.xml"
    try:
        tree = ET.parse(results_namefile)
        root = tree.getroot()
    except FileNotFoundError:
        # Si el archivo no existe, crear un nuevo árbol XML
        root = ET.Element("signals")
        tree = ET.ElementTree(root)

    # Añadir el nuevo elemento signal
    signal_element = ET.SubElement(root, "signal")
    key_element = ET.SubElement(signal_element, "nombre")
    key_element.text = signal_name
    value_element = ET.SubElement(signal_element, "valor")
    value_element.text = final_value

    # Escribir el árbol XML modificado de nuevo al archivo
    tree.write(results_namefile, encoding="utf-8", xml_declaration=True)
# Señales a observar
observed_signals = ["RES[0]", "RES[1]", "RES[2]", "RES[3]",
                    "RES[4]", "RES[5]", "RES[6]", "RES[7]",
                    "RES[8]", "RES[9]", "RES[10]", "RES[11]",
                    "RES[12]", "RES[13]", "RES[14]", "RES[15]",
                    "RES[16]", "RES[17]", "RES[18]", "RES[19]"]

# Leer configuración del experimento JSON
with open("config.json", "r") as config_file:
    config_data = json.load(config_file)
    folder_name = os.path.basename(os.path.dirname(__file__))
    exp = config_data["exp"][folder_name]

# Definición de test
@cocotb.test(skip=False)
async def dynamic_test(dut):
    # Duración total deseada para cada test
    total_duration = 2000000

    # Determinar el tiempo de inyección
    injection_time = instante_inyeccion(valor=exp.get("injection_time"), intervalo=exp.get("injection_interval"))

    # Determinar la duración del fallo
    duration = duracion_fallo(injection_time, total_duration, valor=exp.get("duration"), intervalo=exp.get("duration_interval"))

    # Esperar el tiempo de inyección
    await Timer(injection_time, units='ns')
    await inject_fault(dut, exp["signal_name"], exp["fault_type"], exp["fault_value"], duration)

    # Esperar el tiempo restante para completar la duración total del test
    remaining_time = total_duration - injection_time - duration
    if remaining_time > 0:
        await Timer(remaining_time, units='ns')

    # Observar las señales y guardarlas
    observe_signals(dut)

