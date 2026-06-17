        # Minimum of 4 16-bit integers

        # Note: inputs arrive in 64-bit registers, but we only use:
        #       di, si, dx, cx → their lower 16-bit parts

        # Note: cmp src, dst   ; sets FLAGS based on dst - src

        # Note: movsx is used instead of the plain old mov, because function
        #       returns a 64-bit integer (long) but computation is 16-bit, so:
        #
        #           movsx rax, ax   ; sign-extend 16-bit → 64-bit
        #
        #       Example:
        #
        #           ax = 0xFFFE (-2)
        #           becomes:
        #           rax = 0xFFFFFFFFFFFFFFFE


        .intel_syntax noprefix

        .text
        .globl _min4

_min4:
        # Arguments (System V ABI):
        # rdi = a (int16)
        # rsi = b (int16)
        # rdx = c (int16)
        # rcx = d (int16)
        #
        # return value:
        # rax = minimum (int16 result in lower 16 bits)

        mov ax, di        # ax = a (start assuming a is min)

        cmp si, ax        # if b < current min
        jge check_c
        mov ax, si        # min = b

check_c:
        cmp dx, ax        # if c < current min
        jge check_d
        mov ax, dx        # min = c

check_d:
        cmp cx, ax        # if d < current min
        jge done
        mov ax, cx        # min = d

done:
        movsx rax, ax     # sign-extend 16-bit result into 64-bit return
        ret
