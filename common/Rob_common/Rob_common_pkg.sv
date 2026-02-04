//=========================================================
//File name    : Rob_common_pkg.sv
//Author       : nanyunhao
//Module name  : Rob_common_pkg
//Discribution : Rob_common_pkg : package
//Date         : 2026-01-22
//=========================================================
`ifndef ROB_COMMON_PKG__SV
`define ROB_COMMON_PKG__SV

`ifndef TCNT_HAD_INCLUDE_UVM_MACROS
`define TCNT_HAD_INCLUDE_UVM_MACROS
    `include "uvm_macros.svh"
`endif

`include "Rob_dec.sv"
package Rob_common_pkg;

    import uvm_pkg::*;
    import tcnt_realtime::*;
    import tcnt_dec_base::*;
    import tcnt_common_method::*;
    import tcnt_base_pkg::*;

    import Rob_dec::*;

    import rename_in_agent_dec::*;
    import rename_in_agent_pkg::*;
    import WriteBack_in_agent_dec::*;
    import WriteBack_in_agent_pkg::*;
    import Redirect_in_agent_dec::*;
    import Redirect_in_agent_pkg::*;
    import CSR_in_agent_dec::*;
    import CSR_in_agent_pkg::*;
    import Mem_in_agent_dec::*;
    import Mem_in_agent_pkg::*;
    import Rob_output_agent_dec::*;
    import Rob_output_agent_pkg::*;

    `include "Rob_common_xaction.sv"
    `include "Rob_fcov.sv"

endpackage

import Rob_common_pkg::*;

`endif

