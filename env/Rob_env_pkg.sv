//=========================================================
//File name    : Rob_env_pkg.sv
//Author       : nanyunhao
//Module name  : Rob_env_pkg
//Discribution : Rob_env_pkg : package
//Date         : 2026-01-22
//=========================================================
`ifndef ROB_ENV_PKG__SV
`define ROB_ENV_PKG__SV

`ifndef TCNT_HAD_INCLUDE_UVM_MACROS
`define TCNT_HAD_INCLUDE_UVM_MACROS
    `include "uvm_macros.svh"
`endif

package Rob_env_pkg;

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

    `include "Rob_env_cfg.sv"
    `include "Rob_rm.sv"
    `include "Rob_env.sv"

endpackage

import Rob_env_pkg::*;

`endif

