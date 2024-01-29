/*

RAM Tester Software

This software will control the test controller, mux and demux, checker and generator
cores of the RAM test system.  The test software do the memory test:

  - PRBS (16/32/64/128-bit wide PRBS pattern)
  
The software by default prints messages to the console and flashes LEDs to represent
the test status.  By default the software tests the memory forever until an error is
detected.  With the default settings below this code will fit in an 8kB on-chip memory.

*/


#include "../include/qsys_top.h"
#include "../include/prbs.h"

#include "stdio.h"
#include "main.h"
#include "settings.h"  // don't change the code, edit the values in settings.h instead


int main()
{
  int failure_detected = 0;
  int main_test_byte_counter = 0;
  unsigned long length_counter, block_size_counter, block_trail_distance_counter, minor_test_counter;
  int skip_test;  // will be used to determine if a particular test needs to be skipped
  int output_counter = 0;
  unsigned long test_time = 0;
  unsigned long bytes_tested = 0;

    printf("entered\n");

        int fd;
        char *memd = "/dev/mem";
    
        u32 *h2f_ptr;

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

  printf("Starting test.\n");

  // throughout all the tests there will be a finite payload size used and the checker cores will not stop on a failure (test software will exit when the transfer completes)
  prbs_generator_disable_infinite_payload_length (h2f_ptr,PRBS_PATTERN_GENERATOR_BASE);
  ram_test_controller_set_timer_resolution(h2f_ptr,RAM_TEST_CONTROLLER_BASE, TIMER_RESOLUTION);
  program_prbs_pattern_payload_length (h2f_ptr,RAM_LENGTH_MINIMUM);  
  ram_test_controller_set_timer(h2f_ptr,RAM_TEST_CONTROLLER_BASE, 0);  // reset the timer built into the test controller to 0
  start_test(h2f_ptr,RAM_BASE, RAM_LENGTH_MINIMUM, BLOCK_SIZE_MINIMUM, BLOCK_TRAIL_DISTANCE_MINIMUM, CONCURRENT_ACCESS_ENABLE);


  test_time = ram_test_controller_read_timer(h2f_ptr, RAM_TEST_CONTROLLER_BASE);  // the timer only runs while the masters are moving data so we can read the timer result here

   printf("%d bytes transferred in %lu clock cycles\n", 2*RAM_LENGTH_MINIMUM, test_time*TIMER_RESOLUTION); 

      if (failure_detected != 0)
      {
        printf("\nExiting due to an error being detected or test timeout.\n%c", 0x4);
      } 
      else
      {
        printf("\nTest cycle complete.\n");
      }

    printf("Entire test is complete.\n\n %c", 0x4);
    return failure_detected;  // returns 1 if a failure was detected, a 2 if any of the tests time out, otherwise 0 is return if all the tests pass on time
}
