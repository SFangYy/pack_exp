//=========================================================
//File name    : Redirect_in_agent_default_sequence.sv
//Author       : nanyunhao
//Module name  : Redirect_in_agent_default_sequence
//Discribution : Redirect_in_agent_default_sequence : default sequence
//Date         : 2026-01-22
//=========================================================
`ifndef REDIRECT_IN_AGENT_DEFAULT_SEQUENCE__SV
`define REDIRECT_IN_AGENT_DEFAULT_SEQUENCE__SV

class Redirect_in_agent_default_sequence  extends tcnt_default_sequence_base #(Redirect_in_agent_xaction);

    `uvm_object_utils(Redirect_in_agent_default_sequence)

    extern function new(string name="Redirect_in_agent_default_sequence");
    extern virtual task pre_body();
    extern virtual task body();
    extern virtual task post_body();

endclass:Redirect_in_agent_default_sequence

function  Redirect_in_agent_default_sequence::new(string name= "Redirect_in_agent_default_sequence");
    super.new(name);
endfunction:new

task Redirect_in_agent_default_sequence::pre_body();
    if(starting_phase != null)
        starting_phase.raise_objection(this);
endtask:pre_body

task Redirect_in_agent_default_sequence::body();
    repeat (10) begin
        `uvm_do(req)
    end
endtask:body

task Redirect_in_agent_default_sequence::post_body();
    if(starting_phase != null)
        starting_phase.drop_objection(this);
endtask:post_body

`endif

