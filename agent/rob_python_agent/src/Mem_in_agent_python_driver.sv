`ifndef MEM_IN_AGENT_PYTHON_DRIVER__SV
`define MEM_IN_AGENT_PYTHON_DRIVER__SV

class Mem_in_agent_python_driver extends Mem_in_agent_xaction_xdriver;
    `uvm_component_utils(Mem_in_agent_python_driver)
    
    virtual Mem_in_agent_interface vif;
    int transaction_count = 0;
    
    function new(string name = "Mem_in_agent_python_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual Mem_in_agent_interface)::get(this, "", "vif", vif))
            `uvm_fatal("MEM_IN_PYTHON_DRV", "Virtual interface not found")
    endfunction
    
    virtual task sequence_receive(Mem_in_agent_xaction tr);
        transaction_count++;
        `uvm_info("MEM_IN_PYTHON_DRV", $sformatf("[%0d] Received transaction from Python", transaction_count), UVM_LOW)
        
        // Drive DUT signals
        vif.io_lsq_mmio_0 <= tr.io_lsq_mmio_0;
        vif.io_lsq_mmio_1 <= tr.io_lsq_mmio_1;
        vif.io_lsq_mmio_2 <= tr.io_lsq_mmio_2;
        vif.io_lsq_uop_0_robIdx_value <= tr.io_lsq_uop_0_robIdx_value;
        vif.io_lsq_uop_1_robIdx_value <= tr.io_lsq_uop_1_robIdx_value;
        vif.io_lsq_uop_2_robIdx_value <= tr.io_lsq_uop_2_robIdx_value;
    endtask
endclass

`endif
