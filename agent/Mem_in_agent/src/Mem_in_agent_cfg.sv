//=========================================================
//File name    : Mem_in_agent_cfg.sv
//Author       : nanyunhao
//Module name  : Mem_in_agent_cfg
//Discribution : Mem_in_agent_cfg : agent configuration
//Date         : 2026-01-22
//=========================================================
`ifndef MEM_IN_AGENT_CFG__SV
`define MEM_IN_AGENT_CFG__SV

class Mem_in_agent_cfg extends tcnt_agent_cfg_base;

    `uvm_object_utils_begin(Mem_in_agent_cfg)
    `uvm_object_utils_end

    extern function new(string name="Mem_in_agent_cfg");
    extern function void pre_randomize();
    extern function void post_randomize();

endclass:Mem_in_agent_cfg

function Mem_in_agent_cfg::new(string  name = "Mem_in_agent_cfg");
    super.new(name);
endfunction:new

function void Mem_in_agent_cfg::pre_randomize();
    super.pre_randomize();
endfunction:pre_randomize

function void Mem_in_agent_cfg::post_randomize();
    super.post_randomize();
endfunction:post_randomize

`endif

