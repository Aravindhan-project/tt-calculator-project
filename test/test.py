# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
import os
os.environ["TOPLEVEL"] = "tt_um_calculator"



@cocotb.test()
async def test_project(dut):
    dut._log.info("Start simulation")

    # Create clock (100 kHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset sequence
    dut._log.info("Resetting design")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Running dummy test")

    # Give some random inputs
    dut.ui_in.value = 10
    dut.uio_in.value = 5
    await ClockCycles(dut.clk, 5)

    dut.ui_in.value = 25
    dut.uio_in.value = 15
    await ClockCycles(dut.clk, 5)

    dut.ui_in.value = 100
    dut.uio_in.value = 50
    await ClockCycles(dut.clk, 5)

    dut._log.info("Test completed successfully")
