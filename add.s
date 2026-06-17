        .text          // subsequent bytes go into the code section

        .globl _add    // export symbol "_add" so other object files
                       // can reference it during linking

        .p2align 4     // align next symbol to a 2^4 = 16-byte boundary
                       // assembler inserts padding if necessary


_add:
        // macOS x86-64 System V ABI:
        //
        // NOTE: The ABI is simply an agreement:
        //       Every compiler and every assembly programmer must pass
        //       arguments this way.
        //
        // first integer/pointer argument  -> %rdi
        // second integer/pointer argument -> %rsi
        // return value                    -> %rax

        movq %rdi, %rax    // rax = a
        addq %rsi, %rax    // rax += b
        ret                // return; caller reads result from rax
