//=========================================================
//File name    : Mem_in_agent_pkg.sv
//Author       : nanyunhao
//Module name  : Mem_in_agent_pkg
//Discribution : Mem_in_agent_pkg : package
//Date         : 2026-01-22
//=========================================================
`ifndef MEM_IN_AGENT_PKG__SV
`define MEM_IN_AGENT_PKG__SV

`ifndef TCNT_HAD_INCLUDE_UVM_MACROS
`define TCNT_HAD_INCLUDE_UVM_MACROS
    `include "uvm_macros.svh"
`endif

`include "Mem_in_agent_dec.sv"
`include "Mem_in_agent_interface.sv"
package Mem_in_agent_pkg;

    import uvm_pkg::*;
    import tcnt_realtime::*;
    import tcnt_dec_base::*;
    import tcnt_common_method::*;
    import tcnt_base_pkg::*;

    import Mem_in_agent_dec::*;

    `include "Mem_in_agent_cfg.sv"
    `include "Mem_in_agent_xaction.sv"
    `include "Mem_in_agent_default_sequence.sv"
    `include "Mem_in_agent_driver.sv"
    `include "Mem_in_agent_monitor.sv"
    `include "Mem_in_agent_sequencer.sv"
    `include "Mem_in_agent.sv"

endpackage

import Mem_in_agent_pkg::*;

`endif

