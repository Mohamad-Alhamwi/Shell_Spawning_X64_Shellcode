# X64 Linux Shellcode for Spawning /bin/sh with Privilege Retention

This repository contains an x64 Linux shellcode designed to spawn a `/bin/sh` shell with the `-p` option enabled, preserving the effective user ID (EUID). Unlike typical shellcode optimized for minimal size, this code does not prioritize size reduction and contains two null bytes.

## Key Features
- Shellcode that spawns a `/bin/sh` shell.
- Preservation of elevated privileges (EUID).
- Compatible with x64 Linux environments.
- Designed for use in CTF challenges, and educational purposes.

## Disclaimer
This repository is intended for educational purposes only. Use of the code contained within should be done in a legal and ethical manner.

## Documentation

