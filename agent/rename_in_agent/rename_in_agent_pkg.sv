//=========================================================
//File name    : rename_in_agent_pkg.sv
//Author       : nanyunhao
//Module name  : rename_in_agent_pkg
//Discribution : rename_in_agent_pkg : package
//Date         : 2026-01-22
//=========================================================
`ifndef RENAME_IN_AGENT_PKG__SV
`define RENAME_IN_AGENT_PKG__SV

`ifndef TCNT_HAD_INCLUDE_UVM_MACROS
`define TCNT_HAD_INCLUDE_UVM_MACROS
    `include "uvm_macros.svh"
`endif

`include "rename_in_agent_dec.sv"
`include "rename_in_agent_interface.sv"
package rename_in_agent_pkg;

    import uvm_pkg::*;
    import tcnt_realtime::*;
    import tcnt_dec_base::*;
    import tcnt_common_method::*;
    import tcnt_base_pkg::*;

    import rename_in_agent_dec::*;

    `include "rename_in_agent_cfg.sv"
    `include "rename_in_agent_xaction.sv"
    `include "rename_in_agent_default_sequence.sv"
    `include "rename_in_agent_driver.sv"
    `include "rename_in_agent_monitor.sv"
    `include "rename_in_agent_sequencer.sv"
    `include "rename_in_agent.sv"

endpackage

import rename_in_agent_pkg::*;

`endif

