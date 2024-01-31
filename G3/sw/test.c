#include <stdio.h>
#include <stdint.h>

int main() {
    unsigned int value = 0xDEADBEEF; // Example value (32 bits)

    // Declare a pointer to an unsigned char (1 byte)
    uint8_t *bytePointer = (uint8_t *)&value;

    // Write a new value to the first byte
   // *(bytePointer+1) = 0xAB;
    bytePointer[1] = 0xAB;
    // Print the modified value
    printf("Modified value: 0x%X\n", value);

    return 0;
}