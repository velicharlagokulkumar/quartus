#include "dma.h"
#define SIZE_OF_FILE 250

int main()
{
        printf("entered\n");

        int fd;
        char *memd = "/dev/mem";

        FILE *file;
        // u32 datain[SIZE_OF_FILE];
        u32 datain[SIZE_OF_FILE];

        file = fopen("output.txt", "wb+"); 

        if (file == NULL) {
        printf("Error opening file!\n");
        return 1; // return an error code
        }


        u32 *lwh2f_ptr;
        u32 *h2f_ptr;
        u32 *ddr_ptr;

        //sgdma_standard_descriptor mm2s_dscr_info;
        sgdma_standard_descriptor s2mm_dscr_info;

        printf("declaration\n");

        fd = open(memd, O_RDWR | O_SYNC);
        if (fd < 1) {
                printf("Invalid device file:%s.\n", memd);
                return -1;
        }       

        // initialize the lwf2f interface = get a ptr to the addr space
        lwh2f_ptr = init_lwh2f(fd);
        if(!lwh2f_ptr)
        {
                printf("lwh2f init failed\n");
                return -1;
        }
        // initialize the f2f interface = get a ptr to the addr space
        h2f_ptr = init_h2f(fd);
        if(!h2f_ptr)
        {
                printf("h2f init failed\n");
                return -1;
        }
        // initialize the ddr_ptr interface = get a ptr to the dma2ddr addr space
        ddr_ptr = init_dma2ddr_space(fd);
        if(!ddr_ptr)
        {
                printf("dma2ddr addr space init failed\n");
                return -1;
        }
        printf("address allocated\n");

        // setup s2mm dma
        setup_dma(h2f_ptr, AGILEX_HPS_MSGDMA_S2MM_CSR_BASE);
        printf("setting up dma done\n");

                u32 length = 1000; // bytes
        
        // create csr and dscr pointers
        u32 *s2mm_csr = h2f_ptr + AGILEX_HPS_MSGDMA_S2MM_CSR_BASE/4;
        u32 *s2mm_dscr = h2f_ptr + AGILEX_HPS_MSGDMA_S2MM_DESCRIPTOR_SLAVE_BASE/4;

        printf("\n ***********S2MM DMA***********\n\n");
        
        construct_standard_st_to_mm_descriptor(&s2mm_dscr_info, MM2S_DDR_BASE, length, DESCRIPTOR_CONTROL_GENERATE_EOP_MASK);                        
        print_dscr(s2mm_dscr_info);
        write_standard_descriptor(s2mm_csr,s2mm_dscr,&s2mm_dscr_info);
        printf("\n Write des exec ") ;


        printf("\n ------------PROGRAM TERMINATED------------\n\n");

}