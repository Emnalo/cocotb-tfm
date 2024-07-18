import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
from cocotb.handle import Force, Release

async def inject_fault(signal, clk, dut, log_name):
    dut._log.info(f"Inyección de fallos en {log_name}")
    original_value = signal.value
    dut._log.info(f"Valor original en {log_name}: {original_value}")
    await Timer(10, units='ns')
    signal.value = Force(True)
    await Timer(10, units='ns')
    injected_value = signal.value
    dut._log.info(f"Valor inyectado en {log_name}: {injected_value}")
    signal.value = Release()
    await Timer(60, units='ns')
    final_value = signal.value
    dut._log.info(f"Valor final en {log_name}: {final_value}")

@cocotb.test()
async def FailTest(dut):
    # Genera señal de reloj
    cocotb.start_soon(Clock(dut.clk, 10, units='ns').start())

    # Aplica valores iniciales
    dut.rst.value = 1
    await Timer(10, units='ns')
    dut.rst.value = 0
    await Timer(10, units='ns')
    
    # Inyección de fallos en bool_signal
    await inject_fault(dut.bool_signal, dut.clk, dut, "bool_signal")

