import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
from cocotb.handle import Force,Release,Deposit

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
    
    async def inject_and_check(signal, fault_value, expected_value, description, method='deposit'):
        original_value = signal.value
        dut._log.info(f"{description} - Original value: {original_value}")

        if method == 'force':
            signal.value = Force(fault_value)
        elif method == 'deposit':
            signal.value = Deposit(fault_value)
        else:
            raise ValueError(f"Unknown method: {method}")

        await Timer(10, units='ns')

        injected_value = signal.value
        dut._log.info(f"{description} - Injected value ({method}): {injected_value}")

        if method == 'force':
            signal.value = Release()

        await Timer(10, units='ns')

        final_value = signal.value
        dut._log.info(f"{description} - Final value: {final_value}")

        assert final_value == expected_value, f"{description} ({method}) failed. Expected {expected_value}, got {final_value}"
        dut._log.info(f"{description} ({method}) passed. Signal value: {final_value}")

#    #Injecting faults and checking different signals
#    await inject_and_check(dut.din, 0b0010, 0b0001, "Fault injection in din")
#    await inject_and_check(dut.dout, 0b0000, 0b0001, "Fault injection in dout")
#    await inject_and_check(dut.u_inversor.entrada, 0b0000, 0b0001, "Fault injection in entrada Inversor")
#    await inject_and_check(dut.u_inversor.salida, 0b0000, 0b1110, "Fault injection salida Inversor")
#    await inject_and_check(dut.temp_var, 0b0000, 0b0001, "Fault injection in temp_var") #Inaccesible
#    await inject_and_check(dut.temporal, 0b0000, 0b0001, "Fault injection in temporal")
#    await inject_and_check(dut.array_signal, 0b0000, 0b0001, "Fault injection in array_signal")
#    await inject_and_check(dut.array_constant, 0b1000,0b1111, "Fault injection in array_constant") #Not Implemented
#    await inject_and_check(dut.counter, 1, 2, "Fault injection in counter")
#    await inject_and_check(dut.enable, 0, 0, "Fault injection in enable")
#    await inject_and_check(dut.enable, 1, 1, "Fault injection in enable")
#    await inject_and_check(dut.state, 0, 1, "Fault injection in state")      
    
    
    await Timer(120,units ='ns')
