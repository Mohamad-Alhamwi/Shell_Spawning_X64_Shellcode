# X64 Linux Shellcode for Spawning /bin/sh with Privilege Retention

This repository contains an x64 Linux shellcode designed to spawn a `/bin/sh` shell with the `-p` option enabled, preserving the effective user ID (EUID). The shellcode is 44 bytes in length and is entirely null byte-free. Unlike typical shellcode optimized for minimal size, this code does not prioritize size reduction. While it could be further refined to reduce its size, achieving maximum size efficiency is not the primary goal of this implementation.

## Key Features
- Shellcode that spawns a `/bin/sh` shell.
- Preservation of elevated privileges (EUID).
- Compatible with x64 Linux environments.
- Designed for use in CTF challenges, and educational purposes.

## Disclaimer
This repository is intended for educational purposes only. Use of the code contained within should be done in a legal and ethical manner.

## Documentation

This repository contains two different approaches for using the provided shellcode, depending on whether you want to work with a commented assembly file or embed the shellcode directly in Python.

### 1. Using the Commented Shellcode

If you wish to work with the commented assembly code, you will need to use the script `script_as.py`. This script relies on external tools for assembling and compiling the shellcode. Please ensure that the following tools are installed on your system:

- **as**: The GNU Assembler, used to assemble the `.s` file into an object file.
- **objcopy**: A tool from GNU Binutils, used to extract the shellcode from the object file into raw binary format.

#### Usage

- Run `python3 script_as.py`

### 2. Using the Embeded Shellcode in Python

If you prefer to work with the shellcode embedded directly within Python, you only need the `spawn.py` file. This script uses the `pwntools` library to assemble the shellcode and execute it within a process.

#### Usage

- Run `python3 spawn.py`
