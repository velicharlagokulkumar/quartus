#ifndef __PRBS_H__
#define __PRBS_H__

// This is generated using the qsys in which HPS is present using the sopc-create-header-files tool
// contains all the base, span and offset information related to every IP in the system.
#include "../bsp/inc/qsys_top.h"
#include "../bsp/inc/ram_test_controller.h"
#include "../bsp/inc/prbs_pattern_generator.h"
#include "../bsp/inc/led_pio.h"

// dma descriptor and csr base address. These macros are coming from the qsys_top.h file
#define MM2S_CSR_BASE ALT_FPGA_BRIDGE_LWH2F_ADDR + base
#define MM2S_DSCR_BASE ALT_FPGA_BRIDGE_LWH2F_OFST + AGILEX_HPS_MSGDMA_MM2S_DESCRIPTOR_SLAVE_BASE
#define S2MM_CSR_BASE ALT_FPGA_BRIDGE_LWH2F_ADDR + AGILEX_HPS_MSGDMA_S2MM_CSR_BASE
#define S2MM_DSCR_BASE ALT_FPGA_BRIDGE_LWH2F_ADDR + AGILEX_HPS_MSGDMA_S2MM_DESCRIPTOR_SLAVE_BASE

// reserved memory region as per the device tree. Accessing this address space directly from the HPS
// is throwing a kernel panic error. Yet to figure out the issue. Using a 4 MB offset from base is 
// currently working but it is not guaranteed that it will work in the future. 
#define RESERVED_MEM_BASE 0x0
#define RESERVED_MEM_SIZE 0x2000000

// location from which mm2s dma will copy data from
#define MM2S_DDR_BASE RESERVED_MEM_BASE + 0x400000 // 4 MB offset
#define MM2S_DDR_SIZE 0x80000 // 256 KB // MSGDMA_MM2S_MAX_BYTE - this macro is configured with the max size of transfer
// but when the max size is configured as 256 MB = 268435456 bytes, quartus is setting this MACRO to 368435456. Not sure
// if this is because of a very high value. Check if the value is accurate before using the MACRO in the code

// location to which s2mm will copy data to
#define S2MM_DDR_BASE MM2S_DDR_BASE + MM2S_DDR_SIZE
#define S2MM_DDR_SIZE 0x80000 // 256 KB // MSGDMA_S2MM_MAX_BYTE

#define PRBS_PATTERN_GENERATOR_BASE                     AGILEX_HPS_PRBS_GENERATOR_1_BASE
#define RAM_TEST_CONTROLLER_BASE                        AGILEX_HPS_RAM_CONTROLLER_1_BASE
#define PIO_BASE                                        AGILEX_HPS_PIO_0_BASE


int program_ram_test_controller(unsigned long long test_base, unsigned long test_length, unsigned long block_size, unsigned long block_trail_distance, unsigned char concurrent_access_enable, unsigned long resolution);
void program_prbs_generator(unsigned long pattern_length);
void program_pio(unsigned long push_button);

#endif