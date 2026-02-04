//=========================================================
//File name    : Rob_connect.sv
//Author       : nanyunhao
//Module name  : Rob_connect
//Discribution : Rob_connect : Rob connection macro
//Date         : 2026-01-22
//=========================================================
`ifndef ROB_CONNECT__SV
`define ROB_CONNECT__SV

`include "../../../ut/Rob/tb/rename_in_connect.sv"
`include "../../../ut/Rob/tb/WriteBack_in_connect.sv"
`include "../../../ut/Rob/tb/Redirect_in_connect.sv"
`include "../../../ut/Rob/tb/CSR_in_connect.sv"
`include "../../../ut/Rob/tb/Mem_in_connect.sv"
`include "../../../ut/Rob/tb/Rob_output_connect.sv"

`define ROB_CONNECT(ENV_PATH,RTL_PATH) \
    `ROB__RENAME_IN_CONNECT(u_Rob__rename_in_if, ENV_PATH.u_rename_in_agent, RTL_PATH) \
    `ROB__WRITEBACK_IN_CONNECT(u_Rob__WriteBack_in_if, ENV_PATH.u_WriteBack_in_agent, RTL_PATH) \
    `ROB__REDIRECT_IN_CONNECT(u_Rob__Redirect_in_if, ENV_PATH.u_Redirect_in_agent, RTL_PATH) \
    `ROB__CSR_IN_CONNECT(u_Rob__CSR_in_if, ENV_PATH.u_CSR_in_agent, RTL_PATH) \
    `ROB__MEM_IN_CONNECT(u_Rob__Mem_in_if, ENV_PATH.u_Mem_in_agent, RTL_PATH) \
    `ROB__ROB_OUTPUT_CONNECT(u_Rob__Rob_output_if, ENV_PATH.u_Rob_output_agent, RTL_PATH) 

`endif
