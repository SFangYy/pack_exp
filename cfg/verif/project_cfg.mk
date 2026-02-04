##=========================================================
##File name    : cfg.mk
##Author       : Heterogeneous Computing Group
##Module name  : Makefile
##Discribution : makefile script
##             : rtl --> compile dut
##             : compile --> compile all verilog/sverilog
##             : batch_run --> run simulation
##             : run --> compile and batch_run
##             : clean --> remove all file in sim and link makefile again
##Date         : 2021-03-24
##=========================================================

#-------------------------------------------------------------------------------------#
#USER OPTIONS>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#-------------------------------------------------------------------------------------#
seed     := 666666
tc       := tc_sanity
pl       := UVM_MEDIUM
mode     := base_fun
wave     := on
timing   := rtl
ccov     := off
fcov     := off
udr      :=
udf      :=
note     :=
timeout_ns := 100000000
simv_by_tc := off
xprop := off
partcmp_op := on
initreg := off
regr_ini := regress
time_mem_chk := off
gui_on := off


ifeq ($(seed),rand)
seed_tmp = $$$$
else
seed_tmp = ${seed}
endif

#-----------------------------------------#
#top tb name                              #
#-----------------------------------------#
SIM_TOOLS = vcs
TOP_NAME = top_tb

TIMESCALE = 1ns/1ps

#-----------------------------------------#
#FILELIST PATH                            #
#-----------------------------------------#
RTL_LIST_F = ../cfg/rtl.f
TB_LIST_F  = ../cfg/tb.f
UVMC_PKG_SV = ${UVMC_HOME}/src/connect/sv/uvmc_pkg.sv


#-----------------------------------------#
#plat OPTIONS                             #
#-----------------------------------------#
SHELL           = /bin/bash
BITS            = 64
UVM_VER         = uvm-1.2
UVM_HOME        = $(VCS_HOME)/etc/uvm-1.2
UVM_DPI_SRC     = ${UVM_HOME}/src/dpi/uvm_dpi.cc

#-----------------------------------------#
#LOG                                      #
#-----------------------------------------#
EXPORT_OPTS =
ifneq ($(note),)
SIMV_LOG = -l ./${mode}/log/${tc}_$(strip $(seed_tmp))_${timing}_${note}.log
EXPORT_OPTS += export WAVE_FILE=./${mode}/wave/${tc}_$(strip $(seed_tmp))_${timing}_${note}
else
SIMV_LOG = -l ./${mode}/log/${tc}_$(strip $(seed_tmp))_${timing}.log
EXPORT_OPTS += export WAVE_FILE=./mode/wave/${tc}_$(strip $(seed_tmp))_${timing}
endif

COMPILE_MACRO += +define+TCNT_USE_UVM12

# Define paths that were in the parent makefile
# Paths for UVM-Python integration, based on user's provided Makefile
UVMC_HOME ?= /home/sfangyy/EDAHome/uvmc
VERDI_HOME ?= /home/sfangyy/EDAHome/verdi
XSP_COMM_INCLUDE := /home/sfangyy/.local/share/picker/include
PYTHON_INCLUDE := $(firstword $(shell python3-config --includes))

CURR_DIR = $(shell pwd)
SCR_PATH = $(CURR_DIR)/../cfg/verif

# Create a build directory for python integration artifacts
BUILD_DIR = ./py_build

# UVMC integration macros
COMPILE_MACRO += +define+UVMC_NO_COMMANDS

include ${SCR_PATH}/project_cfg_$(SIM_TOOLS).mk
include ../cfg/extern_declare_cfg.mk

# common command
# compile & simulation
run: compile batch_run

# New SWIG step
swig:
	@echo "--- Running SWIG to generate Python wrappers ---"
	@mkdir -p ${BUILD_DIR}
	swig -D'MODULE_NAME="tlm_pbsb"' -python -c++ -DUSE_VCS -I${XSP_COMM_INCLUDE} \
		-outdir . -o ${BUILD_DIR}/tlmps.cpp \
		${XSP_COMM_INCLUDE}/xspcomm/python_tlm_pbsb.i

# Target for compiling SystemC code
sysc_comp: swig
	@echo "--- Running SYSCAN for SystemC components ---"
	@mkdir -p work
	$(SYSC_COMP_OPTS)

# Main compile target implementing the full flow
compile: test_dir sysc_comp
	@echo "--- Running VLOGAN for SystemVerilog ---"
	@mkdir -p work
	vlogan ${VLOGAN_OPTS} \
		${UVM_HOME}/src/uvm_pkg.sv \
		${UVMC_HOME}/src/connect/sv/uvmc_pkg.sv \
		-f ${RTL_LIST_F} \
		../tb/tcnt_base_pkg.sv \
		-f ${TB_LIST_F} \
		+incdir+../tb/src \
		+incdir+../tb
	@echo "--- Running VCS for Elaboration ---"
	vcs ${VCS_ELAB_OPTS} sv_main ${VCS_HOME}/linux64/lib/vcs_tls.o -slave


batch_run:test_dir
	${RUN_CMD}

rtl:test_dir
	vlogan ${VLOGAN_OPTS} -f ${RTL_LIST_F}

clean :
	rm -rf ${mode} work csrc simv* AN.DB ${BUILD_DIR} tlm_pbsb.py

test_dir :
	@mkdir -p ${mode}
	@mkdir -p ${mode}/log
	@mkdir -p ${mode}/exec
	@mkdir -p ${mode}/wave
	@mkdir -p ${mode}/cov

# wave
wave :test_dir
	${WAV_CMD}

# ... (rest of the file is the same)
include ../cfg/extern_cfg.mk
