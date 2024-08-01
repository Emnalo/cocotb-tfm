import cocotb
import random
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
import xml.etree.ElementTree as ET

# Función para observar señales y escribir resultados
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
    tree.write(file_name, encoding="utf-8", xml_declaration=True)

# Señales a observar
observed_signals = ["RES[0]","RES[1]","RES[2]","RES[3]",
		    "RES[4]","RES[5]","RES[6]","RES[7]",
		    "RES[8]","RES[9]","RES[10]","RES[11]",
		    "RES[12]","RES[13]","RES[14]","RES[15]",
		    "RES[16]","RES[17]","RES[18]","RES[19]"]

# Golden run (sin fallos)
@cocotb.test(name="golden_run", skip=False)
async def golden_run(dut):
    await Timer(2, units='ms')
    # Observar las señales y guardarlas en goldenrun.xml
    observe_signals(dut, "goldenrun.xml")
