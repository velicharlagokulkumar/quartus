# TCL File Generated by Component Editor 22.4
# Thu Jan 25 18:49:48 IST 2024
# DO NOT MODIFY


# 
# prbs_generator "prbs_generator" v1.0
#  2024.01.25.18:49:48
# 
# 

# 
# request TCL package from ACDS 22.4
# 
package require -exact qsys 22.4


# 
# module prbs_generator
# 
set_module_property DESCRIPTION ""
set_module_property NAME prbs_generator
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME prbs_generator
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false
set_module_property LOAD_ELABORATION_LIMIT 0
set_module_property OUT_OF_CONTEXT_SYNTHESIS_ENABLED false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL prbs_pattern_generator
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file prbs_pattern_generator.v VERILOG PATH prbs_pattern_generator.v TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter DATA_WIDTH INTEGER 32
set_parameter_property DATA_WIDTH DEFAULT_VALUE 32
set_parameter_property DATA_WIDTH DISPLAY_NAME DATA_WIDTH
set_parameter_property DATA_WIDTH UNITS None
set_parameter_property DATA_WIDTH AFFECTS_GENERATION false
set_parameter_property DATA_WIDTH HDL_PARAMETER true
set_parameter_property DATA_WIDTH EXPORT true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""
set_interface_property clock IPXACT_REGISTER_MAP_VARIABLES ""
set_interface_property clock SV_INTERFACE_TYPE ""
set_interface_property clock SV_INTERFACE_MODPORT_TYPE ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""
set_interface_property reset IPXACT_REGISTER_MAP_VARIABLES ""
set_interface_property reset SV_INTERFACE_TYPE ""
set_interface_property reset SV_INTERFACE_MODPORT_TYPE ""

add_interface_port reset reset reset Input 1


# 
# connection point csr
# 
add_interface csr avalon end
set_interface_property csr addressGroup 0
set_interface_property csr addressUnits WORDS
set_interface_property csr associatedClock clock
set_interface_property csr associatedReset reset
set_interface_property csr bitsPerSymbol 8
set_interface_property csr bridgedAddressOffset ""
set_interface_property csr bridgesToMaster ""
set_interface_property csr burstOnBurstBoundariesOnly false
set_interface_property csr burstcountUnits WORDS
set_interface_property csr explicitAddressSpan 0
set_interface_property csr holdTime 0
set_interface_property csr linewrapBursts false
set_interface_property csr maximumPendingReadTransactions 0
set_interface_property csr maximumPendingWriteTransactions 0
set_interface_property csr minimumResponseLatency 1
set_interface_property csr readLatency 0
set_interface_property csr readWaitTime 1
set_interface_property csr setupTime 0
set_interface_property csr timingUnits Cycles
set_interface_property csr transparentBridge false
set_interface_property csr waitrequestAllowance 0
set_interface_property csr writeWaitTime 0
set_interface_property csr ENABLED true
set_interface_property csr EXPORT_OF ""
set_interface_property csr PORT_NAME_MAP ""
set_interface_property csr CMSIS_SVD_VARIABLES ""
set_interface_property csr SVD_ADDRESS_GROUP ""
set_interface_property csr IPXACT_REGISTER_MAP_VARIABLES ""
set_interface_property csr SV_INTERFACE_TYPE ""
set_interface_property csr SV_INTERFACE_MODPORT_TYPE ""

add_interface_port csr csr_address address Input 3
add_interface_port csr csr_writedata writedata Input 32
add_interface_port csr csr_write write Input 1
add_interface_port csr csr_readdata readdata Output 32
add_interface_port csr csr_read read Input 1
add_interface_port csr csr_byteenable byteenable Input 4
set_interface_assignment csr embeddedsw.configuration.isFlash 0
set_interface_assignment csr embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment csr embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment csr embeddedsw.configuration.isPrintableDevice 0


# 
# connection point src_master
# 
add_interface src_master axi4stream start
set_interface_property src_master associatedClock clock
set_interface_property src_master associatedReset reset
set_interface_property src_master ENABLED true
set_interface_property src_master EXPORT_OF ""
set_interface_property src_master PORT_NAME_MAP ""
set_interface_property src_master CMSIS_SVD_VARIABLES ""
set_interface_property src_master SVD_ADDRESS_GROUP ""
set_interface_property src_master IPXACT_REGISTER_MAP_VARIABLES ""
set_interface_property src_master SV_INTERFACE_TYPE ""
set_interface_property src_master SV_INTERFACE_MODPORT_TYPE ""

add_interface_port src_master src_data tdata Output "((DATA_WIDTH - 1)) - (0) + 1"
add_interface_port src_master src_valid tvalid Output 1
add_interface_port src_master src_ready tready Input 1

