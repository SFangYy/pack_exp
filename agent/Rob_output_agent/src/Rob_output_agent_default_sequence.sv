//=========================================================
//File name    : Rob_output_agent_default_sequence.sv
//Author       : nanyunhao
//Module name  : Rob_output_agent_default_sequence
//Discribution : Rob_output_agent_default_sequence : default sequence
//Date         : 2026-01-22
//=========================================================
`ifndef ROB_OUTPUT_AGENT_DEFAULT_SEQUENCE__SV
`define ROB_OUTPUT_AGENT_DEFAULT_SEQUENCE__SV

class Rob_output_agent_default_sequence  extends tcnt_default_sequence_base #(Rob_output_agent_xaction);

    `uvm_object_utils(Rob_output_agent_default_sequence)

    extern function new(string name="Rob_output_agent_default_sequence");
    extern virtual task pre_body();
    extern virtual task body();
    extern virtual task post_body();

endclass:Rob_output_agent_default_sequence

function  Rob_output_agent_default_sequence::new(string name= "Rob_output_agent_default_sequence");
    super.new(name);
endfunction:new

task Rob_output_agent_default_sequence::pre_body();
    if(starting_phase != null)
        starting_phase.raise_objection(this);
endtask:pre_body

task Rob_output_agent_default_sequence::body();
    repeat (10) begin
        `uvm_do(req)
    end
endtask:body

task Rob_output_agent_default_sequence::post_body();
    if(starting_phase != null)
        starting_phase.drop_objection(this);
endtask:post_body

`endif

