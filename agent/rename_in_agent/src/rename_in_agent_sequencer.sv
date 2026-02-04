//=========================================================
//File name    : rename_in_agent_sequencer.sv
//Author       : nanyunhao
//Module name  : rename_in_agent_sequencer
//Discribution : rename_in_agent_sequencer : sequencer
//Date         : 2026-01-22
//=========================================================
`ifndef RENAME_IN_AGENT_SEQUENCER__SV
`define RENAME_IN_AGENT_SEQUENCER__SV

class rename_in_agent_sequencer  extends tcnt_sequencer_base #(rename_in_agent_xaction);
    `uvm_component_utils(rename_in_agent_sequencer)
    extern function new(string name, uvm_component parent);
    extern task main_phase(uvm_phase phase);
endclass:rename_in_agent_sequencer

function rename_in_agent_sequencer::new(string name, uvm_component parent);
    super.new(name, parent);
endfunction:new

task rename_in_agent_sequencer::main_phase(uvm_phase phase);
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

