`ifndef MEM_IN_AGENT_PYTHON_MONITOR__SV
`define MEM_IN_AGENT_PYTHON_MONITOR__SV

class Mem_in_agent_python_monitor extends Mem_in_agent_xaction_xmonitor;
    `uvm_component_utils(Mem_in_agent_python_monitor)
    
    virtual Mem_in_agent_interface vif;
    int transaction_count = 0;
    
    function new(string name = "Mem_in_agent_python_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual Mem_in_agent_interface)::get(this, "", "vif", vif))
            `uvm_fatal("MEM_IN_PYTHON_MON", "Virtual interface not found")
    endfunction
    
    virtual task run_phase(uvm_phase phase);
        Mem_in_agent_xaction tr;
        forever begin
            // Sample on any signal change or clock posedge
            // Adjust sensitivity list based on actual needs
            @(vif.io_lsq_mmio_0 or vif.io_lsq_mmio_1 or vif.io_lsq_mmio_2 or 
              vif.io_lsq_uop_0_robIdx_value or vif.io_lsq_uop_1_robIdx_value or 
              vif.io_lsq_uop_2_robIdx_value);
            
            tr = Mem_in_agent_xaction::type_id::create("tr");
            tr.io_lsq_mmio_0 = vif.io_lsq_mmio_0;
            tr.io_lsq_mmio_1 = vif.io_lsq_mmio_1;
            tr.io_lsq_mmio_2 = vif.io_lsq_mmio_2;
            tr.io_lsq_uop_0_robIdx_value = vif.io_lsq_uop_0_robIdx_value;
            tr.io_lsq_uop_1_robIdx_value = vif.io_lsq_uop_1_robIdx_value;
            tr.io_lsq_uop_2_robIdx_value = vif.io_lsq_uop_2_robIdx_value;
            
            transaction_count++;
            fork begin
                Mem_in_agent_xaction tr_copy;
                $cast(tr_copy, tr.clone());
                sequence_send(tr_copy);
            end join_none
        end
    endtask
endclass

`endif
