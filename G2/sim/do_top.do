
 set QSYS_SIMDIR ../
 #
 # Source the generated IP simulation script.
 source $QSYS_SIMDIR/mentor/msim_setup.tcl
 
 # Call command to compile the Quartus EDA simulation library.
 dev_com
 #
 # Call command to compile the Quartus-generated IP simulation files.
 com
 #
 vlog -incr -work libraries/work/ -f do_top.f -l make.log
 #
 # Set the top-level simulation or testbench module/entity name, which is
 # used by the elab command to elaborate the top level.
 #
 set TOP_LEVEL_NAME "top_testbench"
 #
 # Call command to elaborate your design and testbench.
 elab
 #
 # Run the simulation.
 run -a
 #
 # Report success to the shell.
 exit -code 0
 #