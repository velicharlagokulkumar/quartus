#ifndef _QSYS_TOP_H_
#define _QSYS_TOP_H_

/*
 * This file was automatically generated by the swinfo2header utility.
 * 
 * Created from SOPC Builder system 'qsys_top' in
 * file 'qsys_top.sopcinfo'.
 */

/*
 * This file contains macros for all modules with masters in the system and
 * all the devices connected to those masters.
 * Macro names have unique prefixes to prevent duplicate names.
 */

/*
 * Macros for device 'prbs_generator_1', class 'prbs_generator'
 * Path to the device is from the master group 'agilex_hps'.
 * The macros are prefixed with 'AGILEX_HPS_PRBS_GENERATOR_1_'.
 * The prefix is the master group descriptor and the slave descriptor.
 */
#define AGILEX_HPS_PRBS_GENERATOR_1_COMPONENT_TYPE prbs_generator
#define AGILEX_HPS_PRBS_GENERATOR_1_COMPONENT_NAME prbs_generator_1
#define AGILEX_HPS_PRBS_GENERATOR_1_BASE 0x0
#define AGILEX_HPS_PRBS_GENERATOR_1_SPAN 32
#define AGILEX_HPS_PRBS_GENERATOR_1_END 0x1f

/*
 * Macros for device 'ram_controller_1', class 'ram_controller'
 * Path to the device is from the master group 'agilex_hps'.
 * The macros are prefixed with 'AGILEX_HPS_RAM_CONTROLLER_1_'.
 * The prefix is the master group descriptor and the slave descriptor.
 */
#define AGILEX_HPS_RAM_CONTROLLER_1_COMPONENT_TYPE ram_controller
#define AGILEX_HPS_RAM_CONTROLLER_1_COMPONENT_NAME ram_controller_1
#define AGILEX_HPS_RAM_CONTROLLER_1_BASE 0x20
#define AGILEX_HPS_RAM_CONTROLLER_1_SPAN 32
#define AGILEX_HPS_RAM_CONTROLLER_1_END 0x3f

/*
 * Macros for device 'pio_0', class 'altera_avalon_pio'
 * Path to the device is from the master group 'agilex_hps'.
 * The macros are prefixed with 'AGILEX_HPS_PIO_0_'.
 * The prefix is the master group descriptor and the slave descriptor.
 */
#define AGILEX_HPS_PIO_0_COMPONENT_TYPE altera_avalon_pio
#define AGILEX_HPS_PIO_0_COMPONENT_NAME pio_0
#define AGILEX_HPS_PIO_0_BASE 0x3000
#define AGILEX_HPS_PIO_0_SPAN 16
#define AGILEX_HPS_PIO_0_END 0x300f
#define AGILEX_HPS_PIO_0_BIT_CLEARING_EDGE_REGISTER 0
#define AGILEX_HPS_PIO_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define AGILEX_HPS_PIO_0_CAPTURE 0
#define AGILEX_HPS_PIO_0_DATA_WIDTH 2
#define AGILEX_HPS_PIO_0_DO_TEST_BENCH_WIRING 0
#define AGILEX_HPS_PIO_0_DRIVEN_SIM_VALUE 0
#define AGILEX_HPS_PIO_0_EDGE_TYPE NONE
#define AGILEX_HPS_PIO_0_FREQ 100000000
#define AGILEX_HPS_PIO_0_HAS_IN 0
#define AGILEX_HPS_PIO_0_HAS_OUT 1
#define AGILEX_HPS_PIO_0_HAS_TRI 0
#define AGILEX_HPS_PIO_0_IRQ_TYPE NONE
#define AGILEX_HPS_PIO_0_RESET_VALUE 0

/*
 * Macros for device 'onchip_memory2_0', class 'altera_avalon_onchip_memory2'
 * Path to the device is from the master group 'pattern_writer_1'.
 * The macros are prefixed with 'PATTERN_WRITER_1_ONCHIP_MEMORY2_0_'.
 * The prefix is the master group descriptor and the slave descriptor.
 */
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_COMPONENT_TYPE altera_avalon_onchip_memory2
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_COMPONENT_NAME onchip_memory2_0
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_BASE 0x0
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_SPAN 4096
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_END 0xfff
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_CONTENTS_INFO ""
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_DUAL_PORT 0
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_GUI_RAM_BLOCK_TYPE AUTO
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_INIT_CONTENTS_FILE UNUSED
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_INIT_MEM_CONTENT 0
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_INSTANCE_ID NONE
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_NON_DEFAULT_INIT_FILE_ENABLED 0
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_RAM_BLOCK_TYPE AUTO
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_READ_DURING_WRITE_MODE DONT_CARE
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_SINGLE_CLOCK_OP 0
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_SIZE_MULTIPLE 1
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_SIZE_VALUE 4096
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_WRITABLE 1
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_MEMORY_INFO_DAT_SYM_INSTALL_DIR SIM_DIR
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_MEMORY_INFO_GENERATE_DAT_SYM 1
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_MEMORY_INFO_GENERATE_HEX 1
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_MEMORY_INFO_HAS_BYTE_LANE 0
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_MEMORY_INFO_HEX_INSTALL_DIR QPF_DIR
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_MEMORY_INFO_MEM_INIT_DATA_WIDTH 32
#define PATTERN_WRITER_1_ONCHIP_MEMORY2_0_MEMORY_INFO_MEM_INIT_FILENAME UNUSED


#endif /* _ALTERA_QSYS_TOP_H_ */
