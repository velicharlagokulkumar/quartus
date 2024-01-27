#ifndef __PRBS_H__
#define __PRBS_H__

// This is generated using the qsys in which HPS is present using the sopc-create-header-files tool
// contains all the base, span and offset information related to every IP in the system.
#include "qsys_top.h"
// s10 hps.h file copied from hwlib/socal/
#include "hps.h"
#include "utils.h"

/*
#include "sgdma_dispatcher.h"
#include "descriptor_regs.h"
#include "csr_regs.h"
#include "response_regs.h"
*/


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

#endif