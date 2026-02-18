# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start test")

    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    # Wait after reset
    await ClockCycles(dut.clk, 5)

    # -------- TEST ADDITION --------
    dut._log.info("Testing ADD")
    dut.ui_in.value = 10
    dut.uio_in.value = 5

    await ClockCycles(dut.clk, 5)

    dut._log.info(f"Output = {int(dut.uo_out.value)}")

    assert int(dut.uo_out.value) == 15

    # -------- TEST SUBTRACTION --------
    dut._log.info("Testing SUB")
    dut.ui_in.value = 20
    dut.uio_in.value = 4

    await ClockCycles(dut.clk, 5)

    assert int(dut.uo_out.value) == 16

    dut._log.info("ALL TESTS PASSED")
