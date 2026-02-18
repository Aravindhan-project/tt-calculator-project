# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):

    dut._log.info("Start calculator test")

    # 100kHz clock
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 5)
    dut.rst_n.value = 1

    # Helper function to test operations
    async def run_test(A, B, op, expected):
        dut.ui_in.value = (B << 4) | A
        dut.uio_in.value = op
        await ClockCycles(dut.clk, 2)

        result = dut.uo_out.value.integer
        dut._log.info(f"A={A} B={B} op={op} -> result={result}")

        assert result == expected, f"Expected {expected}, got {result}"

    # -------- TESTS --------

    # ADD : 3 + 2 = 5
    await run_test(3, 2, 0b00, 5)

    # SUB : 7 - 2 = 5
    await run_test(7, 2, 0b01, 5)

    # MUL : 3 * 4 = 12
    await run_test(3, 4, 0b10, 12)

    # AND : 6 & 3 = 2
    await run_test(6, 3, 0b11, 2)

    dut._log.info("ALL TESTS PASSED 🎉")
