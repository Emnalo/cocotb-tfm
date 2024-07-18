import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
from cocotb.handle import Deposit

@cocotb.test()
async def FailTest(dut):
    # Genera señal de reloj
    cocotb.start_soon(Clock(dut.clk, 10, units='ns').start())
    # Aplica valores iniciales
    dut.din.value = 0b0001
    dut.rst.value = 1
    await Timer(10, units='ns')
    dut.rst.value = 0
    await Timer(10, units='ns')
    # Simula operacion normal
    dut.enable.value = 1  # Activa señal enable para empezar
    
    # Espera a cambio de estado de IDLE a WORKING
    while dut.state.value != 1:
        await RisingEdge(dut.clk)
    dut._log.info("State transitioned to WORKING")
    signal = dut.array_constant
    original_value = signal.value
    dut._log.info(f"Original value: {original_value}")
    signal.value = Deposit(0b0010)
    await Timer(20, units='ns')
    injected_value = signal.value
    dut._log.info(f"Injected value : {injected_value}")
    signal.value = 0b1111
    await Timer(100, units='ns')
    final_value = signal.value
    dut._log.info(f"Final value: {final_value}")
    
