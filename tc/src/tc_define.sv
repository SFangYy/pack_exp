//=========================================================
//File name    : tc_define.sv
//Author       : nanyunhao
//Module name  : tc_define
//Discribution : tc_define : micro define for TC
//Date         : 2026-01-22
//=========================================================
`ifndef TC_DEFINE__SV
`define TC_DEFINE__SV

`define seq_rename_in(tc) ``tc``__seq_rename_in
`define seq_WriteBack_in(tc) ``tc``__seq_WriteBack_in
`define seq_Redirect_in(tc) ``tc``__seq_Redirect_in
`define seq_CSR_in(tc) ``tc``__seq_CSR_in
`define seq_Mem_in(tc) ``tc``__seq_Mem_in
`define seq_Rob_output(tc) ``tc``__seq_Rob_output


`endif

