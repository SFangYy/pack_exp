//=========================================================
//File name    : WriteBack_in_agent.sv
//Author       : nanyunhao
//Module name  : WriteBack_in_agent
//Discribution : WriteBack_in_agent : agent top
//Date         : 2026-01-22
//=========================================================
`ifndef WRITEBACK_IN_AGENT__SV
`define WRITEBACK_IN_AGENT__SV

class WriteBack_in_agent  extends tcnt_agent_base#(
                                        .VIF_BUS(virtual WriteBack_in_agent_interface),
                                        .cfg_t(WriteBack_in_agent_cfg),
                                        .seq_t(WriteBack_in_agent_xaction),
                                        .sqr_t(WriteBack_in_agent_sequencer),
                                        .drv_t(WriteBack_in_agent_driver),
                                        .mon_t(WriteBack_in_agent_monitor));

    `uvm_component_utils(WriteBack_in_agent)
    extern function new(string name, uvm_component parent);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);

endclass:WriteBack_in_agent

function WriteBack_in_agent::new(string name,uvm_component parent);
    super.new(name,parent);
endfunction:new

function void WriteBack_in_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction:build_phase

function void WriteBack_in_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction:connect_phase

`endif

