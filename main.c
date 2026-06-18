#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "helper.h"

int main(void)
{
    srand(0);

    int count = 24;
    char* arr = calloc(count, sizeof(*arr));

    for (uint32_t i = 0; i < count; ++i) { arr[i] = (char)rand(); }
    for (uint32_t i = 0; i < count; ++i) { printf("arr[%u] = %d\n", i, arr[i]); }

    zero_array(arr, count);
    for (uint32_t i = 0; i < count; ++i) { printf("arr[%u] = %d\n", i, arr[i]); }

    free(arr);

    return 0;
}
