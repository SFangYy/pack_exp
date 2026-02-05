//=========================================================
import CSR_in_agent_python_pkg::*;
//File name    : tc_python.sv
//Author       : Python-UVM Integration
//Module name  : tc_python
//Description  : Test case for Python-UVM integration
//              - Inherits from tc_base
//              - Configures Python Agent with custom driver/monitor
//Date         : 2026-02-05
//=========================================================
`ifndef TC_PYTHON__SV
`define TC_PYTHON__SV

`define TC_NAME tc_python

class `TC_NAME extends tcnt_test_base;

    virtual tc_if vif;
    Rob_env  env;

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
    
    // Disable XZ check in traditional CSR_in_agent monitor to avoid X-state errors
    // during Python-driven simulation
    uvm_config_db#(bit)::set(this, "env.u_CSR_in_agent.cfg", "xz_sw", 0);
    
    this.env  =  Rob_env::type_id::create("env", this);

    // Configure traditional agents with default sequences
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_rename_in_agent.sqr.main_phase"  , "default_sequence", rename_in_agent_default_sequence::type_id::get());
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_WriteBack_in_agent.sqr.main_phase"  , "default_sequence", WriteBack_in_agent_default_sequence::type_id::get());
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_Redirect_in_agent.sqr.main_phase"  , "default_sequence", Redirect_in_agent_default_sequence::type_id::get());
    // Note: CSR_in_agent default sequence is disabled for Python integration
    // uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_CSR_in_agent.sqr.main_phase"  , "default_sequence", CSR_in_agent_default_sequence::type_id::get());
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_Mem_in_agent.sqr.main_phase"  , "default_sequence", Mem_in_agent_default_sequence::type_id::get());
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_Rob_output_agent.sqr.main_phase"  , "default_sequence", Rob_output_agent_default_sequence::type_id::get());

    // ================================================================
    // Python-UVM Integration: Configure Python Agent
    // ================================================================
    // Override default driver with Python-compatible driver
    set_type_override_by_type(
        CSR_in_agent_xaction_xdriver::get_type(), 
        CSR_in_agent_python_driver::get_type()
    );
    
    // Override default monitor with Python-compatible monitor
    set_type_override_by_type(
        CSR_in_agent_xaction_xmonitor::get_type(), 
        CSR_in_agent_python_monitor::get_type()
    );
    
    `uvm_info("TC_PYTHON", "Python Agent factory overrides configured", UVM_LOW)
endfunction

function void `TC_NAME::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction

function void `TC_NAME::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TC_PYTHON", "Test case elaboration complete", UVM_LOW)
endfunction

task `TC_NAME::main_phase(uvm_phase phase);
    super.main_phase(phase);
    
    phase.raise_objection(this);
    `uvm_info("TC_PYTHON", "Python-UVM test started, waiting for Python to drive transactions...", UVM_LOW)
    
    // Keep simulation alive for Python to control
    // Python will control simulation time via Step() calls
    #100000000; // Long wait time for Python-driven simulation
    
    phase.drop_objection(this);
endtask

`undef TC_NAME

`endif