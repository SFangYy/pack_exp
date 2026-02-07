`ifndef RENAME_IN_AGENT_PYTHON_DRIVER__SV
`define RENAME_IN_AGENT_PYTHON_DRIVER__SV

class rename_in_agent_python_driver extends rename_in_agent_xaction_xdriver;
    `uvm_component_utils(rename_in_agent_python_driver)
    
    virtual rename_in_agent_interface vif;
    int transaction_count = 0;
    
    function new(string name = "rename_in_agent_python_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual rename_in_agent_interface)::get(this, "", "vif", vif))
            `uvm_fatal("RENAME_IN_PYTHON_DRV", "Virtual interface not found")
    endfunction
    
    virtual task sequence_receive(rename_in_agent_xaction tr);
        transaction_count++;
        // Enhanced logging: print core fields
        `uvm_info("RENAME_IN_PYTHON_DRV", 
                  $sformatf("[%0d] Recv: Req0(valid=%0d pc=0x%0h instr=0x%0h robIdx=%0d) Req1(valid=%0d pc=0x%0h instr=0x%0h robIdx=%0d)", 
                            transaction_count,
                            tr.io_enq_req_0_valid, tr.io_enq_req_0_bits_pc, tr.io_enq_req_0_bits_instr, tr.io_enq_req_0_bits_robIdx_value,
                            tr.io_enq_req_1_valid, tr.io_enq_req_1_bits_pc, tr.io_enq_req_1_bits_instr, tr.io_enq_req_1_bits_robIdx_value), 
                  UVM_LOW)
        
        // Drive all relevant signals from transaction to VIF
        vif.io_hartId <= tr.io_hartId;
        
        // Request 0
        vif.io_enq_req_0_valid <= tr.io_enq_req_0_valid;
        vif.io_enq_req_0_bits_instr <= tr.io_enq_req_0_bits_instr;
        vif.io_enq_req_0_bits_pc <= tr.io_enq_req_0_bits_pc;
        vif.io_enq_req_0_bits_exceptionVec_0 <= tr.io_enq_req_0_bits_exceptionVec_0;
        vif.io_enq_req_0_bits_exceptionVec_1 <= tr.io_enq_req_0_bits_exceptionVec_1;
        vif.io_enq_req_0_bits_exceptionVec_2 <= tr.io_enq_req_0_bits_exceptionVec_2;
        vif.io_enq_req_0_bits_exceptionVec_3 <= tr.io_enq_req_0_bits_exceptionVec_3;
        vif.io_enq_req_0_bits_exceptionVec_12 <= tr.io_enq_req_0_bits_exceptionVec_12;
        vif.io_enq_req_0_bits_exceptionVec_20 <= tr.io_enq_req_0_bits_exceptionVec_20;
        vif.io_enq_req_0_bits_exceptionVec_22 <= tr.io_enq_req_0_bits_exceptionVec_22;
        vif.io_enq_req_0_bits_isFetchMalAddr <= tr.io_enq_req_0_bits_isFetchMalAddr;
        vif.io_enq_req_0_bits_hasException <= tr.io_enq_req_0_bits_hasException;
        vif.io_enq_req_0_bits_trigger <= tr.io_enq_req_0_bits_trigger;
        vif.io_enq_req_0_bits_preDecodeInfo_isRVC <= tr.io_enq_req_0_bits_preDecodeInfo_isRVC;
        vif.io_enq_req_0_bits_crossPageIPFFix <= tr.io_enq_req_0_bits_crossPageIPFFix;
        vif.io_enq_req_0_bits_ftqPtr_flag <= tr.io_enq_req_0_bits_ftqPtr_flag;
        vif.io_enq_req_0_bits_ftqPtr_value <= tr.io_enq_req_0_bits_ftqPtr_value;
        vif.io_enq_req_0_bits_ftqOffset <= tr.io_enq_req_0_bits_ftqOffset;
        vif.io_enq_req_0_bits_ldest <= tr.io_enq_req_0_bits_ldest;
        vif.io_enq_req_0_bits_fuType <= tr.io_enq_req_0_bits_fuType;
        vif.io_enq_req_0_bits_fuOpType <= tr.io_enq_req_0_bits_fuOpType;
        vif.io_enq_req_0_bits_rfWen <= tr.io_enq_req_0_bits_rfWen;
        vif.io_enq_req_0_bits_fpWen <= tr.io_enq_req_0_bits_fpWen;
        vif.io_enq_req_0_bits_vecWen <= tr.io_enq_req_0_bits_vecWen;
        vif.io_enq_req_0_bits_v0Wen <= tr.io_enq_req_0_bits_v0Wen;
        vif.io_enq_req_0_bits_vlWen <= tr.io_enq_req_0_bits_vlWen;
        vif.io_enq_req_0_bits_isXSTrap <= tr.io_enq_req_0_bits_isXSTrap;
        vif.io_enq_req_0_bits_waitForward <= tr.io_enq_req_0_bits_waitForward;
        vif.io_enq_req_0_bits_blockBackward <= tr.io_enq_req_0_bits_blockBackward;
        vif.io_enq_req_0_bits_flushPipe <= tr.io_enq_req_0_bits_flushPipe;
        vif.io_enq_req_0_bits_vpu_vill <= tr.io_enq_req_0_bits_vpu_vill;
        vif.io_enq_req_0_bits_vpu_vma <= tr.io_enq_req_0_bits_vpu_vma;
        vif.io_enq_req_0_bits_vpu_vta <= tr.io_enq_req_0_bits_vpu_vta;
        vif.io_enq_req_0_bits_vpu_vsew <= tr.io_enq_req_0_bits_vpu_vsew;
        vif.io_enq_req_0_bits_vpu_vlmul <= tr.io_enq_req_0_bits_vpu_vlmul;
        vif.io_enq_req_0_bits_vpu_specVill <= tr.io_enq_req_0_bits_vpu_specVill;
        vif.io_enq_req_0_bits_vpu_specVma <= tr.io_enq_req_0_bits_vpu_specVma;
        vif.io_enq_req_0_bits_vpu_specVta <= tr.io_enq_req_0_bits_vpu_specVta;
        vif.io_enq_req_0_bits_vpu_specVsew <= tr.io_enq_req_0_bits_vpu_specVsew;
        vif.io_enq_req_0_bits_vpu_specVlmul <= tr.io_enq_req_0_bits_vpu_specVlmul;
        vif.io_enq_req_0_bits_vlsInstr <= tr.io_enq_req_0_bits_vlsInstr;
        vif.io_enq_req_0_bits_wfflags <= tr.io_enq_req_0_bits_wfflags;
        vif.io_enq_req_0_bits_isMove <= tr.io_enq_req_0_bits_isMove;
        vif.io_enq_req_0_bits_isVset <= tr.io_enq_req_0_bits_isVset;
        vif.io_enq_req_0_bits_firstUop <= tr.io_enq_req_0_bits_firstUop;
        vif.io_enq_req_0_bits_lastUop <= tr.io_enq_req_0_bits_lastUop;
        vif.io_enq_req_0_bits_numWB <= tr.io_enq_req_0_bits_numWB;
        vif.io_enq_req_0_bits_commitType <= tr.io_enq_req_0_bits_commitType;
        vif.io_enq_req_0_bits_pdest <= tr.io_enq_req_0_bits_pdest;
        vif.io_enq_req_0_bits_robIdx_flag <= tr.io_enq_req_0_bits_robIdx_flag;
        vif.io_enq_req_0_bits_robIdx_value <= tr.io_enq_req_0_bits_robIdx_value;
        vif.io_enq_req_0_bits_instrSize <= tr.io_enq_req_0_bits_instrSize;
        vif.io_enq_req_0_bits_dirtyFs <= tr.io_enq_req_0_bits_dirtyFs;
        vif.io_enq_req_0_bits_dirtyVs <= tr.io_enq_req_0_bits_dirtyVs;
        vif.io_enq_req_0_bits_traceBlockInPipe_itype <= tr.io_enq_req_0_bits_traceBlockInPipe_itype;
        vif.io_enq_req_0_bits_traceBlockInPipe_iretire <= tr.io_enq_req_0_bits_traceBlockInPipe_iretire;
        vif.io_enq_req_0_bits_traceBlockInPipe_ilastsize <= tr.io_enq_req_0_bits_traceBlockInPipe_ilastsize;
        vif.io_enq_req_0_bits_eliminatedMove <= tr.io_enq_req_0_bits_eliminatedMove;
        vif.io_enq_req_0_bits_snapshot <= tr.io_enq_req_0_bits_snapshot;
        vif.io_enq_req_0_bits_lqIdx_value <= tr.io_enq_req_0_bits_lqIdx_value;
        vif.io_enq_req_0_bits_sqIdx_value <= tr.io_enq_req_0_bits_sqIdx_value;
        vif.io_enq_req_0_bits_singleStep <= tr.io_enq_req_0_bits_singleStep;
        vif.io_enq_req_0_bits_debug_sim_trig <= tr.io_enq_req_0_bits_debug_sim_trig;

        // Request 1
        vif.io_enq_req_1_valid <= tr.io_enq_req_1_valid;
        vif.io_enq_req_1_bits_instr <= tr.io_enq_req_1_bits_instr;
        vif.io_enq_req_1_bits_pc <= tr.io_enq_req_1_bits_pc;
        // ... (truncated)
    endtask
endclass

`endif
