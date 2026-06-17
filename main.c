#include <stdio.h>

extern long min(long a, long b);

int main(void)
{
    long x = 40;
    long y = 32;
    long m = min(x, y);

    printf("min(%ld, %ld) = %ld\n", x, y, m);

    x = 10;
    y = 12;
    m = min(x, y);

    printf("min(%ld, %ld) = %ld\n", x, y, m);

    return 0;
}
