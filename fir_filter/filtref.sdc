## Generated SDC file "filtref.sdc"

## Copyright (C) 1991-2011 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 11.1 Internal Build 160 09/22/2011 PN Full Version"

## DATE    "Mon Sep 26 14:59:30 2011"

##
## DEVICE  "EP4CGX15BF14C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 4.000 -waveform { 0.000 2.000 } [get_ports {clk}]
create_clock -name {clkx2} -period 4.000 -waveform { 0.000 2.000 } [get_ports {clkx2}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clkx2}]  0.040 
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clkx2}]  0.040 
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clkx2}]  0.040 
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clkx2}]  0.040 
set_clock_uncertainty -rise_from [get_clocks {clkx2}] -rise_to [get_clocks {clkx2}]  0.020 
set_clock_uncertainty -rise_from [get_clocks {clkx2}] -fall_to [get_clocks {clkx2}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clkx2}] -rise_to [get_clocks {clkx2}]  0.020 
set_clock_uncertainty -fall_from [get_clocks {clkx2}] -fall_to [get_clocks {clkx2}]  0.020 


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_clocks {clk clkx2}] -through [get_pins -compatibility_mode *] -to [get_clocks {clk clkx2}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Max Skew
#**************************************************************


