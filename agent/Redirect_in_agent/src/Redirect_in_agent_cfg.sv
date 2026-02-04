//=========================================================
//File name    : Redirect_in_agent_cfg.sv
//Author       : nanyunhao
//Module name  : Redirect_in_agent_cfg
//Discribution : Redirect_in_agent_cfg : agent configuration
//Date         : 2026-01-22
//=========================================================
`ifndef REDIRECT_IN_AGENT_CFG__SV
`define REDIRECT_IN_AGENT_CFG__SV

class Redirect_in_agent_cfg extends tcnt_agent_cfg_base;

    `uvm_object_utils_begin(Redirect_in_agent_cfg)
    `uvm_object_utils_end

    extern function new(string name="Redirect_in_agent_cfg");
    extern function void pre_randomize();
    extern function void post_randomize();

endclass:Redirect_in_agent_cfg

function Redirect_in_agent_cfg::new(string  name = "Redirect_in_agent_cfg");
    super.new(name);
endfunction:new

function void Redirect_in_agent_cfg::pre_randomize();
    super.pre_randomize();
endfunction:pre_randomize

function void Redirect_in_agent_cfg::post_randomize();
    super.post_randomize();
endfunction:post_randomize

`endif

