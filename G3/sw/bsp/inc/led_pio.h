#ifndef __LED_PIO_H__
#define __LED_PIO_H__

#include "io.h"

// individual 32-bit registers with byte address
#define PIO_DATA_REGISTER                0x0     /* r/w */

void led_on(unsigned long base);
void led_off(unsigned long base);

#endif /* __LED_PIO_H__ */