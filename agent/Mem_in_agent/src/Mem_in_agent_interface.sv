//=========================================================
//File name    : Mem_in_agent_interface.sv
//Author       : nanyunhao
//Module name  : Mem_in_agent_interface
//Discribution : Mem_in_agent_interface : signal interface
//Date         : 2026-01-22
//=========================================================
`ifndef MEM_IN_AGENT_INTERFACE__SV
`define MEM_IN_AGENT_INTERFACE__SV

`ifndef DEF_SETUP_TIME
    `define DEF_SETUP_TIME 1
`endif
`ifndef DEF_HOLD_TIME
    `define DEF_HOLD_TIME 1
`endif

interface Mem_in_agent_interface  (input bit clk,input bit rst_n);

    logic         io_lsq_mmio_0        ;
    logic         io_lsq_mmio_1        ;
    logic         io_lsq_mmio_2        ;
    logic [7:0]   io_lsq_uop_0_robIdx_value;
    logic [7:0]   io_lsq_uop_1_robIdx_value;
    logic [7:0]   io_lsq_uop_2_robIdx_value;

    clocking drv_cb @(posedge clk);
        `ifdef INTERFACE_ADD_DELAY
            default input #`DEF_SETUP_TIME output #`DEF_HOLD_TIME;
        `endif
        output io_lsq_mmio_0;
        output io_lsq_mmio_1;
        output io_lsq_mmio_2;
        output io_lsq_uop_0_robIdx_value;
        output io_lsq_uop_1_robIdx_value;
        output io_lsq_uop_2_robIdx_value;

    endclocking:drv_cb

    clocking mon_cb @(posedge clk);
        `ifdef INTERFACE_ADD_DELAY
            default input #`DEF_SETUP_TIME output #`DEF_HOLD_TIME;
        `endif
        input  io_lsq_mmio_0;
        input  io_lsq_mmio_1;
        input  io_lsq_mmio_2;
        input  io_lsq_uop_0_robIdx_value;
        input  io_lsq_uop_1_robIdx_value;
        input  io_lsq_uop_2_robIdx_value;

    endclocking:mon_cb

    modport drv_mp (clocking drv_cb);
    modport mon_mp (clocking mon_cb);

endinterface:Mem_in_agent_interface

`endif

