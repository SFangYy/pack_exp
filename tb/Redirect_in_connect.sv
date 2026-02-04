//=========================================================
//File name    : Redirect_in_connect.sv
//Author       : nanyunhao
//Module name  : Redirect_in_connect
//Discribution : Redirect_in_connect : Redirect_in Interface connection macro
//Date         : 2026-01-22
//=========================================================
`ifndef REDIRECT_IN_CONNECT__SV
`define REDIRECT_IN_CONNECT__SV

`define ROB__REDIRECT_IN_CONNECT(U_IF_NAME,AGENT_PATH,RTL_PATH) \
    Redirect_in_agent_interface  U_IF_NAME (clk,tc_if.rst_n); \
    initial begin \
        uvm_config_db#(virtual Redirect_in_agent_interface)::set(null,`"*AGENT_PATH*`", "vif", U_IF_NAME); \
    end \
    `ifdef ROB_UT \
    initial begin \
        force RTL_PATH.io_redirect_valid = U_IF_NAME.io_redirect_valid; \
        force RTL_PATH.io_redirect_bits_robIdx_flag = U_IF_NAME.io_redirect_bits_robIdx_flag; \
        force RTL_PATH.io_redirect_bits_robIdx_value = U_IF_NAME.io_redirect_bits_robIdx_value; \
        force RTL_PATH.io_redirect_bits_level = U_IF_NAME.io_redirect_bits_level; \
    end \
    `else \
    initial begin \
        force U_IF_NAME.io_redirect_valid = RTL_PATH.io_redirect_valid; \
        force U_IF_NAME.io_redirect_bits_robIdx_flag = RTL_PATH.io_redirect_bits_robIdx_flag; \
        force U_IF_NAME.io_redirect_bits_robIdx_value = RTL_PATH.io_redirect_bits_robIdx_value; \
        force U_IF_NAME.io_redirect_bits_level = RTL_PATH.io_redirect_bits_level; \
    end \
    `endif

`endif
