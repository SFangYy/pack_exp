`ifndef WRITEBACK_IN_AGENT_PYTHON_MONITOR__SV
`define WRITEBACK_IN_AGENT_PYTHON_MONITOR__SV

class WriteBack_in_agent_python_monitor extends WriteBack_in_agent_xaction_xmonitor;
    `uvm_component_utils(WriteBack_in_agent_python_monitor)
    
    virtual WriteBack_in_agent_interface vif;
    int transaction_count = 0;
    
    function new(string name = "WriteBack_in_agent_python_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual WriteBack_in_agent_interface)::get(this, "", "vif", vif))
            `uvm_fatal("WB_IN_PYTHON_MON", "Virtual interface not found")
    endfunction
    
    virtual task run_phase(uvm_phase phase);
        WriteBack_in_agent_xaction tr;
        forever begin
            @(posedge vif.clk);
            if (vif.io_writeback_24_valid || vif.io_writeback_23_valid) begin
                tr = WriteBack_in_agent_xaction::type_id::create("tr");
                
                // Sample Channel 24
                tr.io_writeback_24_valid = vif.io_writeback_24_valid;
                tr.io_writeback_24_bits_data_0 = vif.io_writeback_24_bits_data_0;
                tr.io_writeback_24_bits_robIdx_value = vif.io_writeback_24_bits_robIdx_value;
                
                // Sample Channel 23
                tr.io_writeback_23_valid = vif.io_writeback_23_valid;
                tr.io_writeback_23_bits_data_0 = vif.io_writeback_23_bits_data_0;
                tr.io_writeback_23_bits_robIdx_value = vif.io_writeback_23_bits_robIdx_value;

                transaction_count++;
                
                // Enhanced logging
                `uvm_info("WB_IN_PYTHON_MON", 
                          $sformatf("[%0d] Sampled: WB24(valid=%0d data=0x%0h) WB23(valid=%0d data=0x%0h)", 
                                    transaction_count,
                                    tr.io_writeback_24_valid, tr.io_writeback_24_bits_data_0,
                                    tr.io_writeback_23_valid, tr.io_writeback_23_bits_data_0), 
                          UVM_LOW)

                fork begin
                    WriteBack_in_agent_xaction tr_copy;
                    $cast(tr_copy, tr.clone());
                    sequence_send(tr_copy);
                end join_none
            end
        end
    endtask
endclass

`endif
