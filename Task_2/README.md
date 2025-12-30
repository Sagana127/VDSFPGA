# Task-2: Design & Integrate a Memory-Mapped GPIO IP

## Task Overview
**Task Name:** Task-2 – Design & Integrate Your First Memory-Mapped IP  
**IP Implemented:** Simple GPIO Output IP (Write-Only)  
**Platform:** RISC-V SoC (RTL-level validation)  
**Validation Method:** Verilog Testbench Simulation  

This task focuses on designing a simple memory-mapped GPIO IP, integrating it into an existing RISC-V SoC environment, and validating its functionality through simulation.

---

## Objective
- Design a memory-mapped GPIO IP
- Integrate the IP into the SoC
- Validate correct register write and readback behavior using simulation

---

## GPIO IP Specification

### Functionality
- One 32-bit register
- Writing updates the GPIO output
- Reading returns the last written value

### Interface
- Memory-mapped peripheral interface using existing SoC signals:
  - `clk`
  - `resetn`
  - `write_en`
  - `read_en`
  - `wdata`
  - `rdata`

---

## Register Map Description

| Address | Register Name | Access | Description |
|-------|--------------|--------|-------------|
| 0x00000020 | GPIO_OUT | R/W | Stores GPIO output value |

- The GPIO register is mapped at address `0x00000020`
- No additional registers or offsets are implemented

---

## GPIO IP RTL

- File: `gpio_ip.v`
- Key features:
  - Internal 32-bit storage register (`gpio_reg`)
  - Synchronous write logic on rising clock edge
  - Combinational readback logic
  - GPIO output directly reflects register value

---

## Address Decoding Explanation

- Address decoding is handled outside the GPIO IP (at SoC or testbench level)
- When address `0x00000020` is selected:
  - `write_en` is asserted for write transactions
  - `read_en` is asserted for read transactions
- The GPIO IP itself relies only on these control signals and does not perform internal address comparison

---

## Direction and Behavior Explanation

### Write Operation
- Controlled by `write_en`
- On a rising clock edge:
  - `wdata` is latched into `gpio_reg`
  - `gpio_out` updates to the written value

### Read Operation
- Controlled by `read_en`
- The value stored in `gpio_reg` is driven onto `rdata`
- Read operation does not modify internal state

Although functionally write-only, readback support is provided for verification.
<img width="859" height="197" alt="image" src="https://github.com/user-attachments/assets/933d5366-eda0-4980-812b-34ccdec32051" />

---

## Validation Method Used

The GPIO IP was validated using a directed Verilog testbench (`gpio_tb.v`).
The testbench emulates CPU-style memory-mapped accesses by directly driving
the control and data signals.

This approach verifies the functional correctness of the IP independently
of firmware execution.

---

## Testbench-Based Validation Details

The testbench performs the following sequence:

1. Applies reset to the GPIO IP
2. Writes the value `0xDEADBEEF` using `write_en`
3. Verifies that `gpio_out` reflects the written value
4. Reads back the register using `read_en`
5. Compares `rdata` with the expected value

Console output is generated using `$display`, and signal activity is captured
in a waveform file for analysis.

---

## Simulation Evidence

- Written value: `0xDEADBEEF`
- Observed results:
  - `gpio_reg = 0xDEADBEEF`
  - `gpio_out = 0xDEADBEEF`
  - `rdata = 0xDEADBEEF`
- Waveform file: `gpio_sim.vcd`
- GTKWave screenshot attached as proof of correct operation
<img width="859" height="197" alt="image" src="https://github.com/user-attachments/assets/5386e02f-ef4f-4357-af41-8619090ebc27" />

---

## Files Included

- `gpio_ip.v` – GPIO IP RTL
- `gpio_tb.v` – Directed testbench
- `gpio_sim.vcd` – Simulation waveform
- Waveform screenshot – Validation proof

---

## Conclusion

The Simple GPIO Output IP was successfully designed, integrated, and validated
through simulation. Correct register update and readback behavior were verified
using a directed Verilog testbench, satisfying all mandatory requirements of
Task-2.
