##=========================================================
##File name    : Makefile
##Author       : Based on uvmpy/Makefile
##Module name  : Makefile for Rob verification with UVM-Python integration
##Description  : Compile Rob verification environment with UVMC support
##Date         : 2026-02-04
##=========================================================

# Path configuration
PYTHON_INCLUDE:=$(firstword $(shell python3-config --includes))
XSP_COMM_INCLUDE:=/home/sfangyy/.local/share/picker/include
XSP_PYTHON:=/home/sfangyy/.local/share/picker/python

# Directory structure
CURR_DIR := $(shell pwd)
BUILD_DIR := ./py_build
SIM_DIR := ./base_fun
TOP_MODULE := sv_main

# Environment validation
ifndef UVMC_HOME
$(error UVMC_HOME is not set)
endif
ifndef VCS_HOME
$(error VCS_HOME is not set)
endif
ifndef UVM_HOME
$(error UVM_HOME is not set)
endif
ifndef XSP_COMM_INCLUDE
$(error XSP_COMM_INCLUDE is not set)
endif
ifndef PYTHON_INCLUDE
$(error PYTHON_INCLUDE is not set)
endif

# Compilation options
VERBOSE=+UVM_VERBOSITY=UVM_MEDIUM
TIMESCALE=1ns/1ps

# SYSCAN options for SystemC/C++/Python components
SYSCAN = syscan -cpp g++ -cc gcc -full64 -cflags -g -cflags -DVCS -cflags -I. \
		-tlm2 -cflags -I${VCS_HOME}/include/systemc232/tlm_utils \
		-cflags -I${UVMC_HOME}/src/connect/sc \
		-cflags -DUSE_VCS -cflags "${PYTHON_INCLUDE}" \
		-cflags -I${XSP_COMM_INCLUDE} \
		${UVMC_HOME}/src/connect/sc/uvmc.cpp \
		${XSP_COMM_INCLUDE}/xspcomm/tlm_pbsb.cpp

# VLOGAN options for SystemVerilog components
VLOGAN = vlogan -q -full64 \
		-sverilog +incdir+${UVM_HOME}/src ${UVM_HOME}/src/uvm_pkg.sv \
		+incdir+${UVMC_HOME}/src/connect/sv ${UVMC_HOME}/src/connect/sv/uvmc_pkg.sv \
		-timescale=${TIMESCALE} \
		+define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
		+define+UVM_REGEX_NO_DPI \
		+define+UVMC_NO_COMMANDS \
		+define+DEF_SETUP_TIME=1step \
		+define+DEF_HOLD_TIME=1step \
		+define+ROB_UT \
		+incdir+${UVM_HOME}/src

# VCS Elaboration options
VCS_ELAB = vcs -sysc=deltasync -lca \
		-full64 -sysc -cpp g++ -cc gcc \
		-timescale=${TIMESCALE} \
		-P ${VERDI_HOME}/share/PLI/VCS/LINUX64/novas.tab \
		${VERDI_HOME}/share/PLI/VCS/LINUX64/pli.a \
		-CFLAGS -DVCS ${UVM_HOME}/src/dpi/uvm_dpi.cc \
		-debug_access+all \
		-uvm \
		-o ${SIM_DIR}/exec/simv \
		-l ${SIM_DIR}/log/vcs_elab.log \
		-e VcsMain ${TOP_MODULE} ${VCS_HOME}/linux64/lib/vcs_tls.o -slave

.PHONY: all clean compile run help

# Default target
all: clean compile

# Clean target
clean:
	@echo "Cleaning build artifacts..."
	rm -rf ${SIM_DIR} work csrc simv* AN.DB ${BUILD_DIR} tlm_pbsb.py
	rm -rf *.log *.log.cmp *.vpd DVE* __pycache__
	@echo "Clean complete."

# Compile target
compile: ${SIM_DIR}/exec/simv

${SIM_DIR}/exec/simv:
	@echo "=== Rob Verification Compilation ==="
	@mkdir -p ${BUILD_DIR}
	@mkdir -p ${SIM_DIR}/exec
	@mkdir -p ${SIM_DIR}/log
	@mkdir -p ${SIM_DIR}/wave

	@echo "--- Step 1: Running SWIG to generate Python wrappers ---"
	swig -D'MODULE_NAME="tlm_pbsb"' -python -c++ -DUSE_VCS -I${XSP_COMM_INCLUDE} \
		-outdir . -o ${BUILD_DIR}/tlmps.cpp \
		${XSP_COMM_INCLUDE}/xspcomm/python_tlm_pbsb.i

	@echo "--- Step 2: Running SYSCAN for SystemC components ---"
	$(SYSCAN) -Mdir=${BUILD_DIR} ${BUILD_DIR}/tlmps.cpp

	@echo "--- Step 3: Running VLOGAN for SystemVerilog ---"
	@mkdir -p work
	$(VLOGAN) \
		+incdir+../tb \
		-F ../cfg/rtl.f \
		../tb/override_macros.sv \
		../tb/tcnt_base_pkg.sv \
		-F ../cfg/tb.f

	@echo "--- Step 4: Running VCS for Elaboration ---"
	$(VCS_ELAB)

	@echo "--- Step 5: Cleaning temporary build artifacts ---"
	@rm -rf ${BUILD_DIR}/sysc
	@echo "✓ Compilation complete!"

# Run target
run: compile
	@echo "Running simulation..."
	@if [ -f ${SIM_DIR}/exec/simv ]; then \
		${SIM_DIR}/exec/simv +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=tc_sanity; \
	else \
		echo "Error: simv not found. Please run 'make compile' first."; \
		exit 1; \
	fi

# Help target
help:
	@echo "Available targets:"
	@echo "  make all      - Clean and compile"
	@echo "  make clean    - Remove all build artifacts"
	@echo "  make compile  - Compile the verification environment"
	@echo "  make run      - Run the simulation"
	@echo "  make help     - Show this help message"

