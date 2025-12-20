# Task-1: Environment Setup & RISC-V Reference Bring-Up

## Overview
This repository documents the successful completion of **Task-1: Environment Setup & RISC-V Reference Bring-Up**, which is mandatory for all participants.  
The objective of this task is to validate a stable RISC-V development environment, ensure toolchain readiness, and establish a common baseline for upcoming FPGA and IP development tasks.

This task was completed **without FPGA hardware**, strictly following the provided guidelines.

---

## Objective
- Set up the official **GitHub Codespace** using the `vsd-riscv2` reference repository  
- Successfully build and run a **RISC-V reference program**
- Clone and execute **VSDFPGA labs** that do not require FPGA hardware
- Understand the RISC-V execution flow and system integration points

---

## Environment Used
- **GitHub Codespace**: Yes  
- **Local Machine Setup**: Not completed (Dockerfile reviewed for reference only)

---

## Step-1: GitHub Codespace Setup

### Repository
Forked from:  
https://github.com/vsdip/vsd-riscv2

### Actions Performed
1. Forked the repository to my GitHub account  
2. Created a new GitHub Codespace from the fork  
3. Waited for the environment to build successfully  
4. Verified that the Codespace launched without errors  

### Toolchain Verification
The following commands were executed in the Codespace terminal:

`
riscv64-unknown-elf-gcc --version`
`spike --version`
`iverilog -V`

<img width="635" height="202" alt="image" src="https://github.com/user-attachments/assets/58b257bb-c40a-4ffa-bb7a-6cbb4fd4707f" />

![sum1ton_output](https://github.com/user-attachments/assets/15900013-2a8c-4c4e-9639-00e0f335c613)

![linex_desktop](https://github.com/user-attachments/assets/80cb0055-0187-4eaa-8014-91f202991491)


## Step-2: RISC-V Reference Program Execution
### Actions Performed
- Followed the README instructions in `vsd-riscv2`
- Navigated to the sample RISC-V program directory
- Compiled the program using the RISC-V GCC toolchain
- Executed the program using the Spike simulator

### Result
- RISC-V program compiled successfully
- Program executed without build or runtime errors
- Console output confirmed correct execution



---

## Step-3: VSDFPGA Labs Execution

### Repository Cloned
`
git clone https://github.com/vsdip/vsdfpga_labs.git`
`cd vsdfpga_labs`

### Actions Performed
- Followed the README instructions in `vsdfpga_labs`
- Built and ran basic labs that do not require FPGA hardware
- Verified execution through simulation output and logs

### Result
- Labs executed successfully
- No FPGA tools or hardware were used
- Confirms readiness for multi-repository workflows

<img width="920" height="513" alt="riscv_logo bram hex" src="https://github.com/user-attachments/assets/fa981f4c-e3c7-48fe-a64c-24f931029fcb" />

<img width="663" height="448" alt="nano_riscv" src="https://github.com/user-attachments/assets/fd1b0ffd-8568-4dd9-948a-2894ef1669a7" />

<img width="818" height="550" alt="final_output" src="https://github.com/user-attachments/assets/b6b02b4f-4c97-4c2b-99eb-1721da118c0b" />


---

## Understanding Check (Mandatory)

### 1. Where is the RISC-V program located in the `vsd-riscv2` repository?
The RISC-V program is located inside the **sample/example program directory** of the `vsd-riscv2` repository. This directory contains basic programs used to validate the RISC-V toolchain and execution flow.

---

### 2. How is the program compiled and loaded into memory?
The program is compiled using the **RISC-V GCC cross-compiler (`riscv64-unknown-elf-gcc`)**.  
The generated ELF file is loaded and executed using the **Spike RISC-V ISA simulator**, which initializes memory and begins execution from the program entry point.

---

### 3. How does the RISC-V core access memory and memory-mapped I/O?
The RISC-V core accesses memory using **load and store instructions**.  
Memory-mapped I/O devices are accessed through specific address ranges mapped into the system memory space, allowing peripherals to be controlled using standard memory operations.

---

### 4. Where would a new FPGA IP block logically integrate in this system?
A new FPGA IP block would integrate as a **memory-mapped peripheral** on the system bus.  
It would be assigned a unique address range so the RISC-V core can communicate with it using load and store instructions.

---

## Optional Confidence Task
- Modified a constant or message in the RISC-V reference program
- Recompiled and reran the program
- Observed the changed output in the console

This confirms understanding of the build and execution flow.

---

## Important Notes
- FPGA tools such as **yosys**, **nextpnr**, and hardware programmers were **not installed**
- The Dockerfile was used only as a **reference** to understand required tools
- FPGA board availability does not affect Task-1 completion

---

## Conclusion
Task-1 has been successfully completed by validating the RISC-V reference environment, executing VSDFPGA labs without FPGA hardware, and demonstrating understanding of system architecture.  
This establishes readiness for upcoming RTL, IP integration, and FPGA bring-up tasks.

