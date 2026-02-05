import CSR_in_agent_python_pkg::*;
//=========================================================
//File name    : python_driver.sv
//Author       : Python-UVM Integration
//Module name  : CSR_in_agent_python_driver
//Description  : Custom driver for Python-UVM integration
//              - Receives transactions from Python via TLM (b_transport)
//              - Drives DUT input signals directly through interface
//              - Non-blocking: continuously drives without waiting for monitor feedback
//Date         : 2026-02-05
//=========================================================
`ifndef CSR_IN_AGENT_PYTHON_DRIVER__SV
`define CSR_IN_AGENT_PYTHON_DRIVER__SV

class CSR_in_agent_python_driver extends CSR_in_agent_xaction_xdriver;
    `uvm_component_utils(CSR_in_agent_python_driver)
    
    virtual CSR_in_agent_interface vif;
    int transaction_count = 0;
    
    function new(string name = "CSR_in_agent_python_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual CSR_in_agent_interface)::get(this, "", "vif", vif))
            `uvm_fatal("CSR_IN_PYTHON_DRV", "Virtual interface not found")
        `uvm_info("CSR_IN_PYTHON_DRV", "Build phase completed", UVM_LOW)
    endfunction
    
    // Override sequence_receive to drive DUT
    // This method is called by the base class b_transport when Python sends data
    virtual task sequence_receive(CSR_in_agent_xaction tr);
        transaction_count++;
        
        `uvm_info("CSR_IN_PYTHON_DRV", 
                  $sformatf("[%0d] Received transaction from Python", transaction_count), 
                  UVM_LOW)
        
        // Print received transaction details
        `uvm_info("CSR_IN_PYTHON_DRV", 
                  $sformatf("[%0d] Transaction from Python: intrBitSet=%0b, wfiEvent=%0b, criticalErrorState=%0b, snptDeq=%0b, useSnpt=%0b, snptSelect=%0d", 
                            transaction_count, 
                            tr.io_csr_intrBitSet, 
                            tr.io_csr_wfiEvent, 
                            tr.io_csr_criticalErrorState, 
                            tr.io_snpt_snptDeq, 
                            tr.io_snpt_useSnpt, 
                            tr.io_snpt_snptSelect), 
                  UVM_MEDIUM)
        
        // Drive DUT inputs through VIF (only actual hardware signals)
        vif.io_csr_intrBitSet <= tr.io_csr_intrBitSet;
        vif.io_csr_wfiEvent <= tr.io_csr_wfiEvent;
        vif.io_csr_criticalErrorState <= tr.io_csr_criticalErrorState;
        vif.io_snpt_snptDeq <= tr.io_snpt_snptDeq;
        vif.io_snpt_useSnpt <= tr.io_snpt_useSnpt;
        vif.io_snpt_snptSelect <= tr.io_snpt_snptSelect;
        vif.io_snpt_flushVec_0 <= tr.io_snpt_flushVec_0;
        vif.io_snpt_flushVec_1 <= tr.io_snpt_flushVec_1;
        vif.io_snpt_flushVec_2 <= tr.io_snpt_flushVec_2;
        vif.io_snpt_flushVec_3 <= tr.io_snpt_flushVec_3;
        vif.io_wfi_safeFromMem <= tr.io_wfi_safeFromMem;
        vif.io_wfi_safeFromFrontend <= tr.io_wfi_safeFromFrontend;
        vif.io_wfi_enable <= tr.io_wfi_enable;
        vif.io_fromVecExcpMod_busy <= tr.io_fromVecExcpMod_busy;
        vif.io_readGPAMemData_gpaddr <= tr.io_readGPAMemData_gpaddr;
        vif.io_readGPAMemData_isForVSnonLeafPTE <= tr.io_readGPAMemData_isForVSnonLeafPTE;
        vif.io_vstartIsZero <= tr.io_vstartIsZero;
        vif.io_debugEnqLsq_canAccept <= tr.io_debugEnqLsq_canAccept;
        vif.io_debugEnqLsq_needAlloc_0 <= tr.io_debugEnqLsq_needAlloc_0;
        vif.io_debugEnqLsq_needAlloc_1 <= tr.io_debugEnqLsq_needAlloc_1;
        vif.io_debugEnqLsq_needAlloc_2 <= tr.io_debugEnqLsq_needAlloc_2;
        vif.io_debugEnqLsq_needAlloc_3 <= tr.io_debugEnqLsq_needAlloc_3;
        vif.io_debugEnqLsq_needAlloc_4 <= tr.io_debugEnqLsq_needAlloc_4;
        vif.io_debugEnqLsq_needAlloc_5 <= tr.io_debugEnqLsq_needAlloc_5;
        vif.io_debugEnqLsq_req_0_valid <= tr.io_debugEnqLsq_req_0_valid;
        vif.io_debugEnqLsq_req_0_bits_robIdx_value <= tr.io_debugEnqLsq_req_0_bits_robIdx_value;
        vif.io_debugEnqLsq_req_0_bits_lqIdx_value <= tr.io_debugEnqLsq_req_0_bits_lqIdx_value;
        vif.io_debugEnqLsq_req_1_valid <= tr.io_debugEnqLsq_req_1_valid;
        vif.io_debugEnqLsq_req_1_bits_robIdx_value <= tr.io_debugEnqLsq_req_1_bits_robIdx_value;
        vif.io_debugEnqLsq_req_1_bits_lqIdx_value <= tr.io_debugEnqLsq_req_1_bits_lqIdx_value;
        vif.io_debugEnqLsq_req_2_valid <= tr.io_debugEnqLsq_req_2_valid;
        vif.io_debugEnqLsq_req_2_bits_robIdx_value <= tr.io_debugEnqLsq_req_2_bits_robIdx_value;
        vif.io_debugEnqLsq_req_2_bits_lqIdx_value <= tr.io_debugEnqLsq_req_2_bits_lqIdx_value;
        vif.io_debugEnqLsq_req_3_valid <= tr.io_debugEnqLsq_req_3_valid;
        vif.io_debugEnqLsq_req_3_bits_robIdx_value <= tr.io_debugEnqLsq_req_3_bits_robIdx_value;
        vif.io_debugEnqLsq_req_3_bits_lqIdx_value <= tr.io_debugEnqLsq_req_3_bits_lqIdx_value;
        vif.io_debugEnqLsq_req_4_valid <= tr.io_debugEnqLsq_req_4_valid;
        vif.io_debugEnqLsq_req_4_bits_robIdx_value <= tr.io_debugEnqLsq_req_4_bits_robIdx_value;
        vif.io_debugEnqLsq_req_4_bits_lqIdx_value <= tr.io_debugEnqLsq_req_4_bits_lqIdx_value;
        vif.io_debugEnqLsq_req_5_valid <= tr.io_debugEnqLsq_req_5_valid;
        vif.io_debugEnqLsq_req_5_bits_robIdx_value <= tr.io_debugEnqLsq_req_5_bits_robIdx_value;
        vif.io_debugEnqLsq_req_5_bits_lqIdx_value <= tr.io_debugEnqLsq_req_5_bits_lqIdx_value;
        vif.io_debugInstrAddrTransType_bare <= tr.io_debugInstrAddrTransType_bare;
        vif.io_debugInstrAddrTransType_sv39 <= tr.io_debugInstrAddrTransType_sv39;
        vif.io_debugInstrAddrTransType_sv39x4 <= tr.io_debugInstrAddrTransType_sv39x4;
        vif.io_debugInstrAddrTransType_sv48 <= tr.io_debugInstrAddrTransType_sv48;
        vif.io_debugInstrAddrTransType_sv48x4 <= tr.io_debugInstrAddrTransType_sv48x4;
        vif.io_storeDebugInfo_0_robidx_value <= tr.io_storeDebugInfo_0_robidx_value;
        vif.io_storeDebugInfo_1_robidx_value <= tr.io_storeDebugInfo_1_robidx_value;
        
        `uvm_info("CSR_IN_PYTHON_DRV", 
                  $sformatf("[%0d] DUT inputs driven successfully", transaction_count), 
                  UVM_MEDIUM)
    endtask
    
    function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info("CSR_IN_PYTHON_DRV", 
                  $sformatf("Total transactions received: %0d", transaction_count), 
                  UVM_LOW)
    endfunction
endclass

`endif