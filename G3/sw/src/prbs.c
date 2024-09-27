#include "prbs.h"

//PIO
void program_pio(unsigned long push_button)
{
  if(push_button == 1) { led_on(PIO_BASE);}
  else { led_off(PIO_BASE);  }
  
}

//PRBS Generator
void program_prbs_generator(unsigned long pattern_length)
{
  prbs_generator_set_payload_length (PRBS_PATTERN_GENERATOR_BASE, pattern_length); 
  prbs_generator_disable_infinite_payload_length (PRBS_PATTERN_GENERATOR_BASE);
  prbs_generator_enable_start (PRBS_PATTERN_GENERATOR_BASE);
}

//RAM TEST CONTROLLER
int program_ram_test_controller(unsigned long long test_base, unsigned long test_length, unsigned long block_size, unsigned long block_trail_distance, unsigned char concurrent_access_enable, unsigned long resolution)
{
  ram_test_controller_set_base_address (RAM_TEST_CONTROLLER_BASE, test_base);
  
  if (ram_test_controller_set_transfer_length (RAM_TEST_CONTROLLER_BASE, test_length) != 0)
  {
      printf("\nYou must set the transfer length to be at least 32 bytes\n");
      return 2;  // fail
  }
  if (ram_test_controller_set_block_size (RAM_TEST_CONTROLLER_BASE, block_size) != 0)
  {
      printf("\nYou must set the transfer block size to be at least 32 bytes\n");
      return 2;  // fail
  }
  if (ram_test_controller_set_block_trail_distance (RAM_TEST_CONTROLLER_BASE, block_trail_distance) != 0)
  {
      printf("\nYou must set the block trail distance to be 1 to 255\n");
    return 2;  // fail
  }
  
  if(concurrent_access_enable == 1) { ram_test_controller_enable_concurrent_accesses (RAM_TEST_CONTROLLER_BASE);  }
  else { ram_test_controller_disable_concurrent_accesses (RAM_TEST_CONTROLLER_BASE);  }
  

  ram_test_controller_set_timer_resolution(RAM_TEST_CONTROLLER_BASE, resolution);
  ram_test_controller_set_timer(RAM_TEST_CONTROLLER_BASE, 0);  // reset the timer built into the test controller to 0
  ram_test_controller_enable_start (RAM_TEST_CONTROLLER_BASE);
  
  return 0;  // pass
}
