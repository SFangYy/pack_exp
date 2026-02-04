//=========================================================
//File name    : Redirect_in_agent.sv
//Author       : nanyunhao
//Module name  : Redirect_in_agent
//Discribution : Redirect_in_agent : agent top
//Date         : 2026-01-22
//=========================================================
`ifndef REDIRECT_IN_AGENT__SV
`define REDIRECT_IN_AGENT__SV

class Redirect_in_agent  extends tcnt_agent_base#(
                                        .VIF_BUS(virtual Redirect_in_agent_interface),
                                        .cfg_t(Redirect_in_agent_cfg),
                                        .seq_t(Redirect_in_agent_xaction),
                                        .sqr_t(Redirect_in_agent_sequencer),
                                        .drv_t(Redirect_in_agent_driver),
                                        .mon_t(Redirect_in_agent_monitor));

    `uvm_component_utils(Redirect_in_agent)
    extern function new(string name, uvm_component parent);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);

endclass:Redirect_in_agent

function Redirect_in_agent::new(string name,uvm_component parent);
    super.new(name,parent);
endfunction:new

function void Redirect_in_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction:build_phase

function void Redirect_in_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction:connect_phase

`endif

