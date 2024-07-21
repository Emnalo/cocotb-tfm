import cocotb
import random
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
    elif intervalo is not None and isinstance(intervalo, tuple) and len(intervalo) == 2:
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
        await Timer(duration-1, units='ns') #Liberar antes de que acabe la simulación
        signal.value = Release()  # Liberar al final de la simulación
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
observed_signals = ["result_o", "zero_o"]  # Definir las señales a observar

# Generar funciones de test dinámicamente
experiments = [
    #Si inyectamos fallo permanente la duración debe ser 1ns más que la duración total del testbench. 
    {"signal_name": "alu.a_i", "fault_type": "permanent", "fault_value": 2, "injection_time": 20, "duration": 20},
    {"signal_name": "alu.a_i", "fault_type": "transient", "fault_value": 1, "injection_time": 20, "duration": 10},
    {"signal_name": "alu.a_i", "fault_type": "transient", "fault_value": 1, "injection_time": 20, "duration": 10},
    #{"signal_name": "uut.alu.b_i", "fault_type": "permanent", "fault_value": 20, "injection_interval": (0, 100)},
    #{"signal_name": "uut.result_register.d_i", "fault_type": "transient", "fault_value": 18, "injection_interval": (0, 100), "duration": 5},
]

#Corrutina de testbench
async def testbench(dut):
    #Generar reloj
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    #Condiciones iniciales
    dut.en_i.value = 1
    dut.rst_i.value = 0
    dut.a_i.value = 58
    dut.b_i.value = 25
    #Experimento1 Suma
    dut.operation_i.value = 2
    await Timer(10,units='ns')
    #Experimento2 Resta
    dut.operation_i.value = 6
    await Timer(10,units= 'ns')
    #Experimento3 Menor
    dut.operation_i.value = 7
    await Timer(10,units= 'ns')	
    

# Golden run (sin fallos)
@cocotb.test(name="golden_run", skip=False)
async def golden_run(dut):
    # Esperar un tiempo suficiente para observar las señales
    cocotb.start_soon(testbench(dut))
    await Timer(40, units='ns')
    # Observar las señales y guardarlas en goldenrun.xml
    observe_signals(dut, "goldenrun.xml")

# Fábrica de tests dinámicos
def test_factory(exp, test_name):
    @cocotb.test(name=test_name, skip=False)
    async def dynamic_test(dut):
        # Determinar el tiempo de inyección
        injection_time = instante_inyeccion(valor=exp.get("injection_time"), intervalo=exp.get("injection_interval"))
        cocotb.start_soon(testbench(dut))
        await Timer(injection_time, units='ns')
        # Inyectar el fallo
        await inject_fault(dut, exp["signal_name"], exp["fault_type"], exp["fault_value"], exp.get("duration", 0))
	
        # Esperar el tiempo restante para completar la duración total del test
        total_duration = 40  # Duración total deseada para cada test
        remaining_time = total_duration - injection_time - exp.get("duration", 0)
        if remaining_time > 0:
            await Timer(remaining_time, units='ns')
        # Observar las señales y guardarlas
        observe_signals(dut, f"{test_name}.xml")

    return dynamic_test

# Crear tests dinámicos con nombres únicos
for i, exp in enumerate(experiments):
    test_name = f"test_experiment_{i+1}"
    globals()[test_name] = test_factory(exp, test_name)

