        .intel_syntax noprefix

        .text
        .globl _zero_array

_zero_array:
        # extern void zero_array(void* arr, int count_in_bytes);
        #
        # Arguments:
        # rdi = arr (void*)
        # esi = count_in_bytes (int)
        #
        # Return:
        # void

        test esi, esi          # count == 0 ?
        jle done               # If count <= 0, return

loop:
        # # Zero out one byte at a time
        # mov byte ptr [rdi], 0  # *arr = 0
        # inc rdi                # arr++
        # dec esi                # count--
        # jne loop               # Continue until count == 0

        # Zero out two bytes at a time
        mov word ptr [rdi], 0  # Write two zero bytes
        add rdi, 2             # Advance pointer by two: arr += 2
        sub esi, 2             # Two fewer bytes remaining: count -= 2
        jne loop               # Continue until count == 0

tail:
        # One byte remains
        mov byte ptr [rdi], 0

done:
        ret
