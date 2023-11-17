#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/ipc.h> 
#include <sys/shm.h> 
#include <sys/mman.h>
#include <sys/time.h> 
#include <math.h> 

typedef unsigned int uint32_t;

#define AXI_SOC_2_FPGA_BASE_ADDRESS 0x80000000
#define AXI_SOC_2_FPGA_BASE_ADDRESS_SPAN 0x1
unsigned int *h2p_virtual_base;
unsigned int *h2p_lw_virtual_base;
unsigned int *lw_pio_write_ptr ;
int FPGA_PIO_WRITE = 0x300000;
int fd;	
	
int main()
{

	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) 	{
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}
    
	h2p_virtual_base = mmap( NULL, 0x100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x80003000);	
	if( h2p_virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap1() failed...\n" );
		close( fd );
		return(1);
	}

	h2p_virtual_base[0] = 0x1;
	printf("Address stored in target ptr: %p\n", h2p_virtual_base);
	printf("Value pointed to by ptr: %x\n", h2p_virtual_base[0]);
	return( 0 );
}