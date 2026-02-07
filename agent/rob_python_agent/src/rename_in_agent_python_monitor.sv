`ifndef RENAME_IN_AGENT_PYTHON_MONITOR__SV
`define RENAME_IN_AGENT_PYTHON_MONITOR__SV

class rename_in_agent_python_monitor extends rename_in_agent_xaction_xmonitor;
    `uvm_component_utils(rename_in_agent_python_monitor)
    
    virtual rename_in_agent_interface vif;
    int transaction_count = 0;
    
    function new(string name = "rename_in_agent_python_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual rename_in_agent_interface)::get(this, "", "vif", vif))
            `uvm_fatal("RENAME_IN_PYTHON_MON", "Virtual interface not found")
    endfunction
    
    virtual task run_phase(uvm_phase phase);
        rename_in_agent_xaction tr;
        forever begin
            @(posedge vif.clk);
            if (vif.io_enq_req_0_valid || vif.io_enq_req_1_valid) begin
                tr = rename_in_agent_xaction::type_id::create("tr");
                
                // Sample common signals
                tr.io_hartId = vif.io_hartId;
                
                // Sample Request 0
                tr.io_enq_req_0_valid = vif.io_enq_req_0_valid;
                tr.io_enq_req_0_bits_instr = vif.io_enq_req_0_bits_instr;
                tr.io_enq_req_0_bits_pc = vif.io_enq_req_0_bits_pc;
                tr.io_enq_req_0_bits_robIdx_value = vif.io_enq_req_0_bits_robIdx_value;
                
                // Sample Request 1
                tr.io_enq_req_1_valid = vif.io_enq_req_1_valid;
                tr.io_enq_req_1_bits_instr = vif.io_enq_req_1_bits_instr;
                tr.io_enq_req_1_bits_pc = vif.io_enq_req_1_bits_pc;
                tr.io_enq_req_1_bits_robIdx_value = vif.io_enq_req_1_bits_robIdx_value;

                transaction_count++;
                
                // Enhanced logging
                `uvm_info("RENAME_IN_PYTHON_MON", 
                          $sformatf("[%0d] Sampled: Req0(valid=%0d pc=0x%0h robIdx=%0d) Req1(valid=%0d pc=0x%0h robIdx=%0d)", 
                                    transaction_count,
                                    tr.io_enq_req_0_valid, tr.io_enq_req_0_bits_pc, tr.io_enq_req_0_bits_robIdx_value,
                                    tr.io_enq_req_1_valid, tr.io_enq_req_1_bits_pc, tr.io_enq_req_1_bits_robIdx_value), 
                          UVM_LOW)

                fork begin
                    rename_in_agent_xaction tr_copy;
                    $cast(tr_copy, tr.clone());
                    sequence_send(tr_copy);
                end join_none
            end
        end
    endtask
endclass

`endif
