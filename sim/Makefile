##=========================================================
##File name    : Makefile
##Author       : Optimized & Dependency-Aware Version
##Module name  : Makefile for Rob verification
##Description  : Streamlined UVM-Python integration with incremental build
##=========================================================

# Path configuration
PYTHON_INCLUDE  := $(firstword $(shell python3-config --includes))
XSP_COMM_INCLUDE := /home/sfangyy/.local/share/picker/include
XSP_PYTHON       := /home/sfangyy/.local/share/picker/python

# Directory structure
CURR_DIR   := $(shell pwd)
OUT_DIR    := ./base_fun
BUILD_DIR  := $(OUT_DIR)/build
PKG_DIR    := $(OUT_DIR)/PyRob
LOG_DIR    := $(OUT_DIR)/log
EXEC_DIR   := $(OUT_DIR)/exec
WAVE_DIR   := $(OUT_DIR)/wave
TOP_MODULE := sv_main

# Target Files
LIB_SO     := $(PKG_DIR)/_tlm_pbsb.so

# Environment validation
REQUIRED_VARS = UVMC_HOME VCS_HOME UVM_HOME VERDI_HOME
$(foreach var,$(REQUIRED_VARS),$(if $(value $(var)),,$(error $(var) is not set)))

# Tools & Options
TIMESCALE := 1ns/1ps

SYSCAN = syscan -cpp g++ -cc gcc -full64 -cflags -g -tlm2 \
         -cflags -I${VCS_HOME}/include/systemc232/tlm_utils \
         -cflags -I${UVMC_HOME}/src/connect/sc -cflags -DVCS -cflags -DUSE_VCS \
         -cflags "${PYTHON_INCLUDE}" -cflags -I${XSP_COMM_INCLUDE} \
         ${UVMC_HOME}/src/connect/sc/uvmc.cpp \
         ${XSP_COMM_INCLUDE}/xspcomm/tlm_pbsb.cpp

VLOGAN = vlogan -q -full64 -sverilog +incdir+${UVM_HOME}/src ${UVM_HOME}/src/uvm_pkg.sv \
         +incdir+${UVMC_HOME}/src/connect/sv ${UVMC_HOME}/src/connect/sv/uvmc_pkg.sv \
         -timescale=${TIMESCALE} +define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
         +define+UVM_REGEX_NO_DPI +define+UVMC_NO_COMMANDS +define+DEF_SETUP_TIME=1step \
         +define+DEF_HOLD_TIME=1step +define+ROB_UT +incdir+${UVM_HOME}/src

VCS_ELAB = vcs -sysc=deltasync -lca -full64 -sysc -cpp g++ -cc gcc -timescale=${TIMESCALE} \
           -P ${VERDI_HOME}/share/PLI/VCS/LINUX64/novas.tab ${VERDI_HOME}/share/PLI/VCS/LINUX64/pli.a \
           -CFLAGS -DVCS ${UVM_HOME}/src/dpi/uvm_dpi.cc -uvm \
           -o $(LIB_SO) -l $(LOG_DIR)/vcs_elab.log \
           -e VcsMain ${TOP_MODULE} ${VCS_HOME}/linux64/lib/vcs_tls.o -slave -Mdir=${BUILD_DIR}

# Helper for running Python
PYTHON_EXEC = cd $(OUT_DIR) && LD_PRELOAD=$(CURR_DIR)/$(LIB_SO) python3 -u

.PHONY: all clean compile run test help

all: compile

# Directories management
DIRS := $(BUILD_DIR) $(PKG_DIR) $(LOG_DIR) $(EXEC_DIR) $(WAVE_DIR)
$(DIRS):
	@mkdir -p $@

# Incremental Compilation:
# The .so file depends on the file lists and the SWIG interface
$(LIB_SO): ../cfg/rtl.f ../cfg/tb.f ${XSP_COMM_INCLUDE}/xspcomm/python_tlm_pbsb.i | $(DIRS)
	@echo "--- Step 1: Running SWIG ---"
	@swig -D'MODULE_NAME="tlm_pbsb"' -python -c++ -DUSE_VCS -I${XSP_COMM_INCLUDE} \
		-outdir $(PKG_DIR) -o ${BUILD_DIR}/tlmps.cpp \
		${XSP_COMM_INCLUDE}/xspcomm/python_tlm_pbsb.i
	@echo "--- Step 2: Running SYSCAN ---"
	@$(SYSCAN) -Mdir=${BUILD_DIR} ${BUILD_DIR}/tlmps.cpp
	@echo "--- Step 3: Running VLOGAN ---"
	@mkdir -p work
	@$(VLOGAN) +incdir+../tb -F ../cfg/rtl.f ../tb/override_macros.sv ../tb/tcnt_base_pkg.sv -F ../cfg/tb.f
	@echo "--- Step 4: Running VCS Elaboration ---"
	@$(VCS_ELAB)
	@echo "✓ Compilation complete!"

compile: $(LIB_SO)

# Execution targets
run: compile
	@echo ">>> Running Python example (example.py)..."
	@$(PYTHON_EXEC) example.py

test: compile
	@echo ">>> Running optimization verification (verify_opt.py)..."
	@$(PYTHON_EXEC) verify_opt.py

clean:
	@echo "Cleaning build artifacts..."
	@rm -rf ${BUILD_DIR} ${EXEC_DIR} ${LOG_DIR} ${WAVE_DIR} work csrc simv* AN.DB
	@rm -rf ${OUT_DIR}/vc_hdrs.h ${PKG_DIR}/ucli.key ${PKG_DIR}/tlm_pbsb.py ${PKG_DIR}/_tlm_pbsb.so*
	@rm -rf *.log *.log.cmp *.vpd DVE* __pycache__ .vlogan*
	@echo "✓ Clean complete."

help:
	@echo "Available targets:"
	@echo "  make all     - Build everything"
	@echo "  make run     - Run Python example (example.py)"
	@echo "  make test    - Run dirty-check optimization test"
	@echo "  make clean   - Remove all generated files"
	@echo "  make help    - Show this message"