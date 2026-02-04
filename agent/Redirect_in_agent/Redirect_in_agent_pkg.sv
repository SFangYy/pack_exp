//=========================================================
//File name    : Redirect_in_agent_pkg.sv
//Author       : nanyunhao
//Module name  : Redirect_in_agent_pkg
//Discribution : Redirect_in_agent_pkg : package
//Date         : 2026-01-22
//=========================================================
`ifndef REDIRECT_IN_AGENT_PKG__SV
`define REDIRECT_IN_AGENT_PKG__SV

`ifndef TCNT_HAD_INCLUDE_UVM_MACROS
`define TCNT_HAD_INCLUDE_UVM_MACROS
    `include "uvm_macros.svh"
`endif

`include "Redirect_in_agent_dec.sv"
`include "Redirect_in_agent_interface.sv"
package Redirect_in_agent_pkg;

    import uvm_pkg::*;
    import tcnt_realtime::*;
    import tcnt_dec_base::*;
    import tcnt_common_method::*;
    import tcnt_base_pkg::*;

    import Redirect_in_agent_dec::*;

    `include "Redirect_in_agent_cfg.sv"
    `include "Redirect_in_agent_xaction.sv"
    `include "Redirect_in_agent_default_sequence.sv"
    `include "Redirect_in_agent_driver.sv"
    `include "Redirect_in_agent_monitor.sv"
    `include "Redirect_in_agent_sequencer.sv"
    `include "Redirect_in_agent.sv"

endpackage

import Redirect_in_agent_pkg::*;

`endif

