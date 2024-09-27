#include "io.h"
#include "stdio.h"
#include "hps.h" 

// Aliases for HPS H2F and LWH2F base addresses. These MACROs are coming from the hps.h file
#define LWH2F_BASE ALT_FPGA_BRIDGE_LWH2F_ADDR
#define H2F_BASE ALT_FPGA_BRIDGE_AA32_H2F_1G_ADDR

    u32 *h2f_ptr;
    u16 *h2f_ptr2;
    u8  *h2f_ptr3;

    //Virtual Base
    u32* init_h2f(int fd)
    {
        u32 *ptr;
        off_t base = (off_t) H2F_BASE;
        // mmap devices connected to h2f into user space
        // TODO: use a MACRO generated automatically instead of 0x40220
        ptr = mmap(NULL, 0x40220, PROT_READ|PROT_WRITE, MAP_SHARED, fd, base);
            if (ptr == MAP_FAILED) {
                printf("mmap failed\n");
                return NULL;
            }
        return ptr;
    }

    u16* init_h2f_2(int fd)
    {
        u16 *ptr;
        off_t base = (off_t) H2F_BASE;
        // mmap devices connected to h2f into user space
        // TODO: use a MACRO generated automatically instead of 0x40220
        ptr = mmap(NULL, 0x40220, PROT_READ|PROT_WRITE, MAP_SHARED, fd, base);
            if (ptr == MAP_FAILED) {
                printf("mmap failed\n");
                return NULL;
            }
        return ptr;
    }

    u8* init_h2f_3(int fd)
    {
        u8 *ptr;
        off_t base = (off_t) H2F_BASE;
        // mmap devices connected to h2f into user space
        // TODO: use a MACRO generated automatically instead of 0x40220
        ptr = mmap(NULL, 0x40220, PROT_READ|PROT_WRITE, MAP_SHARED, fd, base);
            if (ptr == MAP_FAILED) {
                printf("mmap failed\n");
                return NULL;
            }
        return ptr;
    }

    void initialize()
    {
        int fd;
        char *memd = "/dev/mem";

        fd = open(memd, O_RDWR | O_SYNC);
            if (fd < 1) {
            printf("Invalid device file:%s.\n", memd);
            return -1;
            }       

        h2f_ptr = init_h2f(fd);
            if(!h2f_ptr)
            {
            printf("h2f init failed\n");
            return -1;
            }

        h2f_ptr2 = init_h2f(fd);
            if(!h2f_ptr2)
            {
            printf("h2f_2 init failed\n");
            return -1;
            }

        h2f_ptr3 = init_h2f(fd);
            if(!h2f_ptr3)
            {
            printf("h2f_3 init failed\n");
            return -1;
            }
    }


    u32 reg_read_32(u32 offset)
    {
        u32 z = *((int *)(h2f_ptr + offset/4)); // for removing read error on board
        return *((int *)(h2f_ptr + offset/4));
    }

    u16 reg_read_16(u32 offset)
    {
        u16 z = *((int *)(h2f_ptr + offset/4)); // for removing read error on board
        return *((uint16_t *)(h2f_ptr2 + offset/2));
    }

    u8 reg_read_8(u32 offset)
    {
        u8 z = *((int *)(h2f_ptr + offset/4)); // for removing read error on board
        return *((uint8_t *)(h2f_ptr3 + offset));
    }

    void reg_write_32(u32 base, u32 offset, u32 value)
    {
        *((int *)(h2f_ptr + base/4 + offset)) = value;
    }

    void reg_write_16(u32 base, u32 offset, u16 value)
    {
        *((uint16_t*)(h2f_ptr2 + base/2 + offset)) = value;
    }

    void reg_write_8(u32 base, u32 offset, u8 value)
    {
        *((uint8_t*)(h2f_ptr3 + base + offset)) = value;
    }
