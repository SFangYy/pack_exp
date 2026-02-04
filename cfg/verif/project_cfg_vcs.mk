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
VCS_COV_TOOLS = verdi

# This file is now structured to support a multi-step compile flow including SWIG.

# 1. VLOGAN options for SV analysis
VLOGAN_OPTS = -q -full64 \
              -sverilog \
              +v2k \
              +incdir+${UVM_HOME}/src \
              +incdir+${UVMC_HOME}/src/connect/sv \
              +incdir+${UVM_HOME}/vcs \
              +incdir+${UVM_HOME}/verdi \
              -timescale=1ns/1ps \
              +define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
              +define+UVM_REGEX_NO_DPI \
              ${COMPILE_MACRO} \
              +define+DEF_SETUP_TIME=1step \
              +define+DEF_HOLD_TIME=1step \
              +define+ROB_UT \
              +define+TCNT_SKIP_REPORT_SERVER \
              -Mdir ${BUILD_DIR} \
              -lca \
              ${UVM_HOME}/src/uvm_pkg.sv \
              ${UVMC_HOME}/src/connect/sv/uvmc_pkg.sv

# 2. SYSCAN options for SC/C++/Python analysis
# This compiles all C++ sources at once. VCS will find the objects in the -Mdir
SYSC_COMP_OPTS = syscan -cpp g++ -cc gcc -full64 \
                -Mdir=${BUILD_DIR} \
                -cflags -g -cflags -DVCS -cflags -I. \
                -tlm2 -cflags -I${VCS_HOME}/include/systemc232/tlm_utils \
                -cflags -I${UVMC_HOME}/src/connect/sc \
                -cflags -DUSE_VCS \
                -cflags "${PYTHON_INCLUDE}" -cflags -I${XSP_COMM_INCLUDE} \
                ${UVMC_HOME}/src/connect/sc/uvmc.cpp \
                ${XSP_COMM_INCLUDE}/xspcomm/tlm_pbsb.cpp \
                ${BUILD_DIR}/tlmps.cpp

# 3. VCS options for Elaboration
VCS_ELAB_OPTS = -sysc=deltasync -lca \
        -full64 -sysc -cpp g++ -cc gcc \
        -timescale=1ns/1ps \
        -P ${VERDI_HOME}/share/PLI/VCS/LINUX64/novas.tab \
        ${VERDI_HOME}/share/PLI/VCS/LINUX64/pli.a \
        -CFLAGS -DVCS ${UVM_DPI_SRC} \
        -debug_access+all \
        -uvm \
        -Mdir ${BUILD_DIR} \
        -o ./${mode}/exec/simv \
        -l ./${mode}/log/vcs_elab.log \
        -e VcsMain sv_main ${VCS_HOME}/linux64/lib/vcs_tls.o -slave \
        -k

# Keep original SIMV_OPTIONS for the run step
SIMV_OPTIONS += +ntb_random_seed=$(seed_tmp)
SIMV_OPTIONS += +UVM_TESTNAME=${tc}
SIMV_OPTIONS += +UVM_VERBOSITY=${pl}
SIMV_OPTIONS += +TEST_MODE=${mode}
SIMV_OPTIONS += ${udr}
SIMV_OPTIONS += +UVM_TIMEOUT=${timeout_ns}

DUMP_WAVE_CFG_FILE = dump_wave_cfg_vcs.tcl
ifeq ($(wave),on)
SIMV_OPTIONS += +wave_type=fsdb
SIMV_OPTIONS += +gen_wave=${timing}
SIMV_OPTIONS += -ucli -i ../cfg/vcs_mk/$(DUMP_WAVE_CFG_FILE)
endif

RUN_CMD = ${EXPORT_OPTS} && ./${mode}/exec/simv ${SIMV_OPTIONS} ${SIMV_LOG}
WAV_CMD = verdi -dbdir ./${mode}/exec/simv.daidir
COV_GUI_CMD = dve -full64 -covdir ${mode}/cov/simv.vdb/vcs_cov/*.vdb &
COV_TXT_CMD = urg -full64 -dir ${mode}/cov/simv.vdb/vcs_cov/*.vdb -metric line+cond+fsm+tgl+group+assert -format text
COV_TXT_SUM_CMD = urg -full64 -dir */cov/simv.vdb/vcs_cov/*.vdb -metric line+cond+fsm+tgl+group -format text