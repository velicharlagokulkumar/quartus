#include <stdio.h>
#include <stdint.h>

#include <stdio.h>
#include <stdint.h>
#include <errno.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <termios.h>
#include <sys/mman.h>

    typedef uint32_t u32;
    typedef uint16_t u16;
    typedef uint8_t u8;
     
    unsigned int value[50] = {0xDEADBEEF, 0xBEEFBEAD, 0xBBBBBBBB}; // Example value (32 bits)

    u32 *h2f_ptr = &value;
    u16 *h2f_ptr2 = &value;
    u8  *h2f_ptr3 = &value;

    void reg_write_32(u32 base, u32 offset, u32 valuez)
    {
        printf("H2F VIRT from def: %p\n", h2f_ptr);
        printf("BASE from def: %x\n", base);
        printf("OFFSET from def: %x\n", offset);
        printf("SUM from def: %p\n", (int*)(h2f_ptr + base/4 + offset));
        *((int *)(h2f_ptr + base/4 + offset)) = valuez;
    }

    void reg_write_16(u32 base, u32 offset, u16 valuez)
    {
        // printf("INFO: writing %x to %x + %x\n", value, addr, offset);
        *((uint16_t*)(h2f_ptr2 + base/2 + offset)) = valuez;
    }

    void reg_write_8(u32 base, u32 offset, u8 valuez)
    {
        // printf("INFO: writing %x to %x + %x\n", value, addr, offset);
        *((uint8_t*)(h2f_ptr3 + base + offset)) = valuez;
    }

    int main() {

    printf("ptr address: %p\n", (h2f_ptr));
    printf("ptr value: %x\n", *(h2f_ptr));
    
    // printf("ptr address: %p\n", (h2f_ptr+1));
    // printf("ptr address: %x\n", *(h2f_ptr+1));

    // printf("ptr address: %p\n", h2f_ptr2);
    // printf("ptr address: %p\n", *(h2f_ptr2));

    // printf("ptr address: %p\n", (h2f_ptr2+1));
    // printf("ptr address: %p\n", *(h2f_ptr2+1));

    u32 base = 0x8;
    u32 byte_offset = 3;
    u32 valuez = 0xAAAAAAAA; 

    printf("BASE: %x\n", base);
    printf("BYTE OFFSET: %x\n", byte_offset);
    printf("VALUE: %x\n", valuez);

    reg_write_8(base, byte_offset, valuez);
    
    printf("CONTENT IN ARRAY[0]: %x\n", value[0]);
    printf("CONTENT IN ARRAY[1]: %x\n", value[1]);
    printf("CONTENT IN ARRAY[2]: %x\n", value[2]);

    return 0;
}

