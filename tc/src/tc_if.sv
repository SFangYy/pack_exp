//=========================================================
//File name    : tc_if.sv
//Author       : nanyunhao
//Module name  : tc_if
//Discribution : tc_if : virtual interface for tc/rm, use to force or probe
//Date         : 2026-01-22
//=========================================================
`ifndef TC_IF__SV
`define TC_IF__SV


interface tc_if(input clk);
    logic rst_n;
    //logic force_xxx;
    //logic probe_xxx;
endinterface

`endif

