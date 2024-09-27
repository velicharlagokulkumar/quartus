#ifndef __RAM_TEST_CONTROLLER_H__
#define __RAM_TEST_CONTROLLER_H__

#include "io.h"
#include "ram_test_controller_regs.h"

// register write functions (functions with return values use error code 0 for pass and 1 for failures)
void ram_test_controller_set_base_address (unsigned long csr_base, unsigned long long ram_base);
int ram_test_controller_set_transfer_length (unsigned long csr_base, unsigned long length);
int ram_test_controller_set_block_size (unsigned long csr_base, unsigned long block_size);
int ram_test_controller_set_block_trail_distance (unsigned long csr_base, unsigned char trail_distance);
void ram_test_controller_enable_concurrent_accesses (unsigned long csr_base);
void ram_test_controller_disable_concurrent_accesses (unsigned long csr_base);
void ram_test_controller_enable_start (unsigned long csr_base);
void ram_test_controller_disable_start (unsigned long csr_base);
int ram_test_controller_set_timer_resolution (unsigned long csr_base, unsigned short resolution);
void ram_test_controller_set_timer (unsigned long csr_base, unsigned long timer);


// register read functions
unsigned long long ram_test_controller_read_base_address (unsigned long csr_base);
unsigned long ram_test_controller_read_transfer_length (unsigned long csr_base);
unsigned long ram_test_controller_read_block_size (unsigned long csr_base);
unsigned long ram_test_controller_read_block_trail_distance (unsigned long csr_base);
unsigned char ram_test_controller_read_concurrent_accesses (unsigned long csr_base);
unsigned char ram_test_controller_read_start (unsigned long csr_base);
unsigned short ram_test_controller_read_timer_resolution (unsigned long csr_base);
unsigned long ram_test_controller_read_timer (unsigned long csr_base);

#endif /* __RAM_TEST_CONTROLLER_H__ */
