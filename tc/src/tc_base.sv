//=========================================================
//File name    : tc_base.sv
//Author       : nanyunhao
//Module name  : tc_base
//Discribution : tc_base : TC basic
//Date         : 2026-01-22
//=========================================================
`ifndef TC_BASE__SV
`define TC_BASE__SV

`define TC_NAME tc_base

class `TC_NAME extends tcnt_test_base;

    virtual tc_if vif;
    Rob_env  env;

 	///aa_test_reg_model   reg_model;
 	///aa_test_reg_adapter reg_adapter;

    function new(string name = "`TC_NAME", uvm_component parent = null);
        super.new(name,parent);
    endfunction
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    extern virtual function void end_of_elaboration_phase(uvm_phase phase);
    extern virtual task main_phase(uvm_phase phase);
    `uvm_component_utils(`TC_NAME)
endclass

function void `TC_NAME::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual tc_if)::get(this, "", "vif", vif)) begin
        `uvm_fatal(get_type_name(),$sformatf("virtual interface must be set for vif(tc_if)!!!"))
    end
    this.env  =  Rob_env::type_id::create("env", this);

 	///reg_model = aa_test_reg_model::type_id::create("reg_model",this);
 	///reg_model.configure(null, "");
 	///reg_model.build();
 	///reg_model.lock_model();
 	///reg_model.reset();
    ///reg_model.set_hdl_path_root("top_tb.dut");
 	///env.reg_model = this.reg_model;
 	///reg_adapter = new("reg_adapter");

    //factory default_sequence
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_rename_in_agent.sqr.main_phase"  , "default_sequence", rename_in_agent_default_sequence::type_id::get());
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_WriteBack_in_agent.sqr.main_phase"  , "default_sequence", WriteBack_in_agent_default_sequence::type_id::get());
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_Redirect_in_agent.sqr.main_phase"  , "default_sequence", Redirect_in_agent_default_sequence::type_id::get());
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_CSR_in_agent.sqr.main_phase"  , "default_sequence", CSR_in_agent_default_sequence::type_id::get());
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_Mem_in_agent.sqr.main_phase"  , "default_sequence", Mem_in_agent_default_sequence::type_id::get());
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_Rob_output_agent.sqr.main_phase"  , "default_sequence", Rob_output_agent_default_sequence::type_id::get());

endfunction
function void `TC_NAME::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    ///reg_model.default_map.set_sequencer(env.xxx_agt.sqr, reg_adapter);
    ///reg_model.default_map.set_auto_predict(1);
endfunction

function void `TC_NAME::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
endfunction

task `TC_NAME::main_phase(uvm_phase phase);
    super.main_phase(phase);
    //@(posedge vif.clk);
    //@(posedge vif.rst_n);
    //vif.rst_n = xx;
endtask

`undef TC_NAME

`endif

