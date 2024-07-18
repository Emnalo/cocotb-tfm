import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
from cocotb.handle import Force, Release

async def inject_fault(signal, clk, dut, log_name):
    dut._log.info(f"Inyección de fallos en {log_name}")
    original_value = signal.value
    dut._log.info(f"Valor original en {log_name}: {original_value}")
    await Timer(10, units='ns')
    signal.value = Force(4)
    await Timer(10, units='ns')
    injected_value = signal.value
    dut._log.info(f"Valor inyectado en {log_name}: {injected_value}")
    signal.value = Release()
    await Timer(100, units='ns')
    final_value = signal.value
    dut._log.info(f"Valor final en {log_name}: {final_value}")

@cocotb.test()
async def FailTest(dut):
    # Genera señal de reloj
    cocotb.start_soon(Clock(dut.clk, 10, units='ns').start())

    # Aplica valores iniciales
    dut.rst.value = 1
    await Timer(20, units='ns')
    dut.rst.value = 0
    await Timer(10, units='ns')

    # Simula operación normal del componente
    while dut.int_counter.value != 0 or dut.unsigned_counter.value != 0:
        await RisingEdge(dut.clk)

    # Inyección de fallos en int_counter y unsigned_counter de manera paralela
    task1 = cocotb.start_soon(inject_fault(dut.int_counter, dut.clk, dut, "int_counter"))
    task2 = cocotb.start_soon(inject_fault(dut.unsigned_counter, dut.clk, dut, "unsigned_counter"))

    await task1
    await task2

