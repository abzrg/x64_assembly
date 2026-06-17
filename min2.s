        .intel_syntax noprefix

        .text
        .global _min

_min:
        // first argument:  rdi
        // second argument: rsi
        cmp rdi, rsi

        jl first_argument_smaller

        jmp second_argument_smaller

        ret

first_argument_smaller:
        mov rax, rdi
        ret

second_argument_smaller:
        mov rax, rsi
        ret
