        .intel_syntax noprefix

        .text
        .globl _add

_add:
        mov rax, rdi
        add rax, rsi
        ret
