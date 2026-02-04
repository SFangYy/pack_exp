//=========================================================
//File name    : Rob_output_agent_cfg.sv
//Author       : nanyunhao
//Module name  : Rob_output_agent_cfg
//Discribution : Rob_output_agent_cfg : agent configuration
//Date         : 2026-01-22
//=========================================================
`ifndef ROB_OUTPUT_AGENT_CFG__SV
`define ROB_OUTPUT_AGENT_CFG__SV

class Rob_output_agent_cfg extends tcnt_agent_cfg_base;

    `uvm_object_utils_begin(Rob_output_agent_cfg)
    `uvm_object_utils_end

    extern function new(string name="Rob_output_agent_cfg");
    extern function void pre_randomize();
    extern function void post_randomize();

endclass:Rob_output_agent_cfg

function Rob_output_agent_cfg::new(string  name = "Rob_output_agent_cfg");
    super.new(name);
endfunction:new

function void Rob_output_agent_cfg::pre_randomize();
    super.pre_randomize();
endfunction:pre_randomize

function void Rob_output_agent_cfg::post_randomize();
    super.post_randomize();
endfunction:post_randomize

`endif

