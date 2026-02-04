//=========================================================
//File name    : Rob_output_agent.sv
//Author       : nanyunhao
//Module name  : Rob_output_agent
//Discribution : Rob_output_agent : agent top
//Date         : 2026-01-22
//=========================================================
`ifndef ROB_OUTPUT_AGENT__SV
`define ROB_OUTPUT_AGENT__SV

class Rob_output_agent  extends tcnt_agent_base#(
                                        .VIF_BUS(virtual Rob_output_agent_interface),
                                        .cfg_t(Rob_output_agent_cfg),
                                        .seq_t(Rob_output_agent_xaction),
                                        .sqr_t(Rob_output_agent_sequencer),
                                        .drv_t(Rob_output_agent_driver),
                                        .mon_t(Rob_output_agent_monitor));

    `uvm_component_utils(Rob_output_agent)
    extern function new(string name, uvm_component parent);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);

endclass:Rob_output_agent

function Rob_output_agent::new(string name,uvm_component parent);
    super.new(name,parent);
endfunction:new

function void Rob_output_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction:build_phase

function void Rob_output_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction:connect_phase

`endif

