import os
import cocotb
import random
import json
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
from cocotb.handle import Force, Release
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

# Función para inyectar fallo
async def inject_fault(dut, signal_name, fault_type, fault_value, duration):
    signal = getattr(dut, signal_name)
    original_value = signal.value
    dut._log.info(f"Valor original en {signal_name}: {original_value}")
    if fault_type == "permanent":
        signal.value = Force(fault_value)
        injected_value = signal.value
        dut._log.info(f"Valor inyectado en {signal_name}: {injected_value}")
        # No se libera el fallo, es permanente
    elif fault_type == "transient":
        signal.value = Force(fault_value)
        injected_value = signal.value
        dut._log.info(f"Valor inyectado en {signal_name}: {injected_value}")
        await Timer(duration, units='ns')
        signal.value = Release()  # Liberar el fallo después de la duración
    final_value = signal.value
    dut._log.info(f"Valor final en {signal_name}: {final_value}")

# Función para observar señales y escribir resultados
def observe_signals(dut):
    for signal_name in observed_signals:
        signal = getattr(dut, signal_name)
        add_signal(signal._name, str(signal.value))

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

# Parámetros globales
observed_signals = ["uut.result", "uut.alu.add_result", "uut.result_register.aux"]  # Definir las señales a observar

# Leer configuracion del experimento JSON
with open("config.json", "r") as config_file:
    config_data = json.load(config_file)
    folder_name = os.path.basename(os.path.dirname(__file__))
    exp = config_data["exp"][folder_name]

# Definición de test
@cocotb.test(skip=False)
async def dynamic_test(dut):
    # Determinar el tiempo de inyección
    injection_time = instante_inyeccion(valor=exp.get("injection_time"), intervalo=exp.get("injection_interval"))
    await Timer(injection_time, units='ns')

    # Inyectar el fallo
    await inject_fault(dut, exp["signal_name"], exp["fault_type"], exp["fault_value"], exp.get("duration", 0))

    # Esperar el tiempo restante para completar la duración total del test
    total_duration = 200  # Duración total deseada para cada test
    remaining_time = total_duration - injection_time - exp.get("duration", 0)
    if remaining_time > 0:
        await Timer(remaining_time, units='ns')

    # Observar las señales y guardarlas
    observe_signals(dut)

