#ifndef __IO_H__
#define __IO_H__
#include "utils.h"

/* IO Header file */

u32 reg_read(u32 *addr, u32 offset)
{
    return *((int *)(addr + offset/4));
}

void reg_write(u32 *addr, u32 offset, u32 value)
{
    // printf("INFO: writing %x to %x + %x\n", value, addr, offset);
    *((int *)(addr + offset/4)) = value;
}

#endif /* __IO_H__ */
