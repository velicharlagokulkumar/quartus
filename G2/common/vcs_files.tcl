
proc get_memory_files {QSYS_SIMDIR} {
  set memory_files [list]
  return $memory_files
}

proc get_common_design_files {QSYS_SIMDIR} {
  set design_files [dict create]
  return $design_files
}

proc get_design_files {QSYS_SIMDIR} {
  set design_files [dict create]
  dict set design_files "ram1_ram_1port_2010_evrarkq.v" "$QSYS_SIMDIR/ram1/ram_1port_2010/sim/ram1_ram_1port_2010_evrarkq.v"
  dict set design_files "ram1.v"                        "$QSYS_SIMDIR/ram1/sim/ram1.v"                                      
  dict set design_files "fifo_fifo_1920_cgqugzq.v"      "$QSYS_SIMDIR/fifo/fifo_1920/sim/fifo_fifo_1920_cgqugzq.v"          
  dict set design_files "fifo.v"                        "$QSYS_SIMDIR/fifo/sim/fifo.v"                                      
  dict set design_files "rom_rom_1port_2010_5hpb5ia.v"  "$QSYS_SIMDIR/rom/rom_1port_2010/sim/rom_rom_1port_2010_5hpb5ia.v"  
  dict set design_files "rom.v"                         "$QSYS_SIMDIR/rom/sim/rom.v"                                        
  return $design_files
}

proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
  set ELAB_OPTIONS ""
  if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
  } else {
  }
  return $ELAB_OPTIONS
}


proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
  set SIM_OPTIONS ""
  if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
  } else {
  }
  return $SIM_OPTIONS
}


proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
  set ENV_VARIABLES [dict create]
  set LD_LIBRARY_PATH [dict create]
  dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
  if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
  } else {
  }
  return $ENV_VARIABLES
}


