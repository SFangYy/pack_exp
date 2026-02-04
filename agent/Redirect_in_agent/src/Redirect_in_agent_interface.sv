//=========================================================
//File name    : Redirect_in_agent_interface.sv
//Author       : nanyunhao
//Module name  : Redirect_in_agent_interface
//Discribution : Redirect_in_agent_interface : signal interface
//Date         : 2026-01-22
//=========================================================
`ifndef REDIRECT_IN_AGENT_INTERFACE__SV
`define REDIRECT_IN_AGENT_INTERFACE__SV

`ifndef DEF_SETUP_TIME
    `define DEF_SETUP_TIME 1
`endif
`ifndef DEF_HOLD_TIME
    `define DEF_HOLD_TIME 1
`endif

interface Redirect_in_agent_interface  (input bit clk,input bit rst_n);

    logic         io_redirect_valid    ;
    logic         io_redirect_bits_robIdx_flag;
    logic [7:0]   io_redirect_bits_robIdx_value;
    logic         io_redirect_bits_level;

    clocking drv_cb @(posedge clk);
        `ifdef INTERFACE_ADD_DELAY
            default input #`DEF_SETUP_TIME output #`DEF_HOLD_TIME;
        `endif
        output io_redirect_valid;
        output io_redirect_bits_robIdx_flag;
        output io_redirect_bits_robIdx_value;
        output io_redirect_bits_level;

    endclocking:drv_cb

    clocking mon_cb @(posedge clk);
        `ifdef INTERFACE_ADD_DELAY
            default input #`DEF_SETUP_TIME output #`DEF_HOLD_TIME;
        `endif
        input  io_redirect_valid;
        input  io_redirect_bits_robIdx_flag;
        input  io_redirect_bits_robIdx_value;
        input  io_redirect_bits_level;

    endclocking:mon_cb

    modport drv_mp (clocking drv_cb);
    modport mon_mp (clocking mon_cb);

endinterface:Redirect_in_agent_interface

`endif

