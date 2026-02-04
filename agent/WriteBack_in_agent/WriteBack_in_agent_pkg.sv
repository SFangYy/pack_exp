//=========================================================
//File name    : WriteBack_in_agent_pkg.sv
//Author       : nanyunhao
//Module name  : WriteBack_in_agent_pkg
//Discribution : WriteBack_in_agent_pkg : package
//Date         : 2026-01-22
//=========================================================
`ifndef WRITEBACK_IN_AGENT_PKG__SV
`define WRITEBACK_IN_AGENT_PKG__SV

`ifndef TCNT_HAD_INCLUDE_UVM_MACROS
`define TCNT_HAD_INCLUDE_UVM_MACROS
    `include "uvm_macros.svh"
`endif

`include "WriteBack_in_agent_dec.sv"
`include "WriteBack_in_agent_interface.sv"
package WriteBack_in_agent_pkg;

    import uvm_pkg::*;
    import tcnt_realtime::*;
    import tcnt_dec_base::*;
    import tcnt_common_method::*;
    import tcnt_base_pkg::*;

    import WriteBack_in_agent_dec::*;

    `include "WriteBack_in_agent_cfg.sv"
    `include "WriteBack_in_agent_xaction.sv"
    `include "WriteBack_in_agent_default_sequence.sv"
    `include "WriteBack_in_agent_driver.sv"
    `include "WriteBack_in_agent_monitor.sv"
    `include "WriteBack_in_agent_sequencer.sv"
    `include "WriteBack_in_agent.sv"

endpackage

import WriteBack_in_agent_pkg::*;

`endif

