//=========================================================
//File name    : rename_in_agent.sv
//Author       : nanyunhao
//Module name  : rename_in_agent
//Discribution : rename_in_agent : agent top
//Date         : 2026-01-22
//=========================================================
`ifndef RENAME_IN_AGENT__SV
`define RENAME_IN_AGENT__SV

class rename_in_agent  extends tcnt_agent_base#(
                                        .VIF_BUS(virtual rename_in_agent_interface),
                                        .cfg_t(rename_in_agent_cfg),
                                        .seq_t(rename_in_agent_xaction),
                                        .sqr_t(rename_in_agent_sequencer),
                                        .drv_t(rename_in_agent_driver),
                                        .mon_t(rename_in_agent_monitor));

    `uvm_component_utils(rename_in_agent)
    extern function new(string name, uvm_component parent);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);

endclass:rename_in_agent

function rename_in_agent::new(string name,uvm_component parent);
    super.new(name,parent);
endfunction:new

function void rename_in_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction:build_phase

function void rename_in_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction:connect_phase

`endif

