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
riscv64-unknown-elf-gcc --version
spike --version
iverilog -V `
<img width="635" height="202" alt="image" src="https://github.com/user-attachments/assets/58b257bb-c40a-4ffa-bb7a-6cbb4fd4707f" />


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
```bash
git clone https://github.com/vsdip/vsdfpga_labs.git
cd vsdfpga_labs 
