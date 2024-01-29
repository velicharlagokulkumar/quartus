#ifndef __PRBS_PATTERN_GENERATOR_REGS_H__
#define __PRBS_PATTERN_GENERATOR_REGS_H__


// individual 32-bit registers with byte addressing
#define PRBS_GENERATOR_PAYLOAD_LENGTH_REG   					                0x0    /*    r/w    */
#define PRBS_GENERATOR_CONTROL_REG                                    0x8    /*    r/w    */
#define PRBS_GENERATOR_POLYNOMIAL_31_0_REG                            0x10   /*    r/w    */
#define PRBS_GENERATOR_POLYNOMIAL_63_32_REG                           0x14   /*    r/w    */
#define PRBS_GENERATOR_POLYNOMIAL_95_64_REG                           0x18   /*    r/w    */
#define PRBS_GENERATOR_POLYNOMIAL_127_96_REG                          0x1C   /*    r/w    */


// payload register
#define PRBS_GENERATOR_PAYLOAD_LENGTH_MASK                            0xFFFFFFFF
#define PRBS_GENERATOR_PAYLOAD_LENGTH_BYTE_OFFSET                     0
#define PRBS_GENERATOR_PAYLOAD_LENGTH_BIT_OFFSET                      0


// control register
#define PRBS_GENERATOR_INFINITE_PAYLOAD_LENGTH_ENABLE_MASK            0x00000001
#define PRBS_GENERATOR_INFINITE_PAYLOAD_LENGTH_ENABLE_BYTE_OFFSET     0
#define PRBS_GENERATOR_INFINITE_PAYLOAD_LENGTH_ENABLE_BIT_OFFSET      0

#define PRBS_GENERATOR_SEED_MASK                                      0x00010000
#define PRBS_GENERATOR_SEED_BYTE_OFFSET                               2
#define PRBS_GENERATOR_SEED_BIT_OFFSET                                16

#define PRBS_GENERATOR_RUN_MASK                                       0x01000000
#define PRBS_GENERATOR_RUN_BYTE_OFFSET                                3
#define PRBS_GENERATOR_RUN_BIT_OFFSET                                 24


// polynomial registers
#define PRBS_GENERATOR_POLYNOMIAL_31_0_MASK                           0xFFFFFFFF
#define PRBS_GENERATOR_POLYNOMIAL_31_0_BYTE_OFFSET                    0
#define PRBS_GENERATOR_POLYNOMIAL_31_0_BIT_OFFSET                     0

#define PRBS_GENERATOR_POLYNOMIAL_63_32_MASK                          0xFFFFFFFF
#define PRBS_GENERATOR_POLYNOMIAL_63_32_BYTE_OFFSET                   0
#define PRBS_GENERATOR_POLYNOMIAL_63_32_BIT_OFFSET                    0

#define PRBS_GENERATOR_POLYNOMIAL_95_64_MASK                          0xFFFFFFFF
#define PRBS_GENERATOR_POLYNOMIAL_95_64_BYTE_OFFSET                   0
#define PRBS_GENERATOR_POLYNOMIAL_95_64_BIT_OFFSET                    0

#define PRBS_GENERATOR_POLYNOMIAL_127_96_MASK                         0xFFFFFFFF
#define PRBS_GENERATOR_POLYNOMIAL_127_96_BYTE_OFFSET                  0
#define PRBS_GENERATOR_POLYNOMIAL_127_96_BIT_OFFSET                   0


#endif /* __PRBS_PATTERN_GENERATOR_REGS_H__ */


