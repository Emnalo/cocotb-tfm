import cocotb
import random
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
from cocotb.handle import Force, Release
import xml.etree.ElementTree as ET

@cocotb.test()
@cocotb.parameterize(
    inicio=[10, 20, 35],
    duracion=[10, 10, 15],
    valor=[True, False],
)
async def FactoryTest(dut, inicio, duracion, valor):
    # Generate clock
    cocotb.start_soon(Clock(dut.clk, 10, units='ns').start())

    signal = dut.bool_signal
    dut._log.info(f"Inyección de fallos en {signal}")

    original_value = signal.value
    dut._log.info(f"Valor original en {signal}: {original_value}")

    await Timer(inicio, units='ns')
    signal.value = Force(valor)
    await Timer(duracion, units='ns')

    injected_value = signal.value
    dut._log.info(f"Valor inyectado en {signal}: {injected_value}")

    signal.value = Release()
    await Timer(60, units='ns')

    final_value = signal.value
    dut._log.info(f"Valor final en {signal}: {final_value}")

    # Leer el archivo XML existente
    try:
        tree = ET.parse('output.xml')
        root = tree.getroot()
    except FileNotFoundError:
        # Si el archivo no existe, crear un nuevo árbol XML
        root = ET.Element("signal")
        tree = ET.ElementTree(root)

    # Añadir el nuevo elemento signal
    add_signal(root, signal._name, signal.value)

    # Escribir el árbol XML modificado de nuevo al archivo
    tree.write("output.xml", encoding="utf-8", xml_declaration=True)

def add_signal(root, signal_name, final_value):
    key_element = ET.SubElement(root, "nombre")
    key_element.text = signal_name
    value_element = ET.SubElement(root, "valor")
    value_element.text = str(final_value)

