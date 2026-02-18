# 4-bit Calculator (TinyTapeout Project)

## How it works

This project implements a simple 4-bit calculator (adder).

The 8 input switches are divided into two numbers:

- ui[3:0] → First number (A)
- ui[7:4] → Second number (B)

The circuit adds the two numbers:

Result = A + B

The result is displayed on the output LEDs.

---

## How to test

Example test:

| A | B | Expected Output |
|---|---|----------------|
| 3 | 2 | 5 |
| 6 | 3 | 9 |
| 15 | 1 | 16 |

To test in simulation, change `ui_in` values in the testbench.
