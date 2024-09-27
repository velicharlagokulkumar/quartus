#include "prbs_pattern_generator.h"

// register write functions
void prbs_generator_set_payload_length (unsigned long base, unsigned long length)
{
  reg_write_32(base + PRBS_GENERATOR_PAYLOAD_LENGTH_REG, 0, length);
}

void prbs_generator_enable_infinite_payload_length (unsigned long base)
{
  reg_write_8(base + PRBS_GENERATOR_CONTROL_REG, (PRBS_GENERATOR_INFINITE_PAYLOAD_LENGTH_ENABLE_BYTE_OFFSET), 1);
}

void prbs_generator_disable_infinite_payload_length (unsigned long base)
{
  reg_write_8(base + PRBS_GENERATOR_CONTROL_REG, (PRBS_GENERATOR_INFINITE_PAYLOAD_LENGTH_ENABLE_BYTE_OFFSET), 0);
}

void prbs_generator_seed_enable (unsigned long base)
{
  reg_write_8(base + PRBS_GENERATOR_CONTROL_REG, (PRBS_GENERATOR_SEED_BYTE_OFFSET), 1);
}

void prbs_generator_enable_start (unsigned long base)
{
  reg_write_8(base + PRBS_GENERATOR_CONTROL_REG, (PRBS_GENERATOR_RUN_BYTE_OFFSET), 1);
}

void prbs_generator_disable_start (unsigned long base)
{
  reg_write_8(base + PRBS_GENERATOR_CONTROL_REG, (PRBS_GENERATOR_RUN_BYTE_OFFSET), 0);
}

void prbs_generator_set_polynomial (unsigned long base, unsigned char *polynomial, long polynomial_length)
{
  long i;
  
  for (i = 0; i < polynomial_length; i++)
  {
    reg_write_8(base + PRBS_GENERATOR_POLYNOMIAL_31_0_REG, (i), polynomial[i]);
  }
  
  for (i = polynomial_length; i < 16; i++)  // padding the other bytes for good measure, extra byte lanes that exceed the pattern data width will be ignored by the hardware
  {
    reg_write_8(base + PRBS_GENERATOR_POLYNOMIAL_31_0_REG, (i), 0);
  }
}


// register read functions
unsigned long prbs_generator_read_payload_length (unsigned long base)
{
  return (reg_read_32(base + PRBS_GENERATOR_PAYLOAD_LENGTH_REG));
}

unsigned char prbs_generator_read_infinite_payload_length (unsigned long base)
{
  return (reg_read_8((base + PRBS_GENERATOR_CONTROL_REG + PRBS_GENERATOR_INFINITE_PAYLOAD_LENGTH_ENABLE_BYTE_OFFSET) & (PRBS_GENERATOR_INFINITE_PAYLOAD_LENGTH_ENABLE_MASK >> PRBS_GENERATOR_INFINITE_PAYLOAD_LENGTH_ENABLE_BIT_OFFSET)));
}

unsigned char prbs_generator_read_start (unsigned long base)
{
  return (reg_read_8((base + PRBS_GENERATOR_CONTROL_REG + PRBS_GENERATOR_RUN_BYTE_OFFSET) & (PRBS_GENERATOR_RUN_MASK >> PRBS_GENERATOR_RUN_BIT_OFFSET)));
}

void prbs_generator_read_polynomial (unsigned long base, unsigned char *polynomial, long polynomial_length)
{
  long i;
  
  for (i = 0; i < polynomial_length; i++)
  {
    *polynomial++ = reg_read_8(base + (PRBS_GENERATOR_POLYNOMIAL_31_0_REG + i));
  }
  
}
