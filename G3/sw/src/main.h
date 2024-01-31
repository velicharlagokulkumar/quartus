#ifndef __MAIN_H__
#define __MAIN_H__

#include "../include/qsys_top.h"
#include "../include/utils.h"
#include "../include/prbs_pattern_generator.h"
#include "../include/ram_test_controller.h"



/*  By default this software assumes the memory tester slave ports live in the top level.  This detection checks if the PRBS pattern
    generator does not live at the top level and switch all the names to use to use the following naming convention:
    
    memory_tester_subsystem_pattern_generator_subsystem_<slave port name>
    memory_tester_subsystem_pattern_checker_subsystem_<slave port name>
*/

#ifndef PRBS_PATTERN_GENERATOR_BASE
  #define PRBS_PATTERN_GENERATOR_BASE                     AGILEX_HPS_PRBS_GENERATOR_1_BASE
  #define RAM_TEST_CONTROLLER_BASE                        AGILEX_HPS_RAM_CONTROLLER_1_BASE
#endif


void program_prbs_pattern_payload_length (u32 *ptr, unsigned long pattern_length)
{
  prbs_generator_set_payload_length (ptr,PRBS_PATTERN_GENERATOR_BASE, pattern_length);  
  prbs_generator_enable_start (ptr,PRBS_PATTERN_GENERATOR_BASE);
}



int start_test(u32 *ptr,unsigned long long test_base, unsigned long test_length, unsigned long block_size, unsigned long block_trail_distance, unsigned char concurrent_access_enable)
{
  ram_test_controller_set_base_address (ptr, RAM_TEST_CONTROLLER_BASE, test_base);
  
  if (ram_test_controller_set_transfer_length (ptr, RAM_TEST_CONTROLLER_BASE, test_length) != 0)
  {
      printf("\nYou must set the transfer length to be at least 32 bytes\n");
      return 2;  // fail
  }
  if (ram_test_controller_set_block_size (ptr, RAM_TEST_CONTROLLER_BASE, block_size) != 0)
  {
      printf("\nYou must set the transfer block size to be at least 32 bytes\n");
      return 2;  // fail
  }
  if (ram_test_controller_set_block_trail_distance (ptr, RAM_TEST_CONTROLLER_BASE, block_trail_distance) != 0)
  {
      printf("\nYou must set the block trail distance to be 1 to 255\n");
    return 2;  // fail
  }
  
  if(concurrent_access_enable == 1) {   ram_test_controller_enable_concurrent_accesses (ptr, RAM_TEST_CONTROLLER_BASE);  }
  else {    ram_test_controller_disable_concurrent_accesses (ptr, RAM_TEST_CONTROLLER_BASE);  }
  
  ram_test_controller_enable_start (ptr, RAM_TEST_CONTROLLER_BASE);
  
  return 0;  // pass
}

#endif
