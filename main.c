#include <stdio.h>


// Corresponds to _add in the assembly code.
extern long add(long a, long b);


int main(void)
{
    long x = 10;
    long y = 32;

    long z = add(x, y);

    printf("%ld + %ld = %ld\n", x, y, z);
    return 0;
}
