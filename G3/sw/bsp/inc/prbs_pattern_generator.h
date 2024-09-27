#ifndef __PRBS_PATTERN_GENERATOR_H__
#define __PRBS_PATTERN_GENERATOR_H__

#include "io.h"
#include "prbs_pattern_generator_regs.h"

// public API to access the hardware
void prbs_generator_set_payload_length (unsigned long base, unsigned long length);
void prbs_generator_enable_infinite_payload_length (unsigned long base);
void prbs_generator_disable_infinite_payload_length (unsigned long base);
void prbs_generator_seed_enable (unsigned long base);
void prbs_generator_enable_start (unsigned long base);
void prbs_generator_disable_start (unsigned long base);
void prbs_generator_set_polynomial (unsigned long base, unsigned char *polynomial, long polynomial_length);

unsigned long prbs_generator_read_payload_length (unsigned long base);
unsigned char prbs_generator_read_infinite_payload_length (unsigned long base);
unsigned char prbs_generator_read_start (unsigned long base);
void prbs_generator_read_polynomial (unsigned long base, unsigned char *polynomial, long polynomial_length);


#endif /* __PRBS_PATTERN_GENERATOR_H__ */
