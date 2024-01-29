#ifndef __PRBS_H__
#define __PRBS_H__

// This is generated using the qsys in which HPS is present using the sopc-create-header-files tool
// contains all the base, span and offset information related to every IP in the system.
#include "qsys_top.h"
#include "hps.h"
#include "utils.h"
#include "ram_test_controller_regs.h"
#include "prbs_pattern_generator_regs.h"

// Aliases for HPS H2F and LWH2F base addresses. These MACROs are coming from the hps.h file
#define LWH2F_BASE ALT_FPGA_BRIDGE_LWH2F_ADDR
#define H2F_BASE ALT_FPGA_BRIDGE_AA32_H2F_1G_ADDR

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


u32 reg_read(u32 *addr, u32 offset)
{
    return *((int *)(addr + offset/4));
}

void reg_write(u32 *addr, u32 offset, u32 value)
{
    // printf("INFO: writing %x to %x + %x\n", value, addr, offset);
    *((int *)(addr + offset/4)) = value;
}


u32* init_h2f(int fd)
{
    u32 *ptr;
    off_t base = (off_t) H2F_BASE;
    // mmap devices connected to h2f into user space
    // TODO: use a MACRO generated automatically instead of 0x40220
    ptr = mmap(NULL, 0x40220, PROT_READ|PROT_WRITE, MAP_SHARED, fd, base);
    if (ptr == MAP_FAILED) {
        printf("mmap failed\n");
        return NULL;
    }
    return ptr;
}

u32* init_lwh2f(int fd)
{
    u32 *ptr;
    off_t base = (off_t) LWH2F_BASE;
    // mmap devices connected to lwh2f into user space
    // TODO: use a MACRO generated automatically instead of 0x40220
    ptr = mmap(NULL, 0x40440, PROT_READ|PROT_WRITE, MAP_SHARED, fd, base);
    if (ptr == MAP_FAILED) {            
        return NULL;
    }
    return ptr;
}

u32* init_dma2ddr_space(int fd)
{
    u32 *ptr;
    off_t base = (off_t) MM2S_DDR_BASE;
    // mmap devices connected to h2f into user space    
    ptr = mmap(NULL, MM2S_DDR_SIZE  + S2MM_DDR_SIZE, PROT_READ|PROT_WRITE, MAP_FILE | MAP_SHARED, fd, base);
    if (ptr == MAP_FAILED) {
        return NULL;
    }
    return ptr;
}


void prbs_generator_set_payload_length (u32 *ptr, unsigned long base, unsigned long length)
{
    reg_write(ptr, base + (PRBS_GENERATOR_PAYLOAD_LENGTH_REG), length);
  //IOWR_32DIRECT(base, PRBS_GENERATOR_PAYLOAD_LENGTH_REG, length);

}

void prbs_generator_disable_infinite_payload_length (u32 *ptr,unsigned long base)
{
   reg_write(ptr, base +(PRBS_GENERATOR_CONTROL_REG + PRBS_GENERATOR_INFINITE_PAYLOAD_LENGTH_ENABLE_BYTE_OFFSET), 0);
  //IOWR_8DIRECT(base, (PRBS_GENERATOR_CONTROL_REG + PRBS_GENERATOR_INFINITE_PAYLOAD_LENGTH_ENABLE_BYTE_OFFSET), 0);
}

void prbs_generator_enable_start (u32 *ptr,unsigned long base)
{

    reg_write(ptr, base + (PRBS_GENERATOR_CONTROL_REG + PRBS_GENERATOR_RUN_BYTE_OFFSET), 1);
  //reg_write(ptr, base + (PRBS_GENERATOR_CONTROL_REG + PRBS_GENERATOR_RUN_BYTE_OFFSET), 1);
  //IOWR_8DIRECT(base, (PRBS_GENERATOR_CONTROL_REG + PRBS_GENERATOR_RUN_BYTE_OFFSET), 1);
}


void ram_test_controller_set_base_address (u32 *ptr,unsigned long csr_base, unsigned long long ram_base)
{
  //IOWR_32DIRECT(csr_base, RAM_TEST_CONTROLLER_LOW_BASE_REG, ram_base & 0xFFFFFFFF);
  //IOWR_32DIRECT(csr_base, RAM_TEST_CONTROLLER_HIGH_BASE_REG, (ram_base >> 32) & 0xFFFFFFFF);
  reg_write(ptr, csr_base + RAM_TEST_CONTROLLER_LOW_BASE_REG, ram_base & 0xFFFFFFFF);
  reg_write(ptr, csr_base + RAM_TEST_CONTROLLER_HIGH_BASE_REG, (ram_base >> 32) & 0xFFFFFFFF);
}

int ram_test_controller_set_transfer_length (u32 *ptr,unsigned long csr_base, unsigned long length)
{
  int fail = 0;
  if (length <= 32)
  {
    length = 32;          // default block size in hardware is 32 so might as well fall back to this
    fail = 1;
  }
  //IOWR_32DIRECT(csr_base, RAM_TEST_CONTROLLER_LENGTH_REG, length);
  reg_write(ptr, csr_base + RAM_TEST_CONTROLLER_LENGTH_REG, length);
  return fail;  // returns 0 when a valid transfer length is passed in otherwise 1 will be returned
}

int ram_test_controller_set_block_size (u32 *ptr,unsigned long csr_base, unsigned long block_size)
{
  int fail = 0;
  if (block_size <= 32)
  {
    block_size = 32;      // default that the hardware uses
    fail = 1;
  }
  //IOWR_16DIRECT(csr_base, (RAM_TEST_CONTROLLER_BLOCK_REG + RAM_TEST_CONTROLLER_BLOCK_SIZE_BYTE_OFFSET), block_size & 0x0000FFFF);
  //IOWR_8DIRECT(csr_base, (RAM_TEST_CONTROLLER_BLOCK_REG + RAM_TEST_CONTROLLER_BLOCK_SIZE_BYTE_OFFSET + 2), (block_size >> 16) & 0x000000FF);
  reg_write(ptr, csr_base + (RAM_TEST_CONTROLLER_BLOCK_REG + RAM_TEST_CONTROLLER_BLOCK_SIZE_BYTE_OFFSET), block_size & 0x0000FFFF);
  reg_write(ptr, csr_base + (RAM_TEST_CONTROLLER_BLOCK_REG + RAM_TEST_CONTROLLER_BLOCK_SIZE_BYTE_OFFSET + 2), (block_size >> 16) & 0x000000FF);
  return fail;  // returns 0 when a valid block size is passed in otherwise 1 will be returned
}

int ram_test_controller_set_block_trail_distance (u32 *ptr,unsigned long csr_base, unsigned char trail_distance)
{
  int fail = 0;
  if (trail_distance == 0)
  {
    trail_distance = 1;    // default that the hardware uses
    fail = 1;
  }
  //IOWR_8DIRECT(csr_base, (RAM_TEST_CONTROLLER_BLOCK_REG + RAM_TEST_CONTROLLER_BLOCK_TRAIL_DISTANCE_BYTE_OFFSET), trail_distance);
  reg_write(ptr, csr_base + (RAM_TEST_CONTROLLER_BLOCK_REG + RAM_TEST_CONTROLLER_BLOCK_TRAIL_DISTANCE_BYTE_OFFSET), trail_distance);
  return fail;  // returns 0 when a valid trail distance is passed in otherwise 1 will be returned
}

void ram_test_controller_enable_concurrent_accesses (u32 *ptr,unsigned long csr_base)
{
   reg_write(ptr, csr_base + (RAM_TEST_CONTROLLER_CONTROL_REG + RAM_TEST_CONTROLLER_CONTROL_CONCURRENT_ACCESS_BYTE_OFFSET), 1);
  //IOWR_8DIRECT(csr_base, (RAM_TEST_CONTROLLER_CONTROL_REG + RAM_TEST_CONTROLLER_CONTROL_CONCURRENT_ACCESS_BYTE_OFFSET), 1);
}

void ram_test_controller_disable_concurrent_accesses (u32 *ptr,unsigned long csr_base)
{
  reg_write(ptr, csr_base + (RAM_TEST_CONTROLLER_CONTROL_REG + RAM_TEST_CONTROLLER_CONTROL_CONCURRENT_ACCESS_BYTE_OFFSET), 0);
  //IOWR_8DIRECT(csr_base, (RAM_TEST_CONTROLLER_CONTROL_REG + RAM_TEST_CONTROLLER_CONTROL_CONCURRENT_ACCESS_BYTE_OFFSET), 0);
}

void ram_test_controller_enable_start (u32 *ptr,unsigned long csr_base)
{
  reg_write(ptr, csr_base + (RAM_TEST_CONTROLLER_CONTROL_REG + RAM_TEST_CONTROLLER_CONTROL_START_BYTE_OFFSET), 1);
  //IOWR_8DIRECT(csr_base, (RAM_TEST_CONTROLLER_CONTROL_REG + RAM_TEST_CONTROLLER_CONTROL_START_BYTE_OFFSET), 1);
}

void ram_test_controller_disable_start (u32 *ptr,unsigned long csr_base)
{
  reg_write(ptr, csr_base + (RAM_TEST_CONTROLLER_CONTROL_REG + RAM_TEST_CONTROLLER_CONTROL_START_BYTE_OFFSET), 0);
 // IOWR_8DIRECT(csr_base, (RAM_TEST_CONTROLLER_CONTROL_REG + RAM_TEST_CONTROLLER_CONTROL_START_BYTE_OFFSET), 0);
}

int ram_test_controller_set_timer_resolution (u32 *ptr,unsigned long csr_base, unsigned short resolution)
{
  int fail = 0;
  if (resolution < 2)   // the resolution acts as a clock divider so it must be 2 or greater
  {
    resolution = 10;    // default that the hardware uses
    fail = 1;
  }
  //IOWR_16DIRECT(csr_base, RAM_TEST_CONTROLLER_TIMER_RES_REG, resolution);
  reg_write(ptr, csr_base + RAM_TEST_CONTROLLER_TIMER_RES_REG, resolution);
  return fail;  // returns 0 when a valid timer resolution is passed in otherwise 1 will be returned
}

void ram_test_controller_set_timer (u32 *ptr, unsigned long csr_base, unsigned long timer)  // use this to reset the timer by passing in timer = 0
{
  //IOWR_32DIRECT(csr_base, RAM_TEST_CONTROLLER_TIMER_REG, timer);
  reg_write(ptr, csr_base + RAM_TEST_CONTROLLER_TIMER_REG, timer);
}


unsigned long ram_test_controller_read_timer (u32 *ptr, unsigned long csr_base) 
{
   reg_read(ptr, csr_base);
  //return IORD_32DIRECT(csr_base, RAM_TEST_CONTROLLER_TIMER_REG);
}

#endif