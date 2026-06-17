#include <stdio.h>

#include "helper.h"

int main(void)
{
    short a = 40;
    short b = 32;
    short c = 12;
    short d = -12;
    long m = min4(a, b, c, d);

    printf("min(%i, %i, %i, %i) = %ld\n", a, b, c, d, m);

    return 0;
}
