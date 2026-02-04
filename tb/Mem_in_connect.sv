//=========================================================
//File name    : Mem_in_connect.sv
//Author       : nanyunhao
//Module name  : Mem_in_connect
//Discribution : Mem_in_connect : Mem_in Interface connection macro
//Date         : 2026-01-22
//=========================================================
`ifndef MEM_IN_CONNECT__SV
`define MEM_IN_CONNECT__SV

`define ROB__MEM_IN_CONNECT(U_IF_NAME,AGENT_PATH,RTL_PATH) \
    Mem_in_agent_interface  U_IF_NAME (clk,tc_if.rst_n); \
    initial begin \
        uvm_config_db#(virtual Mem_in_agent_interface)::set(null,`"*AGENT_PATH*`", "vif", U_IF_NAME); \
    end \
    `ifdef ROB_UT \
    initial begin \
        force RTL_PATH.io_lsq_mmio_0 = U_IF_NAME.io_lsq_mmio_0; \
        force RTL_PATH.io_lsq_mmio_1 = U_IF_NAME.io_lsq_mmio_1; \
        force RTL_PATH.io_lsq_mmio_2 = U_IF_NAME.io_lsq_mmio_2; \
        force RTL_PATH.io_lsq_uop_0_robIdx_value = U_IF_NAME.io_lsq_uop_0_robIdx_value; \
        force RTL_PATH.io_lsq_uop_1_robIdx_value = U_IF_NAME.io_lsq_uop_1_robIdx_value; \
        force RTL_PATH.io_lsq_uop_2_robIdx_value = U_IF_NAME.io_lsq_uop_2_robIdx_value; \
    end \
    `else \
    initial begin \
        force U_IF_NAME.io_lsq_mmio_0 = RTL_PATH.io_lsq_mmio_0; \
        force U_IF_NAME.io_lsq_mmio_1 = RTL_PATH.io_lsq_mmio_1; \
        force U_IF_NAME.io_lsq_mmio_2 = RTL_PATH.io_lsq_mmio_2; \
        force U_IF_NAME.io_lsq_uop_0_robIdx_value = RTL_PATH.io_lsq_uop_0_robIdx_value; \
        force U_IF_NAME.io_lsq_uop_1_robIdx_value = RTL_PATH.io_lsq_uop_1_robIdx_value; \
        force U_IF_NAME.io_lsq_uop_2_robIdx_value = RTL_PATH.io_lsq_uop_2_robIdx_value; \
    end \
    `endif

`endif
