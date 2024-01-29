#ifndef __RAM_TEST_CONTROLLER_REGS_H__
#define __RAM_TEST_CONTROLLER_REGS_H__


// individual 32-bit registers with byte address
#define RAM_TEST_CONTROLLER_LOW_BASE_REG                              0x0     /* r/w */
#define RAM_TEST_CONTROLLER_HIGH_BASE_REG                             0x4     /* r/w */
#define RAM_TEST_CONTROLLER_LENGTH_REG                                0x8     /* r/w */
#define RAM_TEST_CONTROLLER_BLOCK_REG                                 0xC     /* r/w */
#define RAM_TEST_CONTROLLER_CONTROL_REG                               0x10    /* r/w */
#define RAM_TEST_CONTROLLER_TIMER_RES_REG                             0x18    /* r/w */
#define RAM_TEST_CONTROLLER_TIMER_REG                                 0x1C    /* r/w */



// block registers
#define RAM_TEST_CONTROLLER_BLOCK_SIZE_MASK                           0x00FFFFFF
#define RAM_TEST_CONTROLLER_BLOCK_SIZE_BYTE_OFFSET                    0
#define RAM_TEST_CONTROLLER_BLOCK_SIZE_BIT_OFFSET                     0

#define RAM_TEST_CONTROLLER_BLOCK_TRAIL_DISTANCE_MASK                 0xFF000000
#define RAM_TEST_CONTROLLER_BLOCK_TRAIL_DISTANCE_BYTE_OFFSET          3
#define RAM_TEST_CONTROLLER_BLOCK_TRAIL_DISTANCE_BIT_OFFSET           24


// control registers
#define RAM_TEST_CONTROLLER_CONTROL_CONCURRENT_ACCESS_MASK            0x00000001
#define RAM_TEST_CONTROLLER_CONTROL_CONCURRENT_ACCESS_BYTE_OFFSET     0
#define RAM_TEST_CONTROLLER_CONTROL_CONCURRENT_ACCESS_BIT_OFFSET      0

#define RAM_TEST_CONTROLLER_CONTROL_START                             0x01000000
#define RAM_TEST_CONTROLLER_CONTROL_START_BYTE_OFFSET                 3
#define RAM_TEST_CONTROLLER_CONTROL_START_BIT_OFFSET                  24


#endif /* __RAM_TEST_CONTROLLER_REGS_H__ */
