//=========================================================
//File name    : CSR_in_agent_pkg.sv
//Author       : nanyunhao
//Module name  : CSR_in_agent_pkg
//Discribution : CSR_in_agent_pkg : package
//Date         : 2026-01-22
//=========================================================
`ifndef CSR_IN_AGENT_PKG__SV
`define CSR_IN_AGENT_PKG__SV

`ifndef TCNT_HAD_INCLUDE_UVM_MACROS
`define TCNT_HAD_INCLUDE_UVM_MACROS
    `include "uvm_macros.svh"
`endif

`include "CSR_in_agent_dec.sv"
`include "CSR_in_agent_interface.sv"
package CSR_in_agent_pkg;

    import uvm_pkg::*;
    import tcnt_realtime::*;
    import tcnt_dec_base::*;
    import tcnt_common_method::*;
    import tcnt_base_pkg::*;

    import CSR_in_agent_dec::*;

    `include "CSR_in_agent_cfg.sv"
    `include "CSR_in_agent_xaction.sv"
    `include "CSR_in_agent_default_sequence.sv"
    `include "CSR_in_agent_driver.sv"
    `include "CSR_in_agent_monitor.sv"
    `include "CSR_in_agent_sequencer.sv"
    `include "CSR_in_agent.sv"

endpackage

import CSR_in_agent_pkg::*;

`endif

