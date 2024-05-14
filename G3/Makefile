Project := G3
Revision := $(Project)_r1
QSYS_FILE := qsys_top.qsys
QSF_FILE := $(Revision).qsf


sof.done : $(QSF_FILE) $(QSYS_FILE)
	quartus_sh -t sof.tcl $(Revision)
	touch sof.done

clean: 
	rm -rf *.done *.qsys_edit DNI qdb tmp_clearbox

sof: sof.done
qsys: qsys.gen.done
rbf:  rbf.done 
deploy: deploy.done 

.PHONY: all clean ultraclean qsys syn stp sof rbf
