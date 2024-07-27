import cocotb
import random
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
import xml.etree.ElementTree as ET

# Función para observar señales y escribir resultados
def observe_signals(dut, file_name):
    for signal_name in observed_signals:
        signal = getattr(dut, signal_name)
        add_signal(signal._name, str(signal.value), file_name)

# Función para añadir señal al archivo XML
def add_signal(signal_name, final_value, file_name):
    # Leer el archivo XML existente
    try:
        tree = ET.parse(file_name)
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
    tree.write(file_name, encoding="utf-8", xml_declaration=True)

# Parámetros globales
observed_signals = ["top.register_file.r8","top.register_file.r9","top.register_file.r10","top.register_file.r11","top.register_file.r12","top.register_file.r13","top.register_file.r14","top.register_file.r15","top.register_file.r16","top.register_file.r17"]  # Definir las señales a observar

# Golden run (sin fallos)
@cocotb.test(name="golden_run", skip=False)
async def golden_run(dut):
    # Esperar un tiempo suficiente para observar las señales
    await Timer(9, units='us')
    # Observar las señales y guardarlas en goldenrun.xml
    observe_signals(dut, "goldenrun.xml")

