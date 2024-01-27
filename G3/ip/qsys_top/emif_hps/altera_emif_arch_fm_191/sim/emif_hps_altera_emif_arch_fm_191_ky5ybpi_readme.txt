---------------------
; Table of Contents ;
---------------------
  1. About this file
  2. Outputs of IP generation
  3. Instantiating IP in a Quartus Prime project
  4. Board Signal Integrity Analysis
  5. I/O assignments
  6. Pin locations
  7. Sharing core clocks between interfaces
  8. Sharing PLL reference clock pin between interfaces
  9. PLL reference clock input
 10. On-Chip Termination (OCT) interface
 11. Interface between FPGA and external memory
 12. Conduit between Hard Processor Subsystem and memory interface
 13. EMIF calibration component interface
 14. EMIF calibration component clock input interface
 15. Instantiating IP in a simulation project
 16. Full-calibration versus skip-calibration simulation
 17. IP Settings


------------------------
;   1. About this file ;
------------------------

   This is the readme file for the Intel External Memory Interface (EMIF) IP v22.4.
   
   The file provides a high-level overview of the IP. For details, refer to the
   handbook chapter on Agilex HPS DDR4 External Memory Interface.
   
   This file was auto-generated.


---------------------------------
;   2. Outputs of IP generation ;
---------------------------------

   IP generation supports the following output filesets:
   
      Synthesis            - This is the fileset you should use when instantiating the IP in
                             your Quartus Prime project. RTL files in this fileset can be
                             simulated, but your simulator must support SystemVerilog.
                             Simulating the synthesis files yields identical results as
                             simulating the simulation files.
   
      Simulation           - This fileset contains scripts and source files to help you
                             integrate the IP into your simulation project targeting a
                             3rd-party simulator of your choice. If you select VHDL
                             during IP generation, the fileset contains IEEE-encrypted
                             Verilog files that can be used in VHDL-only simulators, such
                             as ModelSim - Intel FPGA edition. All source files in the simulation
                             filesets are functionally equivalent to the synthesis fileset.
   
      Signal Integrity     - This fileset contains SPICE simulation decks and compliance
                             mask information for evaluating if your PCB meets the signal
                             integrity requirements of your desired interface. It is
                             strongly recommended that customers obtain 12-line extractions of
                             their PCBs and evaluate them using this flow in order to
                             reduce the risk of encountering signal-integrity issues
                             in their memory interface design. SPICE decks are provided to
                             generate eye diagrams at the receiver for the address/command
                             channel, the data write channel, and the data read channel.
   
      Example Design       - This fileset contains scripts to generate example Quartus Prime project
                             and simulation projects for 3rd-party simulators. An example
                             design contains an instantiation of the IP, a simple traffic
                             generator, and in the case of a simulation example design, a
                             simple memory model.


----------------------------------------------------
;   3. Instantiating IP in a Quartus Prime project ;
----------------------------------------------------

   If you instantiate the IP as part of a Platform Designer system, follow the Platform Designer
   documentation on how to instantiate the system in a Quartus Prime project.
   
   If the IP was generated as a standalone component, it is sufficient to add
   the generated .qip file from the synthesis fileset to your Quartus Prime project.
   The .qip file allows the Quartus Prime software to locate all the files of
   the IP, including RTL files, SDC files, hex files, and timing scripts. Once the
   .qip file is added, you can instantiate the memory interface in your RTL.


----------------------------------------
;   4. Board Signal Integrity Analysis ;
----------------------------------------

   The Board Signal Integrity analysis allows you to evaluate whether or not your
   External Memory Interface channel meets the impedance, crosstalk and ISI requirements
   to operate your memory interface at the target frequency while meeting the minimum
   data eye height and width requirements for reliable data capture.
   The analysis environment takes into account the signal integrity settings you have
   selected in the IP GUI for FPGA-side drive/receive strength, memory-side termination
   settings, and where applicable, termination settings for channels with multiple memory
   ranks (including the associated dynamic/nominal/park termination settings).
   Customers must supply the location of the FPGA and memory IBIS models, as well as the
   location of the 12-line PCB extraction models for the interface address/command and
   data channel models.  Package RLC values for the FPGA and memory must also be specified
   for accurate simulation.
   
   To run signal integrity analysis:
   
      1) Open the EMIF IP GUI
      2) Select all of the FPGA and Memory drive strength and termination settings for your design
      3) Select the "Signal Integrity" checkbox under the "Example Designs" tab
      4) Generate the IP or click the "Generate Example Design" button
      5) Locate the *_spice_files.zip and *_ip_parameters.dat files
      6) Update the *_ip_parameters.dat file with the location of your IBIS models and RLC values
      7) Unzip the *_spice_files.zip file, update the top-level SPICE decks to include the *.dat file
         above, and run the simulations for Address/Command, Data Write and Data Read channels.
   
   Note that most of the settings that are relevant to this instance of IP are contained within the
   auto-generated *_ip_parameters.dat file.  If you modify this file, please be sure to save a backup
   copy in case you need to restore the original simulation parameters.  The *_spice_files.zip file
   contails files that are common to all instances of IP, with the exception of the file
   "pin_parasitics.dat", which must be updated with the pin RLC parasitic information for both the
   FPGA and memory devices.  Consult the Agilex EMIF IP Handbook for further details.


------------------------
;   5. I/O assignments ;
------------------------

   The generated .qip file in the synthesis fileset contains the I/O standard and input/output
   termination assignments required by the memory interface pins to function correctly.
   The values to the assignments are based on user inputs provided during generation.
   
   Unlike previous EMIF IP, there is no need to manually run a *_pin_assignments.tcl
   script to annotate the assignments into the project's .qsf file.
   Assignments in the .qip file are read and applied during every compilation, regardless
   of how you name the memory interface pins in your design top-level component. No new
   assignment is created in the project's .qsf file during the process.
   
   You should never edit the generated .qip file, because changes made to this file
   are overwritten when you regenerate the IP. To override an I/O assignment made in
   the .qip file, simply add an assignment to the project's .qsf file. Assignments in
   the .qsf file always take precedence over those in the .qip file. Note that I/O
   assignments in the .qsf file must specify the names of your top-level pins as
   target (i.e. -to), and you must not use the -entity and -library options.
   
   Consult the .qip file for the set of I/O assignments that come with the IP.


----------------------
;   6. Pin locations ;
----------------------

   External memory interface for the Agilex HPS Hard Processor Subsystem (HPS)
   must follow a specific pinout. This is unlike external memory interfaces that
   do not target the HPS, where some flexibility exists.
   
   Compile the interface through the Quartus Prime Fitter to obtain the HPS-specific
   memory interface pinout. Alternatively, consult the device handbook and/or the
   device pinout files.
   


-----------------------------------------------
;   7. Sharing core clocks between interfaces ;
-----------------------------------------------

   When a design contains multiple memory interfaces of the same protocol, rate,
   frequency, and PLL reference clock source, it is possible for these interfaces
   to share a common set of core clock signals. Core clocks sharing allows your
   logic to use a single clock domain to synchronously access all interfaces.
   The feature also reduces the number of core clock networks required.
   
   In order for multiple memory interfaces to share core clocks, one of the interfaces
   must be specified as "Master" using the "Core clocks sharing" setting during
   generation, and the remaining interfaces must be denoted as "Slave". There is no
   preference to which interface needs to be a master. In the RTL, connect the
   clks_sharing_master_out signal from the master interface to the clks_sharing_slave_in
   signal of all the slave interfaces. Note that both the master and slave interfaces
   expose their own output clock ports in the RTL (e.g. emif_usr_clk, afi_clk), but the
   physical signals are equivalent and so it does not matter whether a clock port from a
   master or a slave is used.
   
   Core clocks sharing necessitates PLL reference clock sharing. Therefore,
   only the master interface exposes an input port for the PLL reference clock. The
   same PLL reference clock signal is used by all the slave interfaces. See section
   on PLL reference clock sharing for additional requirements.
   
   The core clocks sharing mode of the current IP is "No Sharing"


-----------------------------------------------------------
;   8. Sharing PLL reference clock pin between interfaces ;
-----------------------------------------------------------

   To share a single PLL reference clock signal between multiple memory interfaces,
   simply connect the same PLL reference clock signal to all interfaces in the RTL.
   
   Interfaces that share the same PLL reference clock signal must be placed in the
   same I/O row and must occupy consecutive banks.


----------------------------------
;   9. PLL reference clock input ;
----------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   pll_ref_clk                    1       input       PLL reference clock input


--------------------------------------------
;  10. On-Chip Termination (OCT) interface ;
--------------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   oct_rzqin                      1       input       Calibrated On-Chip Termination (OCT) RZQ input pin


---------------------------------------------------
;  11. Interface between FPGA and external memory ;
---------------------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   mem_ck                         1       output      CK clock
   mem_ck_n                       1       output      CK clock (negative leg)
   mem_a                          17      output      Address
   mem_act_n                      1       output      Activation command
   mem_ba                         2       output      Bank address
   mem_bg                         1       output      Bank group
   mem_cke                        1       output      Clock enable
   mem_cs_n                       1       output      Chip select
   mem_odt                        1       output      On-die termination
   mem_reset_n                    1       output      Asynchronous reset
   mem_par                        1       output      Command and address parity
   mem_alert_n                    1       input       Alert flag
   mem_dqs                        9       bidir       Data strobe
   mem_dqs_n                      9       bidir       Data strobe (negative leg)
   mem_dq                         72      bidir       Read/write data
   mem_dbi_n                      9       bidir       Acts as either the data bus inversion pin, or the data mask pin, depending on configuration. 


----------------------------------------------------------------------
;  12. Conduit between Hard Processor Subsystem and memory interface ;
----------------------------------------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   hps_to_emif                    4096    input       Signals coming from Hard Processor Subsystem to the memory interface
   emif_to_hps                    4096    output      Signals going to Hard Processor Subsystem from the memory interface
   hps_to_emif_gp                 2       input       Signals coming from Hard Processor Subsystem GPIO to the memory interface
   emif_to_hps_gp                 1       output      Signals going to Hard Processor Subsystem GPIO from the memory interface


---------------------------------------------
;  13. EMIF calibration component interface ;
---------------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   calbus_read                    1       output      EMIF Calibration component bus for read
   calbus_write                   1       output      EMIF Calibration component bus for write
   calbus_address                 20      output      EMIF Calibration component bus for address
   calbus_wdata                   32      output      EMIF Calibration component bus for write data
   calbus_rdata                   32      input       EMIF Calibration component bus for read data
   calbus_seq_param_tbl           4096    input       EMIF Calibration component bus for parameter table data


---------------------------------------------------------
;  14. EMIF calibration component clock input interface ;
---------------------------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   calbus_clk                     1       output      EMIF Calibration component bus for the clock


-------------------------------------------------
;  15. Instantiating IP in a simulation project ;
-------------------------------------------------

   The simulation fileset as well as the simulation example design contain scripts
   that illustrate what files are required when including the EMIF IP for simulation.
   The scripts are customized for all the 3rd-party simulators supported. It is highly
   recommended that you use these scripts as reference when setting up your simulation
   environment.


------------------------------------------------------------
;  16. Full-calibration versus skip-calibration simulation ;
------------------------------------------------------------

   During generation, you can specify the default RTL simulation behavior for PHY calibration.
   If you specify full-calibration simulation, the simulation time can take a very long time
   because all the stages and the detailed behavior of PHY calibration are simulated. If you
   specify skip-calibration simulation, the detailed behavior of PHY calibration is not
   simulated. Skip-calibration simulation is recommended unless you suspect a functional
   issue with the PHY calibration algorithm. Note however, that RTL simulation is a zero-delay
   simulation, and so timing-related calibration failures on hardware do not manifest themselves
   during RTL simulations.
   
   The setting that controls the calibration mode is encoded within the *_seq_params_sim.hex file
   and the *_seq_params_synth.hex file. When the IP is compiled under the Quartus Prime software,
   synthesis-directive causes the *_seq_params_synth.hex file to always be used. Outside of the
   Quartus Prime software (e.g. 3rd-party simulator), the *_seq_params_sim.hex file is always used.
   The behavior is the same regardless of which fileset is being synthesized or simulated.
   The calibration mode setting specified during generation only affects the *_seq_params_sim.hex
   file. The *_seq_params_synth.hex file always specifies full-calibration since full calibration
   is key to functional hardware.
   The RTL simulation behavior of the current IP is "Skip Calibration"


--------------------
;  17. IP Settings ;
--------------------

   SYS_INFO_DEVICE_FAMILY                            : Agilex
   SYS_INFO_DEVICE                                   : AGFB014R24B2E2V
   SYS_INFO_DEVICE_SPEEDGRADE                        : 2
   SYS_INFO_DEVICE_TEMPERATURE_GRADE                 : EXTENDED
   SYS_INFO_DEVICE_POWER_MODEL                       : STANDARD_POWER
   SYS_INFO_DEVICE_DIE_REVISIONS                     : HSSI_WHR_REVA HSSI_CRETE3_REVA MAIN_FM6_REVB
   FAMILY_ENUM                                       : FAMILY_AGILEX_HPS
   TRAIT_SUPPORTS_VID                                : 1
   TRAIT_IOBANK_REVISION                             : IO96A_REVB2
   PROTOCOL_ENUM                                     : PROTOCOL_DDR4
   IS_ED_SLAVE                                       : false
   INTERNAL_TESTING_MODE                             : false
   CAL_DEBUG_CLOCK_FREQUENCY                         : 50000000
   SYS_INFO_UNIQUE_ID                                : emif_hps_altera_emif_fm_hps_inst
   PREV_PROTOCOL_ENUM                                : PROTOCOL_DDR4
   PHY_FPGA_SPEEDGRADE_GUI                           : E2V (ES3) - change device under 'View'->'Device Family'
   PHY_TARGET_SPEEDGRADE                             : E2V
   PHY_TARGET_IS_ES                                  : false
   PHY_TARGET_IS_ES2                                 : false
   PHY_TARGET_IS_ES3                                 : true
   PHY_TARGET_IS_PRODUCTION                          : false
   PHY_CONFIG_ENUM                                   : CONFIG_PHY_AND_HARD_CTRL
   PHY_PING_PONG_EN                                  : false
   PHY_CLAMSHELL_EN                                  : false
   PHY_RATE_ENUM                                     : RATE_QUARTER
   PHY_MEM_CLK_FREQ_MHZ                              : 1200.0
   PHY_REF_CLK_FREQ_MHZ                              : 100.0
   PHY_REF_CLK_JITTER_PS                             : 10.0
   PHY_DLL_CORE_UPDN_EN                              : false
   PHY_CORE_CLKS_SHARING_ENUM                        : CORE_CLKS_SHARING_DISABLED
   PHY_CORE_CLKS_SHARING_EXPOSE_SLAVE_OUT            : false
   PHY_CALIBRATED_OCT                                : true
   PHY_AC_CALIBRATED_OCT                             : true
   PHY_CK_CALIBRATED_OCT                             : true
   PHY_DATA_CALIBRATED_OCT                           : true
   PHY_RZQ                                           : 240
   PHY_HPS_ENABLE_EARLY_RELEASE                      : false
   PHY_USER_PERIODIC_OCT_RECAL_ENUM                  : PERIODIC_OCT_RECAL_AUTO
   PHY_AC_IO_STD_ENUM                                : IO_STD_SSTL_12
   PHY_CK_IO_STD_ENUM                                : IO_STD_SSTL_12
   PHY_DATA_IO_STD_ENUM                              : IO_STD_POD_12
   PHY_AC_MODE_ENUM                                  : OUT_OCT_40_CAL
   PHY_CK_MODE_ENUM                                  : OUT_OCT_40_CAL
   PHY_AC_DEEMPHASIS_ENUM                            : DEEMPHASIS_MODE_OFF
   PHY_CK_DEEMPHASIS_ENUM                            : DEEMPHASIS_MODE_OFF
   PHY_DATA_OUT_DEEMPHASIS_ENUM                      : DEEMPHASIS_MODE_HIGH
   PHY_DATA_OUT_SLEW_RATE_ENUM                       : 
   PHY_DATA_OUT_MODE_ENUM                            : OUT_OCT_34_CAL
   PHY_MIMIC_HPS_EMIF                                : false
   PLL_ADD_EXTRA_CLKS                                : false
   PLL_USER_NUM_OF_EXTRA_CLKS                        : 0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_0               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_0               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_0              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_0              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_0                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_0              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_0            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_0             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_0                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_1               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_1               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_1              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_1              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_1                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_1              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_1            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_1             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_1                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_2               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_2               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_2              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_2              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_2                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_2              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_2            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_2             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_2                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_3               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_3               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_3              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_3              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_3                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_3              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_3            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_3             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_3                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_4               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_4               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_4              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_4              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_4                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_4              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_4            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_4             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_4                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_5               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_5               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_5              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_5              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_5                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_5              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_5            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_5             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_5                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_6               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_6               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_6              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_6              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_6                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_6              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_6            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_6             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_6                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_7               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_7               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_7              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_7              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_7                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_7              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_7            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_7             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_7                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_8               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_8               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_8              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_8              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_8                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_8              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_8            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_8             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_8                 : 50.0
   PLL_VCO_CLK_FREQ_MHZ                              : 1200.0
   PLL_NUM_OF_EXTRA_CLKS                             : 0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_0                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_0                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_1                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_1                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_2                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_2                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_3                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_3                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_4                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_4                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_5                   : 1200.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_5                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_6                   : 1200.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_6                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_7                   : 1200.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_7                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_8                   : 1200.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_8                   : 0.0
   PHY_DDR4_CONFIG_ENUM                              : CONFIG_PHY_AND_HARD_CTRL
   PHY_DDR4_USER_PING_PONG_EN                        : false
   PHY_DDR4_USER_CLAMSHELL_EN                        : false
   PHY_DDR4_USER_DLL_CORE_UPDN_EN                    : true
   PHY_DDR4_MEM_CLK_FREQ_MHZ                         : 1200.0
   PHY_DDR4_DEFAULT_REF_CLK_FREQ                     : false
   PHY_DDR4_USER_REF_CLK_FREQ_MHZ                    : 100.0
   PHY_DDR4_REF_CLK_JITTER_PS                        : 10.0
   PHY_DDR4_RATE_ENUM                                : RATE_QUARTER
   PHY_DDR4_CORE_CLKS_SHARING_ENUM                   : CORE_CLKS_SHARING_DISABLED
   PHY_DDR4_CORE_CLKS_SHARING_EXPOSE_SLAVE_OUT       : false
   PHY_DDR4_IO_VOLTAGE                               : 1.2
   PHY_DDR4_DEFAULT_IO                               : false
   PHY_DDR4_HPS_ENABLE_EARLY_RELEASE                 : false
   PHY_DDR4_USER_PERIODIC_OCT_RECAL_ENUM             : PERIODIC_OCT_RECAL_AUTO
   PHY_DDR4_MIMIC_HPS_EMIF                           : false
   PHY_DDR4_REF_CLK_FREQ_MHZ                         : 100.0
   PHY_DDR4_PING_PONG_EN                             : false
   PHY_DDR4_CLAMSHELL_EN                             : false
   PHY_DDR4_USER_AC_IO_STD_ENUM                      : IO_STD_SSTL_12
   PHY_DDR4_USER_AC_MODE_ENUM                        : OUT_OCT_40_CAL
   PHY_DDR4_USER_AC_SLEW_RATE_ENUM                   : unset
   PHY_DDR4_USER_AC_DEEMPHASIS_ENUM                  : unset
   PHY_DDR4_USER_CK_IO_STD_ENUM                      : IO_STD_SSTL_12
   PHY_DDR4_USER_CK_MODE_ENUM                        : OUT_OCT_40_CAL
   PHY_DDR4_USER_CK_SLEW_RATE_ENUM                   : unset
   PHY_DDR4_USER_CK_DEEMPHASIS_ENUM                  : unset
   PHY_DDR4_USER_DATA_IO_STD_ENUM                    : IO_STD_POD_12
   PHY_DDR4_USER_DATA_OUT_MODE_ENUM                  : OUT_OCT_34_CAL
   PHY_DDR4_USER_DATA_OUT_SLEW_RATE_ENUM             : unset
   PHY_DDR4_USER_DATA_OUT_DEEMPHASIS_ENUM            : unset
   PHY_DDR4_USER_DATA_IN_MODE_ENUM                   : IN_OCT_60_CAL
   PHY_DDR4_USER_AUTO_STARTING_VREFIN_EN             : true
   PHY_DDR4_USER_STARTING_VREFIN                     : 70.0
   PHY_DDR4_USER_PLL_REF_CLK_IO_STD_ENUM             : IO_STD_TRUE_DIFF_SIGNALING
   PHY_DDR4_USER_RZQ_IO_STD_ENUM                     : IO_STD_CMOS_12
   PHY_DDR4_AC_IO_STD_ENUM                           : IO_STD_SSTL_12
   PHY_DDR4_AC_MODE_ENUM                             : OUT_OCT_40_CAL
   PHY_DDR4_AC_SLEW_RATE_ENUM                        : SLEW_RATE_FM_FAST
   PHY_DDR4_AC_DEEMPHASIS_ENUM                       : DEEMPHASIS_MODE_OFF
   PHY_DDR4_CK_IO_STD_ENUM                           : IO_STD_SSTL_12
   PHY_DDR4_CK_MODE_ENUM                             : OUT_OCT_40_CAL
   PHY_DDR4_CK_SLEW_RATE_ENUM                        : SLEW_RATE_FM_FAST
   PHY_DDR4_CK_DEEMPHASIS_ENUM                       : DEEMPHASIS_MODE_OFF
   PHY_DDR4_DATA_IO_STD_ENUM                         : IO_STD_POD_12
   PHY_DDR4_DATA_OUT_MODE_ENUM                       : OUT_OCT_34_CAL
   PHY_DDR4_DATA_OUT_SLEW_RATE_ENUM                  : SLEW_RATE_FM_FAST
   PHY_DDR4_DATA_OUT_DEEMPHASIS_ENUM                 : DEEMPHASIS_MODE_HIGH
   PHY_DDR4_DATA_IN_MODE_ENUM                        : IN_OCT_60_CAL
   PHY_DDR4_AUTO_STARTING_VREFIN_EN                  : true
   PHY_DDR4_STARTING_VREFIN                          : 68.0
   PHY_DDR4_PLL_REF_CLK_IO_STD_ENUM                  : IO_STD_TRUE_DIFF_SIGNALING
   PHY_DDR4_RZQ_IO_STD_ENUM                          : IO_STD_CMOS_12
   MEM_FORMAT_ENUM                                   : MEM_FORMAT_DISCRETE
   MEM_READ_LATENCY                                  : 20.0
   MEM_WRITE_LATENCY                                 : 16
   MEM_BURST_LENGTH                                  : 8
   MEM_DATA_MASK_EN                                  : true
   MEM_HAS_SIM_SUPPORT                               : false
   MEM_HAS_BSI_SUPPORT                               : false
   MEM_NUM_OF_PHYSICAL_RANKS                         : 1
   MEM_NUM_OF_LOGICAL_RANKS                          : 1
   MEM_NUM_OF_DATA_ENDPOINTS                         : 1
   MEM_TTL_DATA_WIDTH                                : 72
   MEM_TTL_NUM_OF_READ_GROUPS                        : 9
   MEM_TTL_NUM_OF_WRITE_GROUPS                       : 9
   MEM_DDR4_FORMAT_ENUM                              : MEM_FORMAT_DISCRETE
   MEM_DDR4_DQ_WIDTH                                 : 72
   MEM_DDR4_DQ_PER_DQS                               : 8
   MEM_DDR4_DISCRETE_CS_WIDTH                        : 1
   MEM_DDR4_NUM_OF_DIMMS                             : 1
   MEM_DDR4_CHIP_ID_WIDTH                            : 0
   MEM_DDR4_RANKS_PER_DIMM                           : 1
   MEM_DDR4_CKE_PER_DIMM                             : 1
   MEM_DDR4_CK_WIDTH                                 : 1
   MEM_DDR4_ROW_ADDR_WIDTH                           : 17
   MEM_DDR4_COL_ADDR_WIDTH                           : 10
   MEM_DDR4_BANK_ADDR_WIDTH                          : 2
   MEM_DDR4_BANK_GROUP_WIDTH                         : 1
   MEM_DDR4_DM_EN                                    : true
   MEM_DDR4_ALERT_PAR_EN                             : true
   MEM_DDR4_ALERT_N_PLACEMENT_ENUM                   : DDR4_ALERT_N_PLACEMENT_AUTO
   MEM_DDR4_ALERT_N_DQS_GROUP                        : 0
   MEM_DDR4_ALERT_N_AC_LANE                          : 0
   MEM_DDR4_ALERT_N_AC_PIN                           : 0
   MEM_DDR4_DISCRETE_MIRROR_ADDRESSING_EN            : false
   MEM_DDR4_MIRROR_ADDRESSING_EN                     : true
   MEM_DDR4_HIDE_ADV_MR_SETTINGS                     : true
   MEM_DDR4_INTEL_DEFAULT_TERM                       : true
   MEM_DDR4_BL_ENUM                                  : DDR4_BL_BL8
   MEM_DDR4_BT_ENUM                                  : DDR4_BT_SEQUENTIAL
   MEM_DDR4_TCL                                      : 20
   MEM_DDR4_RTT_NOM_ENUM                             : DDR4_RTT_NOM_ODT_DISABLED
   MEM_DDR4_DLL_EN                                   : true
   MEM_DDR4_ATCL_ENUM                                : DDR4_ATCL_DISABLED
   MEM_DDR4_DRV_STR_ENUM                             : DDR4_DRV_STR_RZQ_7
   MEM_DDR4_ASR_ENUM                                 : DDR4_ASR_MANUAL_NORMAL
   MEM_DDR4_RTT_WR_ENUM                              : DDR4_RTT_WR_ODT_DISABLED
   MEM_DDR4_WTCL                                     : 16
   MEM_DDR4_WRITE_CRC                                : false
   MEM_DDR4_GEARDOWN                                 : DDR4_GEARDOWN_HR
   MEM_DDR4_PER_DRAM_ADDR                            : false
   MEM_DDR4_TEMP_SENSOR_READOUT                      : false
   MEM_DDR4_FINE_GRANULARITY_REFRESH                 : DDR4_FINE_REFRESH_FIXED_1X
   MEM_DDR4_MPR_READ_FORMAT                          : DDR4_MPR_READ_FORMAT_SERIAL
   MEM_DDR4_MAX_POWERDOWN                            : false
   MEM_DDR4_TEMP_CONTROLLED_RFSH_RANGE               : DDR4_TEMP_CONTROLLED_RFSH_NORMAL
   MEM_DDR4_TEMP_CONTROLLED_RFSH_ENA                 : false
   MEM_DDR4_INTERNAL_VREFDQ_MONITOR                  : false
   MEM_DDR4_CAL_MODE                                 : 0
   MEM_DDR4_SELF_RFSH_ABORT                          : false
   MEM_DDR4_READ_PREAMBLE_TRAINING                   : false
   MEM_DDR4_READ_PREAMBLE                            : 2
   MEM_DDR4_WRITE_PREAMBLE                           : 1
   MEM_DDR4_AC_PARITY_LATENCY                        : DDR4_AC_PARITY_LATENCY_DISABLE
   MEM_DDR4_ODT_IN_POWERDOWN                         : true
   MEM_DDR4_RTT_PARK                                 : DDR4_RTT_PARK_RZQ_4
   MEM_DDR4_AC_PERSISTENT_ERROR                      : false
   MEM_DDR4_WRITE_DBI                                : false
   MEM_DDR4_READ_DBI                                 : true
   MEM_DDR4_DEFAULT_VREFOUT                          : true
   MEM_DDR4_USER_VREFDQ_TRAINING_VALUE               : 56.0
   MEM_DDR4_USER_VREFDQ_TRAINING_RANGE               : DDR4_VREFDQ_TRAINING_RANGE_1
   MEM_DDR4_RCD_CA_IBT_ENUM                          : DDR4_RCD_CA_IBT_100
   MEM_DDR4_RCD_CS_IBT_ENUM                          : DDR4_RCD_CS_IBT_100
   MEM_DDR4_RCD_CKE_IBT_ENUM                         : DDR4_RCD_CKE_IBT_100
   MEM_DDR4_RCD_ODT_IBT_ENUM                         : DDR4_RCD_ODT_IBT_100
   MEM_DDR4_DB_RTT_NOM_ENUM                          : DDR4_DB_RTT_NOM_ODT_DISABLED
   MEM_DDR4_DB_RTT_WR_ENUM                           : DDR4_DB_RTT_WR_RZQ_3
   MEM_DDR4_DB_RTT_PARK_ENUM                         : DDR4_DB_RTT_PARK_ODT_DISABLED
   MEM_DDR4_DB_DQ_DRV_ENUM                           : DDR4_DB_DRV_STR_RZQ_7
   MEM_DDR4_SPD_137_RCD_CA_DRV                       : 101
   MEM_DDR4_SPD_138_RCD_CK_DRV                       : 5
   MEM_DDR4_SPD_140_DRAM_VREFDQ_R0                   : 29
   MEM_DDR4_SPD_141_DRAM_VREFDQ_R1                   : 29
   MEM_DDR4_SPD_142_DRAM_VREFDQ_R2                   : 29
   MEM_DDR4_SPD_143_DRAM_VREFDQ_R3                   : 29
   MEM_DDR4_SPD_144_DB_VREFDQ                        : 37
   MEM_DDR4_SPD_145_DB_MDQ_DRV                       : 21
   MEM_DDR4_SPD_148_DRAM_DRV                         : 0
   MEM_DDR4_SPD_149_DRAM_RTT_WR_NOM                  : 20
   MEM_DDR4_SPD_152_DRAM_RTT_PARK                    : 39
   MEM_DDR4_SPD_155_DB_VREFDQ_RANGE                  : 0
   MEM_DDR4_SPD_133_RCD_DB_VENDOR_LSB                : 0
   MEM_DDR4_SPD_134_RCD_DB_VENDOR_MSB                : 0
   MEM_DDR4_SPD_135_RCD_REV                          : 0
   MEM_DDR4_SPD_139_DB_REV                           : 0
   MEM_DDR4_LRDIMM_ODT_LESS_BS                       : false
   MEM_DDR4_LRDIMM_ODT_LESS_BS_PARK_OHM              : 240
   MEM_DDR4_DQS_WIDTH                                : 9
   MEM_DDR4_CS_WIDTH                                 : 1
   MEM_DDR4_CS_PER_DIMM                              : 1
   MEM_DDR4_CKE_WIDTH                                : 1
   MEM_DDR4_ODT_WIDTH                                : 1
   MEM_DDR4_ADDR_WIDTH                               : 17
   MEM_DDR4_RM_WIDTH                                 : 0
   MEM_DDR4_NUM_OF_PHYSICAL_RANKS                    : 1
   MEM_DDR4_NUM_OF_LOGICAL_RANKS                     : 1
   MEM_DDR4_IDEAL_VREF_IN_PCT                        : 68.0
   MEM_DDR4_IDEAL_VREF_OUT_PCT                       : 68.0
   MEM_DDR4_VREFDQ_TRAINING_VALUE                    : 68.0
   MEM_DDR4_VREFDQ_TRAINING_RANGE                    : DDR4_VREFDQ_TRAINING_RANGE_1
   MEM_DDR4_VREFDQ_TRAINING_RANGE_DISP               : Range 2 - 45% to 77.5%
   MEM_DDR4_INTEL_DEFAULT_DRV_STR_ENUM               : DDR4_DRV_STR_RZQ_7
   MEM_DDR4_INTEL_DEFAULT_RTT_WR_ENUM                : DDR4_RTT_WR_ODT_DISABLED
   MEM_DDR4_INTEL_DEFAULT_RTT_NOM_ENUM               : DDR4_RTT_NOM_ODT_DISABLED
   MEM_DDR4_INTEL_DEFAULT_RTT_PARK_ENUM              : DDR4_RTT_PARK_RZQ_4
   MEM_DDR4_INTEL_DEFAULT_DRV_STR_ENUM_DISP          : RZQ/7 (34 Ohm)
   MEM_DDR4_INTEL_DEFAULT_RTT_WR_ENUM_DISP           : Dynamic ODT off
   MEM_DDR4_INTEL_DEFAULT_RTT_NOM_ENUM_DISP          : ODT Disabled
   MEM_DDR4_INTEL_DEFAULT_RTT_PARK_ENUM_DISP         : RZQ/4 (60 Ohm)
   MEM_DDR4_INTEL_DEFAULT_DB_RTT_NOM_ENUM            : DDR4_DB_RTT_NOM_ODT_DISABLED
   MEM_DDR4_INTEL_DEFAULT_DB_RTT_WR_ENUM             : DDR4_DB_RTT_WR_RZQ_3
   MEM_DDR4_INTEL_DEFAULT_DB_RTT_PARK_ENUM           : DDR4_DB_RTT_PARK_ODT_DISABLED
   MEM_DDR4_INTEL_DEFAULT_DB_DQ_DRV_ENUM             : DDR4_DB_DRV_STR_RZQ_7
   MEM_DDR4_INTEL_DEFAULT_DB_RTT_NOM_ENUM_DISP       : RTT_NOM disabled
   MEM_DDR4_INTEL_DEFAULT_DB_RTT_WR_ENUM_DISP        : RZQ/3 (80 Ohm)
   MEM_DDR4_INTEL_DEFAULT_DB_RTT_PARK_ENUM_DISP      : RTT_PARK disabled
   MEM_DDR4_INTEL_DEFAULT_DB_DQ_DRV_ENUM_DISP        : RZQ/7 (34 Ohm)
   MEM_DDR4_TTL_DQS_WIDTH                            : 9
   MEM_DDR4_TTL_DQ_WIDTH                             : 72
   MEM_DDR4_TTL_CS_WIDTH                             : 1
   MEM_DDR4_TTL_CK_WIDTH                             : 1
   MEM_DDR4_TTL_CKE_WIDTH                            : 1
   MEM_DDR4_TTL_ODT_WIDTH                            : 1
   MEM_DDR4_TTL_BANK_ADDR_WIDTH                      : 2
   MEM_DDR4_TTL_BANK_GROUP_WIDTH                     : 1
   MEM_DDR4_TTL_CHIP_ID_WIDTH                        : 0
   MEM_DDR4_TTL_ADDR_WIDTH                           : 17
   MEM_DDR4_TTL_RM_WIDTH                             : 0
   MEM_DDR4_TTL_NUM_OF_DIMMS                         : 1
   MEM_DDR4_TTL_NUM_OF_PHYSICAL_RANKS                : 1
   MEM_DDR4_TTL_NUM_OF_LOGICAL_RANKS                 : 1
   MEM_DDR4_MR0                                      : 0x844
   MEM_DDR4_MR1                                      : 0x10001
   MEM_DDR4_MR2                                      : 0x20028
   MEM_DDR4_MR3                                      : 0x30400
   MEM_DDR4_MR4                                      : 0x40800
   MEM_DDR4_MR5                                      : 0x51460
   MEM_DDR4_MR6                                      : 0x61063
   MEM_DDR4_RDIMM_CONFIG                             : 
   MEM_DDR4_LRDIMM_EXTENDED_CONFIG                   : 
   MEM_DDR4_ADDRESS_MIRROR_BITVEC                    : 0
   MEM_DDR4_RCD_PARITY_CONTROL_WORD                  : 13
   MEM_DDR4_RCD_COMMAND_LATENCY                      : 1
   MEM_DDR4_USE_DEFAULT_ODT                          : false
   MEM_DDR4_R_ODTN_1X1                               : {Rank 0}
   MEM_DDR4_R_ODT0_1X1                               : off
   MEM_DDR4_W_ODTN_1X1                               : {Rank 0}
   MEM_DDR4_W_ODT0_1X1                               : off
   MEM_DDR4_R_ODTN_2X2                               : {Rank 0} {Rank 1}
   MEM_DDR4_R_ODT0_2X2                               : off off
   MEM_DDR4_R_ODT1_2X2                               : off off
   MEM_DDR4_W_ODTN_2X2                               : {Rank 0} {Rank 1}
   MEM_DDR4_W_ODT0_2X2                               : on off
   MEM_DDR4_W_ODT1_2X2                               : off on
   MEM_DDR4_R_ODTN_4X2                               : {Rank 0} {Rank 1} {Rank 2} {Rank 3}
   MEM_DDR4_R_ODT0_4X2                               : off off on on
   MEM_DDR4_R_ODT1_4X2                               : on on off off
   MEM_DDR4_W_ODTN_4X2                               : {Rank 0} {Rank 1} {Rank 2} {Rank 3}
   MEM_DDR4_W_ODT0_4X2                               : off off on on
   MEM_DDR4_W_ODT1_4X2                               : on on off off
   MEM_DDR4_R_ODTN_4X4                               : {Rank 0} {Rank 1} {Rank 2} {Rank 3}
   MEM_DDR4_R_ODT0_4X4                               : off off on off
   MEM_DDR4_R_ODT1_4X4                               : off off off on
   MEM_DDR4_R_ODT2_4X4                               : on off off off
   MEM_DDR4_R_ODT3_4X4                               : off on off off
   MEM_DDR4_W_ODTN_4X4                               : {Rank 0} {Rank 1} {Rank 2} {Rank 3}
   MEM_DDR4_W_ODT0_4X4                               : on off on off
   MEM_DDR4_W_ODT1_4X4                               : off on off on
   MEM_DDR4_W_ODT2_4X4                               : on off on off
   MEM_DDR4_W_ODT3_4X4                               : off on off on
   MEM_DDR4_R_DERIVED_ODTN                           : {Rank 0} - - -
   MEM_DDR4_R_DERIVED_ODT0                           : {(Drive) RZQ/7 (34 Ohm)} - - -
   MEM_DDR4_R_DERIVED_ODT1                           : - - - -
   MEM_DDR4_R_DERIVED_ODT2                           : - - - -
   MEM_DDR4_R_DERIVED_ODT3                           : - - - -
   MEM_DDR4_R_DERIVED_BODTN                          : 
   MEM_DDR4_R_DERIVED_BODT0                          : 
   MEM_DDR4_R_DERIVED_BODT1                          : 
   MEM_DDR4_W_DERIVED_ODTN                           : {Rank 0} - - -
   MEM_DDR4_W_DERIVED_ODT0                           : {(Park) RZQ/4 (60 Ohm)} - - -
   MEM_DDR4_W_DERIVED_ODT1                           : - - - -
   MEM_DDR4_W_DERIVED_ODT2                           : - - - -
   MEM_DDR4_W_DERIVED_ODT3                           : - - - -
   MEM_DDR4_W_DERIVED_BODTN                          : 
   MEM_DDR4_W_DERIVED_BODT0                          : 
   MEM_DDR4_W_DERIVED_BODT1                          : 
   MEM_DDR4_SEQ_ODT_TABLE_LO                         : 0
   MEM_DDR4_SEQ_ODT_TABLE_HI                         : 0
   MEM_DDR4_CTRL_CFG_READ_ODT_CHIP                   : 0
   MEM_DDR4_CTRL_CFG_WRITE_ODT_CHIP                  : 0
   MEM_DDR4_CTRL_CFG_READ_ODT_RANK                   : 0
   MEM_DDR4_CTRL_CFG_WRITE_ODT_RANK                  : 0
   MEM_DDR4_SPEEDBIN_ENUM                            : DDR4_SPEEDBIN_3200
   MEM_DDR4_TIS_PS                                   : 40
   MEM_DDR4_TIS_AC_MV                                : 90
   MEM_DDR4_TIH_PS                                   : 65
   MEM_DDR4_TIH_DC_MV                                : 65
   MEM_DDR4_TDIVW_TOTAL_UI                           : 0.23
   MEM_DDR4_VDIVW_TOTAL                              : 110
   MEM_DDR4_TDQSQ_UI                                 : 0.18
   MEM_DDR4_TQH_UI                                   : 0.74
   MEM_DDR4_TDVWP_UI                                 : 0.72
   MEM_DDR4_TDQSCK_PS                                : 170
   MEM_DDR4_TDQSS_CYC                                : 0.27
   MEM_DDR4_TQSH_CYC                                 : 0.4
   MEM_DDR4_TDSH_CYC                                 : 0.18
   MEM_DDR4_TDSS_CYC                                 : 0.18
   MEM_DDR4_TWLS_CYC                                 : 0.13
   MEM_DDR4_TWLH_CYC                                 : 0.13
   MEM_DDR4_TINIT_US                                 : 500
   MEM_DDR4_TMRD_CK_CYC                              : 8
   MEM_DDR4_TRAS_NS                                  : 32.0
   MEM_DDR4_TRCD_NS                                  : 13.75
   MEM_DDR4_TRP_NS                                   : 13.75
   MEM_DDR4_TREFI_US                                 : 7.8
   MEM_DDR4_TRFC_NS                                  : 350.0
   MEM_DDR4_TWR_NS                                   : 15.0
   MEM_DDR4_TWTR_L_CYC                               : 12
   MEM_DDR4_TWTR_S_CYC                               : 4
   MEM_DDR4_TFAW_NS                                  : 30.0
   MEM_DDR4_TRRD_L_CYC                               : 8
   MEM_DDR4_TRRD_S_CYC                               : 7
   MEM_DDR4_TCCD_L_CYC                               : 8
   MEM_DDR4_TCCD_S_CYC                               : 4
   MEM_DDR4_TRFC_DLR_NS                              : 120.0
   MEM_DDR4_TFAW_DLR_CYC                             : 16
   MEM_DDR4_TRRD_DLR_CYC                             : 4
   MEM_DDR4_TDIVW_DJ_CYC                             : 0.1
   MEM_DDR4_TDQSQ_PS                                 : 66
   MEM_DDR4_TQH_CYC                                  : 0.38
   MEM_DDR4_TINIT_CK                                 : 600000
   MEM_DDR4_TDQSCK_DERV_PS                           : 2
   MEM_DDR4_TDQSCKDS                                 : 450
   MEM_DDR4_TDQSCKDM                                 : 900
   MEM_DDR4_TDQSCKDL                                 : 1200
   MEM_DDR4_TRAS_CYC                                 : 39
   MEM_DDR4_TRCD_CYC                                 : 17
   MEM_DDR4_TRP_CYC                                  : 17
   MEM_DDR4_TRFC_CYC                                 : 420
   MEM_DDR4_TWR_CYC                                  : 18
   MEM_DDR4_TRTP_CYC                                 : 9
   MEM_DDR4_TFAW_CYC                                 : 36
   MEM_DDR4_TREFI_CYC                                : 9360
   MEM_DDR4_WRITE_CMD_LATENCY                        : 6
   MEM_DDR4_TRFC_DLR_CYC                             : 144
   MEM_DDR4_CFG_GEN_SBE                              : false
   MEM_DDR4_CFG_GEN_DBE                              : false
   MEM_DDR4_LRDIMM_VREFDQ_VALUE                      : 
   MEM_DDR4_TWLS_PS                                  : 0.0
   MEM_DDR4_TWLH_PS                                  : 0.0
   BOARD_DDR4_USE_DEFAULT_SLEW_RATES                 : true
   BOARD_DDR4_USE_DEFAULT_ISI_VALUES                 : true
   BOARD_DDR4_USER_CK_SLEW_RATE                      : 4.0
   BOARD_DDR4_USER_AC_SLEW_RATE                      : 2.0
   BOARD_DDR4_USER_RCLK_SLEW_RATE                    : 8.0
   BOARD_DDR4_USER_WCLK_SLEW_RATE                    : 4.0
   BOARD_DDR4_USER_RDATA_SLEW_RATE                   : 4.0
   BOARD_DDR4_USER_WDATA_SLEW_RATE                   : 2.0
   BOARD_DDR4_USER_AC_ISI_NS                         : 0.0
   BOARD_DDR4_USER_RCLK_ISI_NS                       : 0.0
   BOARD_DDR4_USER_WCLK_ISI_NS                       : 0.0
   BOARD_DDR4_USER_RDATA_ISI_NS                      : 0.0
   BOARD_DDR4_USER_WDATA_ISI_NS                      : 0.0
   BOARD_DDR4_IS_SKEW_WITHIN_DQS_DESKEWED            : true
   BOARD_DDR4_BRD_SKEW_WITHIN_DQS_NS                 : 0.02
   BOARD_DDR4_PKG_BRD_SKEW_WITHIN_DQS_NS             : 0.02
   BOARD_DDR4_IS_SKEW_WITHIN_AC_DESKEWED             : false
   BOARD_DDR4_BRD_SKEW_WITHIN_AC_NS                  : 0.02
   BOARD_DDR4_PKG_BRD_SKEW_WITHIN_AC_NS              : 0.02
   BOARD_DDR4_DQS_TO_CK_SKEW_NS                      : 0.02
   BOARD_DDR4_SKEW_BETWEEN_DIMMS_NS                  : 0.05
   BOARD_DDR4_SKEW_BETWEEN_DQS_NS                    : 0.02
   BOARD_DDR4_AC_TO_CK_SKEW_NS                       : 0.0
   BOARD_DDR4_MAX_CK_DELAY_NS                        : 0.6
   BOARD_DDR4_MAX_DQS_DELAY_NS                       : 0.6
   BOARD_DDR4_TIS_DERATING_PS                        : 0
   BOARD_DDR4_TIH_DERATING_PS                        : 0
   BOARD_DDR4_CK_SLEW_RATE                           : 4.0
   BOARD_DDR4_AC_SLEW_RATE                           : 2.0
   BOARD_DDR4_RCLK_SLEW_RATE                         : 8.0
   BOARD_DDR4_WCLK_SLEW_RATE                         : 4.0
   BOARD_DDR4_RDATA_SLEW_RATE                        : 4.0
   BOARD_DDR4_WDATA_SLEW_RATE                        : 2.0
   BOARD_DDR4_AC_ISI_NS                              : 0.15
   BOARD_DDR4_RCLK_ISI_NS                            : 0.15
   BOARD_DDR4_WCLK_ISI_NS                            : 0.038
   BOARD_DDR4_RDATA_ISI_NS                           : 0.075
   BOARD_DDR4_WDATA_ISI_NS                           : 0.09
   BOARD_DDR4_SKEW_WITHIN_DQS_NS                     : 0.02
   BOARD_DDR4_SKEW_WITHIN_AC_NS                      : 0.18
   CTRL_ECC_EN                                       : true
   CTRL_MMR_EN                                       : false
   CTRL_AUTO_PRECHARGE_EN                            : false
   CTRL_USER_PRIORITY_EN                             : false
   CTRL_REORDER_EN                                   : true
   CTRL_ECC_READDATAERROR_EN                         : false
   CTRL_ECC_STATUS_EN                                : false
   CTRL_DDR4_AVL_PROTOCOL_ENUM                       : CTRL_AVL_PROTOCOL_ST
   CTRL_DDR4_SELF_REFRESH_EN                         : false
   CTRL_DDR4_AUTO_POWER_DOWN_EN                      : false
   CTRL_DDR4_AUTO_POWER_DOWN_CYCS                    : 32
   CTRL_DDR4_USER_REFRESH_EN                         : false
   CTRL_DDR4_USER_PRIORITY_EN                        : false
   CTRL_DDR4_AUTO_PRECHARGE_EN                       : false
   CTRL_DDR4_ADDR_ORDER_ENUM                         : DDR4_CTRL_ADDR_ORDER_CS_R_B_C_BG
   CTRL_DDR4_ECC_EN                                  : true
   CTRL_DDR4_ECC_AUTO_CORRECTION_EN                  : true
   CTRL_DDR4_ECC_READDATAERROR_EN                    : false
   CTRL_DDR4_ECC_STATUS_EN                           : false
   CTRL_DDR4_REORDER_EN                              : true
   CTRL_DDR4_STARVE_LIMIT                            : 10
   CTRL_DDR4_MMR_EN                                  : false
   CTRL_DDR4_MAJOR_MODE_EN                           : false
   CTRL_DDR4_POST_REFRESH_EN                         : false
   CTRL_DDR4_POST_REFRESH_LOWER_LIMIT                : 0
   CTRL_DDR4_POST_REFRESH_UPPER_LIMIT                : 2
   CTRL_DDR4_PRE_REFRESH_EN                          : false
   CTRL_DDR4_PRE_REFRESH_UPPER_LIMIT                 : 1
   CTRL_DDR4_RD_TO_WR_SAME_CHIP_DELTA_CYCS           : 0
   CTRL_DDR4_WR_TO_RD_SAME_CHIP_DELTA_CYCS           : 0
   CTRL_DDR4_RD_TO_RD_DIFF_CHIP_DELTA_CYCS           : 0
   CTRL_DDR4_RD_TO_WR_DIFF_CHIP_DELTA_CYCS           : 0
   CTRL_DDR4_WR_TO_WR_DIFF_CHIP_DELTA_CYCS           : 0
   CTRL_DDR4_WR_TO_RD_DIFF_CHIP_DELTA_CYCS           : 0
   DIAG_SIM_REGTEST_MODE                             : false
   DIAG_TIMING_REGTEST_MODE                          : false
   DIAG_SYNTH_FOR_SIM                                : false
   DIAG_FAST_SIM_OVERRIDE                            : FAST_SIM_OVERRIDE_DEFAULT
   DIAG_SEQ_RESET_AUTO_RELEASE                       : avl
   DIAG_DB_RESET_AUTO_RELEASE                        : avl_release
   DIAG_ADD_READY_PIPELINE                           : true
   DIAG_EXPOSE_EARLY_READY                           : false
   DIAG_EXPOSE_RD_TYPE                               : false
   DIAG_VERBOSE_IOAUX                                : false
   DIAG_ECLIPSE_DEBUG                                : false
   DIAG_EXPORT_VJI                                   : false
   DIAG_ENABLE_JTAG_UART                             : false
   DIAG_ENABLE_JTAG_UART_HEX                         : false
   DIAG_ENABLE_HPS_EMIF_DEBUG                        : false
   DIAG_SOFT_NIOS_MODE                               : SOFT_NIOS_MODE_DISABLED
   DIAG_SOFT_NIOS_CLOCK_FREQUENCY                    : 100
   DIAG_USE_RS232_UART                               : false
   DIAG_RS232_UART_BAUDRATE                          : 57600
   DIAG_EX_DESIGN_ADD_TEST_EMIFS                     : 
   DIAG_EX_DESIGN_SEPARATE_RESETS                    : false
   DIAG_EXPOSE_DFT_SIGNALS                           : false
   DIAG_EXTRA_CONFIGS                                : 
   DIAG_USE_BOARD_DELAY_MODEL                        : false
   DIAG_BOARD_DELAY_CONFIG_STR                       : 
   DIAG_TG_AVL_2_NUM_CFG_INTERFACES                  : 0
   DIAG_EXPORT_PLL_REF_CLK_OUT                       : false
   DIAG_EXPORT_PLL_LOCKED                            : false
   DIAG_HMC_HRC                                      : OFF
   SHORT_QSYS_INTERFACE_NAMES                        : true
   DIAG_EXT_DOCS                                     : false
   DIAG_SIM_CAL_MODE_ENUM                            : SIM_CAL_MODE_SKIP
   DIAG_EXPORT_SEQ_AVALON_SLAVE                      : CAL_DEBUG_EXPORT_MODE_DISABLED
   DIAG_EXPORT_SEQ_AVALON_MASTER                     : false
   DIAG_EXPORT_SEQ_AVALON_HEAD_OF_CHAIN              : true
   DIAG_EX_DESIGN_NUM_OF_SLAVES                      : 1
   DIAG_EX_DESIGN_ISSP_EN                            : false
   DIAG_INTERFACE_ID                                 : 0
   DIAG_EFFICIENCY_MONITOR                           : EFFMON_MODE_DISABLED
   DIAG_USE_NEW_EFFMON_S10                           : false
   DIAG_USE_ABSTRACT_PHY                             : false
   DIAG_SIM_MEMORY_PRELOAD                           : false
   DIAG_SIM_MEMORY_PRELOAD_PRI_EMIF_FILE             : 
   DIAG_SIM_MEMORY_PRELOAD_PRI_ECC_FILE              : 
   DIAG_SIM_MEMORY_PRELOAD_PRI_MEM_FILE              : 
   DIAG_SIM_MEMORY_PRELOAD_PRI_ABPHY_FILE            : 
   DIAG_SIM_MEMORY_PRELOAD_SEC_EMIF_FILE             : 
   DIAG_SIM_MEMORY_PRELOAD_SEC_ECC_FILE              : 
   DIAG_SIM_MEMORY_PRELOAD_SEC_MEM_FILE              : 
   DIAG_SIM_MEMORY_PRELOAD_SEC_ABPHY_FILE            : 
   DIAG_USE_SIM_MEMORY_VALIDATION_TG                 : false
   DIAG_SIM_VERBOSE_LEVEL                            : 5
   DIAG_FAST_SIM                                     : true
   DIAG_USE_TG_AVL_2                                 : false
   DIAG_TG2_TEST_DURATION                            : SHORT
   DIAG_USE_TG_HBM                                   : false
   DIAG_EXPORT_TG_CFG_AVALON_SLAVE                   : TG_CFG_AMM_EXPORT_MODE_JTAG
   DIAG_ENABLE_DEFAULT_MODE                          : false
   DIAG_ENABLE_USER_MODE                             : true
   DIAG_ENABLE_SOFT_M20K                             : false
   DIAG_SIM_CHECKER_SKIP_TG                          : false
   DIAG_AC_PARITY_ERR                                : false
   DIAG_DISABLE_AFI_P2C_REGISTERS                    : false
   DIAG_EX_DESIGN_SEPARATE_RZQS                      : true
   DIAG_DDR4_SIM_CAL_MODE_ENUM                       : SIM_CAL_MODE_SKIP
   DIAG_DDR4_EXPORT_SEQ_AVALON_SLAVE                 : CAL_DEBUG_EXPORT_MODE_DISABLED
   DIAG_DDR4_EXPORT_SEQ_AVALON_MASTER                : false
   DIAG_DDR4_EXPORT_SEQ_AVALON_HEAD_OF_CHAIN         : true
   DIAG_DDR4_EX_DESIGN_NUM_OF_SLAVES                 : 1
   DIAG_DDR4_EX_DESIGN_ISSP_EN                       : false
   DIAG_DDR4_INTERFACE_ID                            : 0
   DIAG_DDR4_EFFICIENCY_MONITOR                      : EFFMON_MODE_DISABLED
   DIAG_DDR4_USE_NEW_EFFMON_S10                      : false
   DIAG_DDR4_USER_SIM_MEMORY_PRELOAD                 : false
   DIAG_DDR4_USER_SIM_MEMORY_PRELOAD_PRI_EMIF_FILE   : EMIF_PRI_PRELOAD.txt
   DIAG_DDR4_USER_SIM_MEMORY_PRELOAD_SEC_EMIF_FILE   : EMIF_SEC_PRELOAD.txt
   DIAG_DDR4_USER_USE_SIM_MEMORY_VALIDATION_TG       : true
   DIAG_DDR4_USE_TG_AVL_2                            : false
   DIAG_DDR4_USE_TG_HBM                              : false
   DIAG_DDR4_ABSTRACT_PHY                            : false
   DIAG_DDR4_ENABLE_DEFAULT_MODE                     : false
   DIAG_DDR4_ENABLE_USER_MODE                        : true
   DIAG_DDR4_EXPORT_TG_CFG_AVALON_SLAVE              : TG_CFG_AMM_EXPORT_MODE_JTAG
   DIAG_DDR4_TG2_TEST_DURATION                       : SHORT
   DIAG_DDR4_SEPARATE_READ_WRITE_ITFS                : false
   DIAG_DDR4_DISABLE_AFI_P2C_REGISTERS               : false
   DIAG_DDR4_AC_PARITY_ERR                           : false
   DIAG_DDR4_SIM_MEMORY_PRELOAD                      : false
   DIAG_DDR4_SIM_MEMORY_PRELOAD_PRI_EMIF_FILE        : 
   DIAG_DDR4_SIM_MEMORY_PRELOAD_SEC_EMIF_FILE        : 
   DIAG_DDR4_USE_SIM_MEMORY_VALIDATION_TG            : false
   DIAG_DDR4_EX_DESIGN_SEPARATE_RZQS                 : true
   DIAG_DDR4_SIM_VERBOSE                             : true
   DIAG_DDR4_SKIP_CA_LEVEL                           : false
   DIAG_DDR4_SKIP_CA_DESKEW                          : false
   DIAG_DDR4_SKIP_VREF_CAL                           : false
   DIAG_DDR4_SKIP_AC_PARITY_CHECK                    : false
   DIAG_DDR4_CAL_ADDR0                               : 0
   DIAG_DDR4_CAL_ADDR1                               : 8
   DIAG_DDR4_CAL_ENABLE_NON_DES                      : false
   DIAG_DDR4_CAL_FULL_CAL_ON_RESET                   : true
   NUM_IPS                                           : 1
   EMIF_0_CONN_TO_CALIP                              : CALIP_0
   EMIF_0_STORED_PARAM                               : 
   EMIF_0_REF_CLK_SHARING                            : EXPORTED
   EMIF_1_CONN_TO_CALIP                              : CALIP_0
   EMIF_1_STORED_PARAM                               : 
   EMIF_1_REF_CLK_SHARING                            : EXPORTED
   EMIF_2_CONN_TO_CALIP                              : CALIP_0
   EMIF_2_STORED_PARAM                               : 
   EMIF_2_REF_CLK_SHARING                            : EXPORTED
   EMIF_3_CONN_TO_CALIP                              : CALIP_0
   EMIF_3_STORED_PARAM                               : 
   EMIF_3_REF_CLK_SHARING                            : EXPORTED
   EMIF_4_CONN_TO_CALIP                              : CALIP_0
   EMIF_4_STORED_PARAM                               : 
   EMIF_4_REF_CLK_SHARING                            : EXPORTED
   EMIF_5_CONN_TO_CALIP                              : CALIP_0
   EMIF_5_STORED_PARAM                               : 
   EMIF_5_REF_CLK_SHARING                            : EXPORTED
   EMIF_6_CONN_TO_CALIP                              : CALIP_0
   EMIF_6_STORED_PARAM                               : 
   EMIF_6_REF_CLK_SHARING                            : EXPORTED
   EMIF_7_CONN_TO_CALIP                              : CALIP_0
   EMIF_7_STORED_PARAM                               : 
   EMIF_7_REF_CLK_SHARING                            : EXPORTED
   EMIF_8_CONN_TO_CALIP                              : CALIP_0
   EMIF_8_STORED_PARAM                               : 
   EMIF_8_REF_CLK_SHARING                            : EXPORTED
   EMIF_9_CONN_TO_CALIP                              : CALIP_0
   EMIF_9_STORED_PARAM                               : 
   EMIF_9_REF_CLK_SHARING                            : EXPORTED
   EMIF_10_CONN_TO_CALIP                             : CALIP_0
   EMIF_10_STORED_PARAM                              : 
   EMIF_10_REF_CLK_SHARING                           : EXPORTED
   EMIF_11_CONN_TO_CALIP                             : CALIP_0
   EMIF_11_STORED_PARAM                              : 
   EMIF_11_REF_CLK_SHARING                           : EXPORTED
   EMIF_12_CONN_TO_CALIP                             : CALIP_0
   EMIF_12_STORED_PARAM                              : 
   EMIF_12_REF_CLK_SHARING                           : EXPORTED
   EMIF_13_CONN_TO_CALIP                             : CALIP_0
   EMIF_13_STORED_PARAM                              : 
   EMIF_13_REF_CLK_SHARING                           : EXPORTED
   EMIF_14_CONN_TO_CALIP                             : CALIP_0
   EMIF_14_STORED_PARAM                              : 
   EMIF_14_REF_CLK_SHARING                           : EXPORTED
   EMIF_15_CONN_TO_CALIP                             : CALIP_0
   EMIF_15_STORED_PARAM                              : 
   EMIF_15_REF_CLK_SHARING                           : EXPORTED
   EX_DESIGN_GUI_GEN_SIM                             : false
   EX_DESIGN_GUI_GEN_SYNTH                           : false
   EX_DESIGN_GUI_GEN_BSI                             : false
   EX_DESIGN_GUI_GEN_CDC                             : false
   EX_DESIGN_GUI_TARGET_DEV_KIT                      : TARGET_DEV_KIT_NONE
   NUM_IPS_SAVED                                     : 0
   EX_DESIGN_GUI_PREV_PRESET                         : TARGET_DEV_KIT_NONE
   EX_DESIGN_GUI_DDR4_SEL_DESIGN                     : AVAIL_EX_DESIGNS_GEN_DESIGN
   EX_DESIGN_GUI_DDR4_GEN_SIM                        : true
   EX_DESIGN_GUI_DDR4_GEN_SYNTH                      : true
   EX_DESIGN_GUI_DDR4_GEN_BSI                        : false
   EX_DESIGN_GUI_DDR4_GEN_CDC                        : false
   EX_DESIGN_GUI_DDR4_HDL_FORMAT                     : HDL_FORMAT_VERILOG
   EX_DESIGN_GUI_DDR4_TARGET_DEV_KIT                 : TARGET_DEV_KIT_NONE
   EX_DESIGN_GUI_DDR4_PREV_PRESET                    : TARGET_DEV_KIT_NONE


