#include <stdio.h>

int main() {

    int x = 42;
    int *ptr = &x; // Declare a pointer and assign the address of x to it

    typedef unsigned int uint32_t;

    unsigned int *h2p_virtual_base = &x;
    unsigned int *lw_pio_write_ptr ;
    int FPGA_PIO_WRITE = 0x300000;

    lw_pio_write_ptr = h2p_virtual_base + FPGA_PIO_WRITE/4;

    printf("Value of x: %d\n", x);
    printf("Address of x: %p\n", &x);
    printf("Value pointed to by ptr: %d\n", *ptr);
    printf("Address stored in ptr: %p\n", ptr);

    // *(uint32_t *) lw_pio_write_ptr = 0x0;
    // lw_pio_write_ptr[0] = 0x0;

    *lw_pio_write_ptr = 0x9;

    printf("value : %p\n", h2p_virtual_base);
    printf("value : %p\n", lw_pio_write_ptr);
    printf("value : %x\n", *lw_pio_write_ptr);
    return 0;
    
}
