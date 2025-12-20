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

```bash
riscv64-unknown-elf-gcc --version
spike --version
iverilog -V
