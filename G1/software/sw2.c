#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <errno.h>
#include <stdint.h>

#include "fpga_dmac_api.h"

#define DMA_TRANSFER_SIZE 	8

/**************************SOME MACROS TO EASE PROGRAMMING*******************/
//Constants to do mmap and get access to FPGA and HPS peripherals
#define HPS_FPGA_BRIDGE_BASE 0x80000000
#define HW_REGS_BASE ( HPS_FPGA_BRIDGE_BASE )
#define HW_REGS_SPAN ( 0x40000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

//The address of FPGA-DMAC is the HPS-FPGA bridge + Qsys address assigned to it
#define FPGA_DMAC_QSYS_ADDRESS 0x00080000
#define FPGA_DMAC_ADDRESS ((uint8_t*)0x80000000+FPGA_DMAC_QSYS_ADDRESS)
//Address of the On-Chip RAM in the FPGA, as seen by processor
#define FPGA_OCR_QSYS_ADDRESS_UP 0x00800000
#define FPGA_OCR_ADDRESS_UP ((uint8_t*)0x80000000+FPGA_OCR_QSYS_ADDRESS_UP)
//Address of the On-Chip RAM in the FPGA, as seen by DMAC
#define FPGA_OCR_ADDRESS_DMAC 0x00800000
//Address of the HPS-OCR, as seen by both processor and FPGA-DMAC
#define HPS_OCR_ADDRESS 0xFFE00000

//DMAC transfer addresses (from processor they are virtual addresses)
//#define WRITE_OPERATION
#ifdef WRITE_OPERATION
  #define DMA_TRANSFER_SRC_DMAC   ((uint8_t*) FPGA_OCR_ADDRESS_DMAC)
  #define DMA_TRANSFER_SRC_UP     ((uint8_t*) FPGA_OCR_vaddr)
  #define DMA_TRANSFER_DST_DMAC   ((uint8_t*) HPS_OCR_ADDRESS)
  #define DMA_TRANSFER_DST_UP     ((uint8_t*) HPS_OCR_vaddr)
#else
  #define DMA_TRANSFER_SRC_DMAC   ((uint8_t*) HPS_OCR_ADDRESS)
  #define DMA_TRANSFER_SRC_UP     ((uint8_t*) HPS_OCR_vaddr)
  #define DMA_TRANSFER_DST_DMAC   ((uint8_t*) FPGA_OCR_ADDRESS_DMAC)
  #define DMA_TRANSFER_DST_UP     ((uint8_t*) FPGA_OCR_vaddr)
#endif

void printbuff(uint8_t* buff, int size)
{
  int i;
  printf("[");
  for (i=0; i<size; i++)
  {
    printf("%u",buff[i]);
    if (i<(size-1)) printf(",");
  }
  printf("]");
  printf("\n");
}

int main() {
  int i;

  //-------GENERATE VIRTUAL ADRESSES TO ACCESS FPGA FROM PROCESSOR---------//
  void *virtual_base;
   void *virtual_base2;
  
  int fd;
  if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
	  printf( "ERROR: could not open \"/dev/mem\"...\n" );
	  return( 1 );
  }
  //mmap from 0xC0000000 to 0xFFFFFFFF (1GB): FPGA and HPS peripherals
  virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ),
    MAP_SHARED, fd, HW_REGS_BASE );

  virtual_base2 = mmap( NULL, 0x1000, ( PROT_READ | PROT_WRITE ),
    MAP_SHARED, fd, 0xFFE00000 );

  if( virtual_base == MAP_FAILED ) {
	  printf( "ERROR: mmap() failed...\n" );
	  close( fd );
	  return( 1 );
  }

  //virtual addresses for all components
  void *FPGA_DMA_vaddr_void = virtual_base
  + ((unsigned long)(FPGA_DMAC_QSYS_ADDRESS) & (unsigned long)( HW_REGS_MASK ));

  void *FPGA_OCR_vaddr_void = virtual_base
  + ((unsigned long)(FPGA_OCR_QSYS_ADDRESS_UP) & (unsigned long)( HW_REGS_MASK ));
  uint8_t* FPGA_OCR_vaddr = (uint8_t *) FPGA_OCR_vaddr_void;

  void *HPS_OCR_vaddr_void = virtual_base+ ((unsigned long)(HPS_OCR_ADDRESS-HPS_FPGA_BRIDGE_BASE) &(unsigned long)( HW_REGS_MASK ));
  uint8_t* HPS_OCR_vaddr = (uint8_t *) HPS_OCR_vaddr_void;
  uint8_t* HPS_OCR_vaddr2 = (uint8_t *) virtual_base2;

  //-----CHECK IF THE FPGA OCR AND HPS OCR ARE ACCESSIBLE AND RESET THEM------//
  //Check the on-chip RAM memory in the FPGA (Source of the DMA transfer)
  uint8_t* fpga_ocr_ptr = FPGA_OCR_vaddr;
  for (i=0; i<DMA_TRANSFER_SIZE; i++)
  {
    *fpga_ocr_ptr = (uint8_t) i;
    if (*fpga_ocr_ptr != (uint8_t)i)
    {
      printf ("Error when checking FPGA On-Chip RAM in Byte %d\n", i);
      return 0;
    }
    fpga_ocr_ptr++;
  }
  printf("Check FPGA On-Chip RAM OK\n");

  //Check the on-chip RAM memory in the HPS (Destiny of DMA transfer)
  uint8_t* hps_ocr_ptr = HPS_OCR_vaddr2;
  for (i=0; i<DMA_TRANSFER_SIZE; i++)
  {
    *hps_ocr_ptr = (uint8_t) i;
    if (*hps_ocr_ptr != (uint8_t)i)
    {
      printf ("Error when checking HPS On-Chip RAM in Byte %d\n", i);
      return 0;
    }
    hps_ocr_ptr++;
  }
  printf("Check HPS On-Chip RAM OK\n");

/*
  //Reset FPGA-OCR
  fpga_ocr_ptr = FPGA_OCR_vaddr;
  for (i=0; i<DMA_TRANSFER_SIZE; i++)
  {
    *fpga_ocr_ptr = 0;
    if (*fpga_ocr_ptr != 0)
    {
      printf ("Error when resetting FPGA On-Chip RAM in Byte %d\n", i);
      return 0;
    }
    fpga_ocr_ptr++;
  }
  printf("Reset FPGA On-Chip RAM OK\n");

  //Reset HPS-OCR
  hps_ocr_ptr = HPS_OCR_vaddr;
  for (i=0; i<DMA_TRANSFER_SIZE; i++)
  {
    *hps_ocr_ptr = 0;
    if (*hps_ocr_ptr != 0)
    {
      printf ("Error when resetting On-Chip RAM in Byte %d\n", i);
      return 0;
    }
    hps_ocr_ptr++;
  }
  printf("Reset On-Chip RAM OK\n");

  //-----------------DO DMA TRANSFER USING THE FPGA-DMAC-----------------//
  //Fill uP buffer and show uP and FPGA buffers
  printf("\nWRITE: Copy %d Bytes from FPGA OCR (%x) to HPS OCR (%x)\n",
    (int) DMA_TRANSFER_SIZE, (unsigned int) DMA_TRANSFER_SRC_UP,
    (unsigned int) DMA_TRANSFER_DST_UP);

  for (i=0; i<DMA_TRANSFER_SIZE;i++) DMA_TRANSFER_SRC_UP[i] = (uint8_t)rand();
  printf("FPGA OCR before DMA transfer = ");
  printbuff(DMA_TRANSFER_SRC_UP, DMA_TRANSFER_SIZE);
  printf("HPS OCR before DMA transfer = ");
  printbuff(DMA_TRANSFER_DST_UP, DMA_TRANSFER_SIZE);

  //Do the transfer using the DMA in the FPGA
  printf("Initializing DMA Controller\n");
  fpga_dma_write_reg( FPGA_DMA_vaddr_void,
                      FPGA_DMA_CONTROL,
                      FPGA_DMA_WORD_TRANSFERS |
                      FPGA_DMA_END_WHEN_LENGHT_ZERO
                    );
  fpga_dma_write_reg( FPGA_DMA_vaddr_void,   //set source address
                      FPGA_DMA_READADDRESS,
                      (uint32_t) DMA_TRANSFER_SRC_DMAC);
  fpga_dma_write_reg( FPGA_DMA_vaddr_void,  //set destiny address
                      FPGA_DMA_WRITEADDRESS,
                      (uint32_t) DMA_TRANSFER_DST_DMAC);
  fpga_dma_write_reg( FPGA_DMA_vaddr_void, //set transfer size
                      FPGA_DMA_LENGTH,
                      DMA_TRANSFER_SIZE);
  fpga_dma_write_bit( FPGA_DMA_vaddr_void, //clean the done bit
                      FPGA_DMA_STATUS,
                      FPGA_DMA_DONE,
                      0);

  //printf("Start DMA Transfer\n");
  fpga_dma_write_bit( FPGA_DMA_vaddr_void,//start transfer
                      FPGA_DMA_CONTROL,
                      FPGA_DMA_GO,
                      1);
  while(fpga_dma_read_bit(FPGA_DMA_vaddr_void, FPGA_DMA_STATUS,
    FPGA_DMA_DONE)==0) {}
  printf("DMA Transfer Finished\n");

    //print the result of the Write
  printf("FPGA OCR after DMA transfer = ");
  printbuff(DMA_TRANSFER_SRC_UP, DMA_TRANSFER_SIZE);
  printf("HPS OCR after DMA transfer = ");
  printbuff(DMA_TRANSFER_DST_UP, DMA_TRANSFER_SIZE);
	if(memcmp(DMA_TRANSFER_SRC_UP, DMA_TRANSFER_DST_UP,(size_t)DMA_TRANSFER_SIZE)==0)
    printf("Write Successful!\n");
  else
    printf("Write Error. Buffers are not equal\n");

	// --------------clean up our memory mapping and exit -----------------//
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}
*/
	close( fd );
	return( 0 );
}