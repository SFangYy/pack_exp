//=========================================================
//File name    : rename_in_agent_cfg.sv
//Author       : nanyunhao
//Module name  : rename_in_agent_cfg
//Discribution : rename_in_agent_cfg : agent configuration
//Date         : 2026-01-22
//=========================================================
`ifndef RENAME_IN_AGENT_CFG__SV
`define RENAME_IN_AGENT_CFG__SV

class rename_in_agent_cfg extends tcnt_agent_cfg_base;

    `uvm_object_utils_begin(rename_in_agent_cfg)
    `uvm_object_utils_end

    extern function new(string name="rename_in_agent_cfg");
    extern function void pre_randomize();
    extern function void post_randomize();

endclass:rename_in_agent_cfg

function rename_in_agent_cfg::new(string  name = "rename_in_agent_cfg");
    super.new(name);
endfunction:new

function void rename_in_agent_cfg::pre_randomize();
    super.pre_randomize();
endfunction:pre_randomize

function void rename_in_agent_cfg::post_randomize();
    super.post_randomize();
endfunction:post_randomize

`endif

