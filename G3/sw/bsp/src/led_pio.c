#include "led_pio.h"

void led_on(unsigned long base)
{
  reg_write_32(base, PIO_DATA_REGISTER,1);
}

void led_off(unsigned long base)
{
  reg_write_32(base, PIO_DATA_REGISTER,0);
}
