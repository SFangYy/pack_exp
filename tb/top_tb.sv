//=========================================================
//File name    : top_tb.sv
//Author       : nanyunhao
//Module name  : top_tb
//Discribution : top_tb : testbench top
//Date         : 2026-01-22
//=========================================================
`ifndef TOP_TB__SV
`define TOP_TB__SV

`timescale 1ns/1ps

`ifndef TCNT_HAD_INCLUDE_UVM_MACROS
`define TCNT_HAD_INCLUDE_UVM_MACROS
    `include "uvm_macros.svh"
`endif

`ifndef TCNT_HAD_IMPORT_UVM_PKG
`define TCNT_HAD_IMPORT_UVM_PKG
    import uvm_pkg::*;
`endif

`include "../../../common/tcnt_base/src/tcnt_clk_gen.sv"

module top_tb;

    import tcnt_realtime::*;
    import tcnt_dec_base::*;
    import tc_pkg::*;

    reg clk;

    `CLK_GEN(clk,200)
    `RST_GEN(tc_if.rst_n,100)

    `include "../tb/dut_inst.sv"
    `include "../tb/tc_if_connect.sv"
    `include "../../../ut/Rob/tb/Rob_connect.sv"
    `ROB_CONNECT(env,top_tb.U_Rob)
    
    // Python-UVM Integration: Connect interface for Python agent
    initial begin
        uvm_config_db#(virtual Mem_in_agent_interface)::set(null, "*env.u_Mem_python_agent*", "vif", u_Rob__Mem_in_if);
        uvm_config_db#(virtual rename_in_agent_interface)::set(null, "*env.u_rename_python_agent*", "vif", u_Rob__rename_in_if);
        uvm_config_db#(virtual WriteBack_in_agent_interface)::set(null, "*env.u_WriteBack_python_agent*", "vif", u_Rob__WriteBack_in_if);
    end

    initial begin
       $display("===== TOP_TB: Starting run_test =====");
       run_test("tc_python");
       $display("===== TOP_TB: run_test returned =====");
    end

    //`include "../tb/gen_wave.sv"
    `include "../tb/read_sdf.sv"

endmodule
`endif