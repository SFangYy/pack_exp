//=========================================================
//File name    : Redirect_in_agent_sequencer.sv
//Author       : nanyunhao
//Module name  : Redirect_in_agent_sequencer
//Discribution : Redirect_in_agent_sequencer : sequencer
//Date         : 2026-01-22
//=========================================================
`ifndef REDIRECT_IN_AGENT_SEQUENCER__SV
`define REDIRECT_IN_AGENT_SEQUENCER__SV

class Redirect_in_agent_sequencer  extends tcnt_sequencer_base #(Redirect_in_agent_xaction);
    `uvm_component_utils(Redirect_in_agent_sequencer)
    extern function new(string name, uvm_component parent);
    extern task main_phase(uvm_phase phase);
endclass:Redirect_in_agent_sequencer

function Redirect_in_agent_sequencer::new(string name, uvm_component parent);
    super.new(name, parent);
endfunction:new

task Redirect_in_agent_sequencer::main_phase(uvm_phase phase);
    super.main_phase(phase);
    phase.raise_objection(this);
    if(!(uvm_config_db#(uvm_object_wrapper)::exists(this, "main_phase", "default_sequence", 0))) begin
        tcnt_default_sequence_base#(seq_item_t) seq;
        `uvm_warning(get_type_name(),"had no get the default_sequence, please check!!")
        seq = tcnt_default_sequence_base#(seq_item_t)::type_id::create("seq");
        seq.starting_phase = phase;
        seq.start(this);
    end
    phase.drop_objection(this);
endtask:main_phase

`endif

