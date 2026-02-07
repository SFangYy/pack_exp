`ifndef WRITEBACK_IN_AGENT_PYTHON_DRIVER__SV
`define WRITEBACK_IN_AGENT_PYTHON_DRIVER__SV

class WriteBack_in_agent_python_driver extends WriteBack_in_agent_xaction_xdriver;
    `uvm_component_utils(WriteBack_in_agent_python_driver)
    
    virtual WriteBack_in_agent_interface vif;
    int transaction_count = 0;
    
    function new(string name = "WriteBack_in_agent_python_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual WriteBack_in_agent_interface)::get(this, "", "vif", vif))
            `uvm_fatal("WB_IN_PYTHON_DRV", "Virtual interface not found")
    endfunction
    
    virtual task sequence_receive(WriteBack_in_agent_xaction tr);
        transaction_count++;
        // Enhanced logging
        `uvm_info("WB_IN_PYTHON_DRV", 
                  $sformatf("[%0d] Recv: WB24(valid=%0d data=0x%0h robIdx=%0d) WB23(valid=%0d data=0x%0h robIdx=%0d)", 
                            transaction_count,
                            tr.io_writeback_24_valid, tr.io_writeback_24_bits_data_0, tr.io_writeback_24_bits_robIdx_value,
                            tr.io_writeback_23_valid, tr.io_writeback_23_bits_data_0, tr.io_writeback_23_bits_robIdx_value), 
                  UVM_LOW)
        
        // Drive sample signals
        vif.io_writeback_24_valid <= tr.io_writeback_24_valid;
        vif.io_writeback_24_bits_data_0 <= tr.io_writeback_24_bits_data_0;
        vif.io_writeback_24_bits_pdest <= tr.io_writeback_24_bits_pdest;
        vif.io_writeback_24_bits_robIdx_value <= tr.io_writeback_24_bits_robIdx_value;
        
        vif.io_writeback_23_valid <= tr.io_writeback_23_valid;
        vif.io_writeback_23_bits_data_0 <= tr.io_writeback_23_bits_data_0;
        vif.io_writeback_23_bits_robIdx_value <= tr.io_writeback_23_bits_robIdx_value;
    endtask
endclass

`endif
