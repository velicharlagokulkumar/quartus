/*

RAM Tester Software

This software will control the test controller,generator
cores of the RAM test system.  The test software do the memory test:

  - PRBS (16/32/64/128-bit wide PRBS pattern)
*/

#include "stdio.h" 
#include "settings.h"
#include "prbs.h"

int main()
{
  int failure_detected = 0;
  unsigned long test_time = 0;

  initialize();
 
  printf("entered\n");
  
  //PIO
  //program_pio(1); 

  //PRBS GEN
  program_prbs_generator(RAM_LENGTH_MINIMUM);
 
  //RAM CONTROLLER
  printf("Starting.....\n");
  program_ram_test_controller(RAM_BASE, RAM_LENGTH_MINIMUM, BLOCK_SIZE_MINIMUM, BLOCK_TRAIL_DISTANCE_MINIMUM, CONCURRENT_ACCESS_ENABLE,TIMER_RESOLUTION);
  printf("Finishing test.\n");
  test_time = ram_test_controller_read_timer(RAM_TEST_CONTROLLER_BASE);  // the timer only runs while the masters are moving data so we can read the timer result here
  printf("%d bytes transferred in %lu clock cycles\n", 2*RAM_LENGTH_MINIMUM, test_time * TIMER_RESOLUTION); 

      if (failure_detected != 0)
      {
        printf("\nExiting due to an error being detected or test timeout.\n%c", 0x4);
      } 
      else
      {
        printf("\nTest cycle complete.\n");
      }

    printf("Entire test is complete\n");
    return failure_detected;  // returns 1 if a failure was detected, a 2 if any of the tests time out, otherwise 0 is return if all the tests pass on time
}
