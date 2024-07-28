import cocotb
import random
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
import xml.etree.ElementTree as ET

# Función para observar señales y escribir los resultados
def observe_signals(dut, file_name):
    for signal in observed_signals:
        signal_obj = get_signal(dut, signal)
        if signal_obj is not None:
            signal_name = signal
            value = signal_obj.value
            add_signal(signal_name, str(value), file_name)

# Función para obtener el objeto de señal del DUT
def get_signal(dut, signal_name):
    try:
        # Dividir el nombre de la señal en partes para navegar a través de la jerarquía
        parts = signal_name.split('.')
        signal_obj = dut
        for part in parts:
            signal_obj = getattr(signal_obj, part)
        return signal_obj
    except AttributeError:
        return None

# Función para añadir la señal al archivo XML
def add_signal(signal_name, final_value, file_name):
    # Leer el archivo XML existente
    try:
        tree = ET.parse(file_name)
        root = tree.getroot()
    except FileNotFoundError:
        # Si el archivo no existe, crear un nuevo árbol XML
        root = ET.Element("signals")
        tree = ET.ElementTree(root)

    # Añadir el nuevo elemento de señal
    signal_element = ET.SubElement(root, "signal")
    key_element = ET.SubElement(signal_element, "nombre")
    key_element.text = signal_name
    value_element = ET.SubElement(signal_element, "valor")
    value_element.text = final_value

    # Escribir el árbol XML modificado de nuevo al archivo
    tree.write(file_name, encoding="utf-8", xml_declaration=True)

# Lista de señales a observar
observed_signals = ["top.register_file.r8","top.register_file.r9","top.register_file.r10","top.register_file.r11","top.register_file.r12","top.register_file.r13","top.register_file.r14","top.register_file.r15","top.register_file.r16","top.register_file.r17"]

# Ejecución golden (sin fallos)
@cocotb.test(name="golden_run", skip=False)
async def golden_run(dut):
    # Esperar suficiente tiempo para observar las señales
    await Timer(9, units='us')
    # Observar las señales y guardarlas en goldenrun.xml
    observe_signals(dut, "goldenrun.xml")
