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

# Directory structure - all outputs go to base_fun/
CURR_DIR := $(shell pwd)
TOP_DIR := $(CURR_DIR)/..
PKG_DIR := $(OUT_DIR)/PyRob
OUT_DIR := ./base_fun
BUILD_DIR := $(OUT_DIR)/build
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
		-uvm \
		-o $(OUT_DIR)/PyRob/_tlm_pbsb.so \
		-l $(OUT_DIR)/log/vcs_elab.log \
		-e VcsMain ${TOP_MODULE} ${VCS_HOME}/linux64/lib/vcs_tls.o -slave \
		-Mdir=${BUILD_DIR}

.PHONY: all clean compile run help

# Default target - clean, compile and prepare for Python-UVM simulation
all: clean compile copy_xspcomm
	@echo ""
	@echo "========================================="
	@echo "  Build Complete!"
	@echo "========================================="
	@echo "To run Python-UVM simulation:"
	@echo "  make run_python"
	@echo ""
	@echo "To run traditional UVM simulation:"
	@echo "  make run"
	@echo "========================================="

# Clean target - remove only build artifacts, keep source files
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf ${BUILD_DIR}
	@rm -rf ${OUT_DIR}/exec
	@rm -rf ${OUT_DIR}/log
	@rm -rf ${OUT_DIR}/wave
	@rm -rf ${OUT_DIR}/vc_hdrs.h
	@rm -rf ${OUT_DIR}/PyRob/tlm_pbsb.py
	@rm -rf ${OUT_DIR}/PyRob/_tlm_pbsb.so*
	@rm -rf work csrc simv* AN.DB
	@rm -rf *.log *.log.cmp *.vpd DVE* __pycache__
	@rm -rf ${CURR_DIR}/.vlogan*
	@echo "✓ Clean complete."

# Compile target
compile: $(OUT_DIR)/PyRob/_tlm_pbsb.so

$(OUT_DIR)/PyRob/_tlm_pbsb.so:
	@echo "=== Rob Verification Compilation ==="
	@mkdir -p ${BUILD_DIR}
	@mkdir -p ${OUT_DIR}/PyRob
	@mkdir -p ${OUT_DIR}/exec
	@mkdir -p ${OUT_DIR}/log
	@mkdir -p ${OUT_DIR}/wave

	@echo "--- Step 1: Running SWIG to generate Python wrappers ---"
	swig -D'MODULE_NAME="tlm_pbsb"' -python -c++ -DUSE_VCS -I${XSP_COMM_INCLUDE} \
		-outdir $(OUT_DIR)/PyRob -o ${BUILD_DIR}/tlmps.cpp \
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

# Run target (traditional UVM simulation)
run: compile
	@echo "Running simulation..."
	@if [ -f ${OUT_DIR}/exec/simv ]; then \
		${OUT_DIR}/exec/simv +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=tc_sanity; \
	else \
		echo "Error: simv not found. Please run 'make compile' first."; \
		exit 1; \
	fi

# Copy xspcomm library to Python package directory
copy_xspcomm: compile
	@echo "Copying xspcomm library..."
	@mkdir -p $(PKG_DIR)
	@cp -rf $(XSP_PYTHON)/xspcomm $(PKG_DIR)/
	@echo "Done!"

# Run Python example
run_python: compile copy_xspcomm
	@echo "Running Python example..."
	@cd $(OUT_DIR) && LD_PRELOAD=$(PWD)/$(OUT_DIR)/PyRob/_tlm_pbsb.so python3 -u example.py

# Help target
help:
	@echo "Available targets:"
	@echo "  make all          - Clean and compile"
	@echo "  make clean        - Remove all build artifacts"
	@echo "  make compile      - Compile the verification environment"
	@echo "  make run          - Run the traditional UVM simulation"
	@echo "  make copy_xspcomm - Copy xspcomm library to output directory"
	@echo "  make run_python   - Run the Python-UVM example"
	@echo "  make help         - Show this help message"
