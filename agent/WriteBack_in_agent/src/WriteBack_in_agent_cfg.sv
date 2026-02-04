//=========================================================
//File name    : WriteBack_in_agent_cfg.sv
//Author       : nanyunhao
//Module name  : WriteBack_in_agent_cfg
//Discribution : WriteBack_in_agent_cfg : agent configuration
//Date         : 2026-01-22
//=========================================================
`ifndef WRITEBACK_IN_AGENT_CFG__SV
`define WRITEBACK_IN_AGENT_CFG__SV

class WriteBack_in_agent_cfg extends tcnt_agent_cfg_base;

    `uvm_object_utils_begin(WriteBack_in_agent_cfg)
    `uvm_object_utils_end

    extern function new(string name="WriteBack_in_agent_cfg");
    extern function void pre_randomize();
    extern function void post_randomize();

endclass:WriteBack_in_agent_cfg

function WriteBack_in_agent_cfg::new(string  name = "WriteBack_in_agent_cfg");
    super.new(name);
endfunction:new

function void WriteBack_in_agent_cfg::pre_randomize();
    super.pre_randomize();
endfunction:pre_randomize

function void WriteBack_in_agent_cfg::post_randomize();
    super.post_randomize();
endfunction:post_randomize

`endif

