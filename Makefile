CC = clang
CFLAGS = -Wall -Wextra -g -O0 -target x86_64-apple-macos

# NOTE: `-target x86_64-apple-macos` tells Clang: pretend the machine we're
# building for is an Intel Mac. Clang then:
# - generates x86-64 instructions
# - uses the x86-64 ABI
# - emits x86-64 Mach-O object files
# - links an x86-64 executable

# NOTE: An arm64 Mac is able to run a x86-64 program because of Rosetta 2.
# Rosetta 2 is a dynamic binary translation software developed by Apple that
# enables applications built for Intel x86-64 processors to run on Macs powered
# by Apple Silicon (ARM-based) chips. Introduced in 2020 alongside macOS Big
# Sur and the first M1 Macs, it allows a smooth transition between processor
# architectures without requiring developers to recompile their apps.
#
# When you execute: ./a.out
# the kernel notices:
#
#     architecture = x86_64
#     host = arm64
#
# and launches the process under Rosetta. Conceptually:
#
#     your program (x86-64 instructions)
#             ↓
#     Rosetta 2 translates instructions
#             ↓
#     ARM64 instructions
#             ↓
#     M1 CPU executes them
#
# Your process believes it's an Intel process.
#
#
#     main.c
#       |
#       | clang -target x86_64-apple-macos
#       v
#     main.o  (Mach-O x86_64)
#               |
#               | needs symbol _add
#               |
#     add.s
#       |
#       | clang -target x86_64-apple-macos -c
#       v
#     add.o   (defines _add)
#               |
#               | linker resolves _add
#               v
#     a.out (Mach-O x86_64 executable)
#               |
#               | launched on M1
#               v
#     Rosetta 2
#               |
#               v
#     ARM64 instructions on your M1 CPU

SRC_ASM = $(wildcard *.s)
OBJ_ASM = $(patsubst %.o,%.s,$(SRC_ASM))

all: a.out

a.out: main.o $(OBJ_ASM)
	$(CC) $(CFLAGS) -o $@ $^

main.o: main.c
	$(CC) $(CFLAGS) -c $<

%.o: %.s
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o a.out
