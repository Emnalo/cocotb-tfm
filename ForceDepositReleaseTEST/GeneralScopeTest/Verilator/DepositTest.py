import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
from cocotb.handle import Deposit

@cocotb.test()
async def FailTest(dut):
    # Generate clock
    cocotb.start_soon(Clock(dut.clk, 10, units='ns').start())
    # Apply initial values
    dut.din.value = 0b0001
    dut.rst.value = 1
    await Timer(10, units='ns')
    dut.rst.value = 0
    await Timer(10, units='ns')
    # Simulate normal operation
    dut.enable.value = 1  # Set enable to start operation
    
    # Wait for state to change from IDLE to WORKING
    while dut.state.value != 1:  # Assuming WORKING state is 1
        await RisingEdge(dut.clk)
    dut._log.info("State transitioned to WORKING")
    
    original_value = dut.din.value
    dut._log.info(f"Original value: {original_value}")
    dut.din.value = Deposit(0b0010)
    await Timer(20, units='ns')
    injected_value = dut.din.value
    dut._log.info(f"Injected value : {injected_value}")
    dut.din.value = 0b0001
    await Timer(100, units='ns')
    final_value = dut.din.value
    dut._log.info(f"Final value: {final_value}")
    
