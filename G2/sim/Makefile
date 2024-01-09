SHELL := /bin/bash

TB_NAME	:= dcfifo_tb

WAVE_FILE = $(TB_NAME).do # waveform
F_FILE = $(TB_NAME).f # file list

# files
F_FILE_STRING := $(strip $(shell cat ${F_FILE}))
# read the file list into a variable
SRCS := $(filter %.sv %.v, $(F_FILE_STRING))


export CORES := $(shell nproc)
export CORES_TO_USE := $(shell echo "$(CORES)/8" | bc)

IP_FILES := $(wildcard ../*.ip)

LOG_FILE_NAME := simLog
TC := 0
# To log all the signals into the waveform but this slows down the simulation
#ARGS := -do "log -r /*"

all: ultra_clean sim

clear:
	clear

setup.done: 
	@if [ ! -d "log" ]; then \
	echo "INFO: Directory does not exists......" ; \
	mkdir log ; \
	fi 

	@if [ ! -d "log/sim" ]; then \
	echo "INFO: Directory does not exists......" ; \
	mkdir log/sim ; \
	fi 

	@if [ ! -d "libraries" ];then\
		echo "INFO: creating libraries dir";\
		mkdir libraries;\
		vlib libraries;\
	fi
	
	@if [ ! -d "libraries/work/" ];then\
		echo "INFO: creating work dir";\
		vlib libraries/work/;\
		vmap work ./libraries/work/;\
	fi
	touch $@

tb.done: setup.done ../$(TB_NAME).v
	vlog -work libraries/work/ ../$(TB_NAME).v -logfile ./log/$(TB_NAME).log 	
	touch $@	

$(TB_NAME): $(TB_NAME).build.done $(TB_NAME).sim.done 
	touch $(TB_NAME).done

$(TB_NAME).build.done: $(SRCS) tb.done intel.done
	vlog -incr -work libraries/work/ -f $(F_FILE) -l make.log	
	touch $@

intel.done: setup.done $(IP_FILES)
	vsim -c -do "sim_top.do" -voptargs="+acc=npr" -l ./log/intel.log
	touch $@

# -c for batch mode, -do $(WAVE_FILE) for wave
#  -voptargs="+acc=npr"
# Suppressing the warnings, remove -suppress 3015,3016,2685,2718,2121,13314 if you want to check the warnings
$(TB_NAME).sim.done: $(TB_NAME).build.done  
	vsim  $(ARGS) -do "run -a ; exit" -voptargs="+acc=npr" -l ./log/$(LOG_FILE_NAME).log -t fs $(TB_NAME) -L work -L work_lib -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L tennm_ver -L tennm_hssi_ver -L tennm_hssi_e0_ver -L tennm_hssi_p0_ver -L ram_1port_2010 -L ram1 -L fifo_1920 -L fifo -L rom_1port_2010 -L rom rom.rom
	touch $@

view_wave:
	vsim -view $(TB_NAME).wlf -do "wave.do"



clean: clear
	rm -rf log; \
	rm -f transcript; \
	rm -f *.wlf
	rm -f *.done

clean_sim_done:
	rm -f *.build.done
	rm -f tb.done

ultra_clean: clear
	rm -f wlf*; \
	rm -f transcript; \
	rm -rf libraries log ; \
	rm -f *.mif *.stm *.hex modelsim.ini transcript *mem *.ver *.txt *.wlf; \
	rm -f *.log
	rm -f *.done
	rm -rf vunit_out


.PHONY: intel build sim tb u 

# alias
intel: intel.done 
build: $(TB_NAME).build.done
sim: $(TB_NAME).sim.done
u: ultra_clean
c: clean_sim_done
