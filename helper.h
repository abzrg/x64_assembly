#ifndef HELPER_H
#define HELPER_H


extern long add(long a, long b);

extern long min2(long a, long b);
extern long min4(short a, short b, short c, short d);

// Set countInBytes to 0 starting from &arr and moving to &arr + countInBytes
extern void zero_array(void* arr, int count_in_bytes);

#endif // HELPER_H
