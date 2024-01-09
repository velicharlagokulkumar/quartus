set QSYS_SIMDIR ../
set QUARTUS_INSTALL_DIR $::env(QUARTUS_INSTALL_DIR)
source $QSYS_SIMDIR/mentor/msim_setup.tcl
dev_com
com
elab
exit -code 0

