#include "dma.h"
#define SIZE_OF_FILE 250


int main()
{

        int fd;
        char *memd = "/dev/mem";

        FILE *fptr_o;
        FILE *fptr;


        u32 *lwh2f_ptr;
        u32 *h2f_ptr;
        u32 *ddr_ptr;

        u32 datain[SIZE_OF_FILE];

       ddr_ptr = init_dma2ddr_space(fd);
        if(!ddr_ptr)
        {
                printf("dma2ddr addr space init failed\n");
                return -1;
        }
        printf("address allocated\n");

         memcpy(&datain, ddr_ptr ,sizeof(datain));
        printf("\n memcopy is done ") ;
        FILE *fptr_o = fopen("data_out.txt", "w"); 
        for(int i=0;i<SIZE_OF_FILE;i++){
        printf("%x\n",datain[i]);
        }

        if(fptr_o != NULL){

            for(int i=0;i<SIZE_OF_FILE;i++)
                fprintf(fptr_o,"%x\n",datain[i]);
        }
        fclose(fptr_o);

        printf("Array contents have been written to the file cated .\n");

        printf("\n ------------PROGRAM TERMINATED------------\n\n");
}