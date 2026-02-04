//=========================================================
//File name    : tc_pkg.sv
//Author       : nanyunhao
//Module name  : tc_pkg
//Discribution : tc_pkg : package
//Date         : 2026-01-22
//=========================================================
`ifndef TC_PKG__SV
`define TC_PKG__SV

`ifndef TCNT_HAD_INCLUDE_UVM_MACROS
`define TCNT_HAD_INCLUDE_UVM_MACROS
    `include "uvm_macros.svh"
`endif

`include "tc_define.sv"
`include "tc_if.sv"
package tc_pkg;

    import uvm_pkg::*;
    import tcnt_realtime::*;
    import tcnt_dec_base::*;
    import tcnt_common_method::*;
    import tcnt_base_pkg::*;
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


    import Rob_dec::*;
    import Rob_common_pkg::*;

    import Rob_env_pkg::*;
    `include "tc_base.sv"
    `include "tc_sanity.sv"

endpackage

import tc_pkg::*;

`endif

