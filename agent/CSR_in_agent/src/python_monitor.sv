import CSR_in_agent_python_pkg::*;
//=========================================================
//File name    : python_monitor.sv
//Author       : Python-UVM Integration
//Module name  : CSR_in_agent_python_monitor
//Description  : Custom monitor for Python-UVM integration
//              - Independently samples CSR_in_agent_xaction transaction signals
//              - Only sends to Python when data changes (optimization)
//Date         : 2026-02-05
//=========================================================
`ifndef CSR_IN_AGENT_PYTHON_MONITOR__SV
`define CSR_IN_AGENT_PYTHON_MONITOR__SV

class CSR_in_agent_python_monitor extends CSR_in_agent_xaction_xmonitor;
    `uvm_component_utils(CSR_in_agent_python_monitor)
    
    virtual CSR_in_agent_interface vif;
    CSR_in_agent_xaction prev_tr;
    int transaction_count = 0;
    
    function new(string name = "CSR_in_agent_python_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual CSR_in_agent_interface)::get(this, "", "vif", vif))
            `uvm_fatal("CSR_IN_PYTHON_MON", "Virtual interface not found")
        prev_tr = CSR_in_agent_xaction::type_id::create("prev_tr");
        `uvm_info("CSR_IN_PYTHON_MON", "Build phase completed", UVM_LOW)
    endfunction
    
    // Monitor independently samples interface and sends to Python
    virtual task run_phase(uvm_phase phase);
        CSR_in_agent_xaction tr;
        
        `uvm_info("CSR_IN_PYTHON_MON", "Run phase started", UVM_LOW)
        
        forever begin
            // Wait for any input signal to change (indicates new transaction from Python)
            @(posedge vif.io_csr_intrBitSet or posedge vif.io_csr_wfiEvent or 
               posedge vif.io_csr_criticalErrorState or posedge vif.io_snpt_snptDeq or
               posedge vif.io_snpt_useSnpt or vif.io_snpt_snptSelect or
               posedge vif.io_snpt_flushVec_0 or posedge vif.io_snpt_flushVec_1 or
               posedge vif.io_snpt_flushVec_2 or posedge vif.io_snpt_flushVec_3 or
               posedge vif.io_wfi_safeFromMem or posedge vif.io_wfi_safeFromFrontend or
               posedge vif.io_wfi_enable or posedge vif.io_fromVecExcpMod_busy);
            
            `uvm_info("CSR_IN_PYTHON_MON", 
                      $sformatf("Signal change detected at %0t", $time), 
                      UVM_HIGH)
            
            // Sample all signals from VIF (only actual hardware signals)
            tr = CSR_in_agent_xaction::type_id::create("tr");
            tr.io_csr_intrBitSet = vif.io_csr_intrBitSet;
            tr.io_csr_wfiEvent = vif.io_csr_wfiEvent;
            tr.io_csr_criticalErrorState = vif.io_csr_criticalErrorState;
            tr.io_snpt_snptDeq = vif.io_snpt_snptDeq;
            tr.io_snpt_useSnpt = vif.io_snpt_useSnpt;
            tr.io_snpt_snptSelect = vif.io_snpt_snptSelect;
            tr.io_snpt_flushVec_0 = vif.io_snpt_flushVec_0;
            tr.io_snpt_flushVec_1 = vif.io_snpt_flushVec_1;
            tr.io_snpt_flushVec_2 = vif.io_snpt_flushVec_2;
            tr.io_snpt_flushVec_3 = vif.io_snpt_flushVec_3;
            tr.io_wfi_safeFromMem = vif.io_wfi_safeFromMem;
            tr.io_wfi_safeFromFrontend = vif.io_wfi_safeFromFrontend;
            tr.io_wfi_enable = vif.io_wfi_enable;
            tr.io_fromVecExcpMod_busy = vif.io_fromVecExcpMod_busy;
            tr.io_readGPAMemData_gpaddr = vif.io_readGPAMemData_gpaddr;
            tr.io_readGPAMemData_isForVSnonLeafPTE = vif.io_readGPAMemData_isForVSnonLeafPTE;
            tr.io_vstartIsZero = vif.io_vstartIsZero;
            tr.io_debugEnqLsq_canAccept = vif.io_debugEnqLsq_canAccept;
            tr.io_debugEnqLsq_needAlloc_0 = vif.io_debugEnqLsq_needAlloc_0;
            tr.io_debugEnqLsq_needAlloc_1 = vif.io_debugEnqLsq_needAlloc_1;
            tr.io_debugEnqLsq_needAlloc_2 = vif.io_debugEnqLsq_needAlloc_2;
            tr.io_debugEnqLsq_needAlloc_3 = vif.io_debugEnqLsq_needAlloc_3;
            tr.io_debugEnqLsq_needAlloc_4 = vif.io_debugEnqLsq_needAlloc_4;
            tr.io_debugEnqLsq_needAlloc_5 = vif.io_debugEnqLsq_needAlloc_5;
            tr.io_debugEnqLsq_req_0_valid = vif.io_debugEnqLsq_req_0_valid;
            tr.io_debugEnqLsq_req_0_bits_robIdx_value = vif.io_debugEnqLsq_req_0_bits_robIdx_value;
            tr.io_debugEnqLsq_req_0_bits_lqIdx_value = vif.io_debugEnqLsq_req_0_bits_lqIdx_value;
            tr.io_debugEnqLsq_req_1_valid = vif.io_debugEnqLsq_req_1_valid;
            tr.io_debugEnqLsq_req_1_bits_robIdx_value = vif.io_debugEnqLsq_req_1_bits_robIdx_value;
            tr.io_debugEnqLsq_req_1_bits_lqIdx_value = vif.io_debugEnqLsq_req_1_bits_lqIdx_value;
            tr.io_debugEnqLsq_req_2_valid = vif.io_debugEnqLsq_req_2_valid;
            tr.io_debugEnqLsq_req_2_bits_robIdx_value = vif.io_debugEnqLsq_req_2_bits_robIdx_value;
            tr.io_debugEnqLsq_req_2_bits_lqIdx_value = vif.io_debugEnqLsq_req_2_bits_lqIdx_value;
            tr.io_debugEnqLsq_req_3_valid = vif.io_debugEnqLsq_req_3_valid;
            tr.io_debugEnqLsq_req_3_bits_robIdx_value = vif.io_debugEnqLsq_req_3_bits_robIdx_value;
            tr.io_debugEnqLsq_req_3_bits_lqIdx_value = vif.io_debugEnqLsq_req_3_bits_lqIdx_value;
            tr.io_debugEnqLsq_req_4_valid = vif.io_debugEnqLsq_req_4_valid;
            tr.io_debugEnqLsq_req_4_bits_robIdx_value = vif.io_debugEnqLsq_req_4_bits_robIdx_value;
            tr.io_debugEnqLsq_req_4_bits_lqIdx_value = vif.io_debugEnqLsq_req_4_bits_lqIdx_value;
            tr.io_debugEnqLsq_req_5_valid = vif.io_debugEnqLsq_req_5_valid;
            tr.io_debugEnqLsq_req_5_bits_robIdx_value = vif.io_debugEnqLsq_req_5_bits_robIdx_value;
            tr.io_debugEnqLsq_req_5_bits_lqIdx_value = vif.io_debugEnqLsq_req_5_bits_lqIdx_value;
            tr.io_debugInstrAddrTransType_bare = vif.io_debugInstrAddrTransType_bare;
            tr.io_debugInstrAddrTransType_sv39 = vif.io_debugInstrAddrTransType_sv39;
            tr.io_debugInstrAddrTransType_sv39x4 = vif.io_debugInstrAddrTransType_sv39x4;
            tr.io_debugInstrAddrTransType_sv48 = vif.io_debugInstrAddrTransType_sv48;
            tr.io_debugInstrAddrTransType_sv48x4 = vif.io_debugInstrAddrTransType_sv48x4;
            tr.io_storeDebugInfo_0_robidx_value = vif.io_storeDebugInfo_0_robidx_value;
            tr.io_storeDebugInfo_1_robidx_value = vif.io_storeDebugInfo_1_robidx_value;
            
            // Send every sampled transaction to Python using forked process to avoid blocking
            transaction_count++;
            prev_tr.copy(tr);
            
            // Fork non-blocking send to avoid blocking the monitor loop
            fork begin
                CSR_in_agent_xaction tr_copy;
                tr_copy = CSR_in_agent_xaction::type_id::create("tr_copy");
                tr_copy.copy(tr);
                sequence_send(tr_copy);
            end join_none
            
            `uvm_info("CSR_IN_PYTHON_MON", 
                      $sformatf("[%0d] Sampled transaction: intrBitSet=%0b, wfiEvent=%0b, criticalErrorState=%0b, snptDeq=%0b, useSnpt=%0b, snptSelect=%0d - Sent to Python", 
                                  transaction_count, 
                                  tr.io_csr_intrBitSet, 
                                  tr.io_csr_wfiEvent, 
                                  tr.io_csr_criticalErrorState, 
                                  tr.io_snpt_snptDeq, 
                                  tr.io_snpt_useSnpt, 
                                  tr.io_snpt_snptSelect), 
                      UVM_MEDIUM)
        end
    endtask
    
    function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info("CSR_IN_PYTHON_MON", 
                  $sformatf("Total transactions sampled: %0d", transaction_count), 
                  UVM_LOW)
    endfunction
endclass

`endif