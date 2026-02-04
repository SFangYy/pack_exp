//=========================================================
//File name    : CSR_in_agent_monitor.sv
//Author       : nanyunhao
//Module name  : CSR_in_agent_monitor
//Discribution : CSR_in_agent_monitor : monitor
//Date         : 2026-01-22
//=========================================================
`ifndef CSR_IN_AGENT_MONITOR__SV
`define CSR_IN_AGENT_MONITOR__SV

class CSR_in_agent_monitor  extends tcnt_monitor_base#(virtual CSR_in_agent_interface,CSR_in_agent_cfg,CSR_in_agent_xaction);

    `uvm_component_utils(CSR_in_agent_monitor)

    extern function new(string name, uvm_component parent);
    extern virtual function void build_phase(uvm_phase phase);
    extern task run_phase(uvm_phase phase);
    extern task mon_data();
endclass:CSR_in_agent_monitor

function CSR_in_agent_monitor::new(string name, uvm_component parent);
    super.new(name,parent);
endfunction:new

function void CSR_in_agent_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction:build_phase

task CSR_in_agent_monitor::run_phase(uvm_phase phase);
    super.run_phase(phase);
    this.mon_data();
endtask:run_phase

task CSR_in_agent_monitor::mon_data();

    logic         io_csr_intrBitSet    ;
    logic         io_csr_wfiEvent      ;
    logic         io_csr_criticalErrorState;
    logic         io_snpt_snptDeq      ;
    logic         io_snpt_useSnpt      ;
    logic [1:0]   io_snpt_snptSelect   ;
    logic         io_snpt_flushVec_0   ;
    logic         io_snpt_flushVec_1   ;
    logic         io_snpt_flushVec_2   ;
    logic         io_snpt_flushVec_3   ;
    logic         io_wfi_safeFromMem   ;
    logic         io_wfi_safeFromFrontend;
    logic         io_wfi_enable        ;
    logic         io_fromVecExcpMod_busy;
    logic [55:0]  io_readGPAMemData_gpaddr;
    logic         io_readGPAMemData_isForVSnonLeafPTE;
    logic         io_vstartIsZero      ;
    logic         io_debugEnqLsq_canAccept;
    logic [1:0]   io_debugEnqLsq_needAlloc_0;
    logic [1:0]   io_debugEnqLsq_needAlloc_1;
    logic [1:0]   io_debugEnqLsq_needAlloc_2;
    logic [1:0]   io_debugEnqLsq_needAlloc_3;
    logic [1:0]   io_debugEnqLsq_needAlloc_4;
    logic [1:0]   io_debugEnqLsq_needAlloc_5;
    logic         io_debugEnqLsq_req_0_valid;
    logic [7:0]   io_debugEnqLsq_req_0_bits_robIdx_value;
    logic [6:0]   io_debugEnqLsq_req_0_bits_lqIdx_value;
    logic         io_debugEnqLsq_req_1_valid;
    logic [7:0]   io_debugEnqLsq_req_1_bits_robIdx_value;
    logic [6:0]   io_debugEnqLsq_req_1_bits_lqIdx_value;
    logic         io_debugEnqLsq_req_2_valid;
    logic [7:0]   io_debugEnqLsq_req_2_bits_robIdx_value;
    logic [6:0]   io_debugEnqLsq_req_2_bits_lqIdx_value;
    logic         io_debugEnqLsq_req_3_valid;
    logic [7:0]   io_debugEnqLsq_req_3_bits_robIdx_value;
    logic [6:0]   io_debugEnqLsq_req_3_bits_lqIdx_value;
    logic         io_debugEnqLsq_req_4_valid;
    logic [7:0]   io_debugEnqLsq_req_4_bits_robIdx_value;
    logic [6:0]   io_debugEnqLsq_req_4_bits_lqIdx_value;
    logic         io_debugEnqLsq_req_5_valid;
    logic [7:0]   io_debugEnqLsq_req_5_bits_robIdx_value;
    logic [6:0]   io_debugEnqLsq_req_5_bits_lqIdx_value;
    logic         io_debugInstrAddrTransType_bare;
    logic         io_debugInstrAddrTransType_sv39;
    logic         io_debugInstrAddrTransType_sv39x4;
    logic         io_debugInstrAddrTransType_sv48;
    logic         io_debugInstrAddrTransType_sv48x4;
    logic [7:0]   io_storeDebugInfo_0_robidx_value;
    logic [7:0]   io_storeDebugInfo_1_robidx_value;

    CSR_in_agent_xaction  mon_tr;
    while(1) begin
        @this.vif.mon_mp.mon_cb;
        io_csr_intrBitSet = this.vif.mon_mp.mon_cb.io_csr_intrBitSet;
        io_csr_wfiEvent = this.vif.mon_mp.mon_cb.io_csr_wfiEvent;
        io_csr_criticalErrorState = this.vif.mon_mp.mon_cb.io_csr_criticalErrorState;
        io_snpt_snptDeq = this.vif.mon_mp.mon_cb.io_snpt_snptDeq;
        io_snpt_useSnpt = this.vif.mon_mp.mon_cb.io_snpt_useSnpt;
        io_snpt_snptSelect = this.vif.mon_mp.mon_cb.io_snpt_snptSelect;
        io_snpt_flushVec_0 = this.vif.mon_mp.mon_cb.io_snpt_flushVec_0;
        io_snpt_flushVec_1 = this.vif.mon_mp.mon_cb.io_snpt_flushVec_1;
        io_snpt_flushVec_2 = this.vif.mon_mp.mon_cb.io_snpt_flushVec_2;
        io_snpt_flushVec_3 = this.vif.mon_mp.mon_cb.io_snpt_flushVec_3;
        io_wfi_safeFromMem = this.vif.mon_mp.mon_cb.io_wfi_safeFromMem;
        io_wfi_safeFromFrontend = this.vif.mon_mp.mon_cb.io_wfi_safeFromFrontend;
        io_wfi_enable = this.vif.mon_mp.mon_cb.io_wfi_enable;
        io_fromVecExcpMod_busy = this.vif.mon_mp.mon_cb.io_fromVecExcpMod_busy;
        io_readGPAMemData_gpaddr = this.vif.mon_mp.mon_cb.io_readGPAMemData_gpaddr;
        io_readGPAMemData_isForVSnonLeafPTE = this.vif.mon_mp.mon_cb.io_readGPAMemData_isForVSnonLeafPTE;
        io_vstartIsZero = this.vif.mon_mp.mon_cb.io_vstartIsZero;
        io_debugEnqLsq_canAccept = this.vif.mon_mp.mon_cb.io_debugEnqLsq_canAccept;
        io_debugEnqLsq_needAlloc_0 = this.vif.mon_mp.mon_cb.io_debugEnqLsq_needAlloc_0;
        io_debugEnqLsq_needAlloc_1 = this.vif.mon_mp.mon_cb.io_debugEnqLsq_needAlloc_1;
        io_debugEnqLsq_needAlloc_2 = this.vif.mon_mp.mon_cb.io_debugEnqLsq_needAlloc_2;
        io_debugEnqLsq_needAlloc_3 = this.vif.mon_mp.mon_cb.io_debugEnqLsq_needAlloc_3;
        io_debugEnqLsq_needAlloc_4 = this.vif.mon_mp.mon_cb.io_debugEnqLsq_needAlloc_4;
        io_debugEnqLsq_needAlloc_5 = this.vif.mon_mp.mon_cb.io_debugEnqLsq_needAlloc_5;
        io_debugEnqLsq_req_0_valid = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_0_valid;
        io_debugEnqLsq_req_0_bits_robIdx_value = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_0_bits_robIdx_value;
        io_debugEnqLsq_req_0_bits_lqIdx_value = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_0_bits_lqIdx_value;
        io_debugEnqLsq_req_1_valid = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_1_valid;
        io_debugEnqLsq_req_1_bits_robIdx_value = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_1_bits_robIdx_value;
        io_debugEnqLsq_req_1_bits_lqIdx_value = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_1_bits_lqIdx_value;
        io_debugEnqLsq_req_2_valid = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_2_valid;
        io_debugEnqLsq_req_2_bits_robIdx_value = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_2_bits_robIdx_value;
        io_debugEnqLsq_req_2_bits_lqIdx_value = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_2_bits_lqIdx_value;
        io_debugEnqLsq_req_3_valid = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_3_valid;
        io_debugEnqLsq_req_3_bits_robIdx_value = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_3_bits_robIdx_value;
        io_debugEnqLsq_req_3_bits_lqIdx_value = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_3_bits_lqIdx_value;
        io_debugEnqLsq_req_4_valid = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_4_valid;
        io_debugEnqLsq_req_4_bits_robIdx_value = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_4_bits_robIdx_value;
        io_debugEnqLsq_req_4_bits_lqIdx_value = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_4_bits_lqIdx_value;
        io_debugEnqLsq_req_5_valid = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_5_valid;
        io_debugEnqLsq_req_5_bits_robIdx_value = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_5_bits_robIdx_value;
        io_debugEnqLsq_req_5_bits_lqIdx_value = this.vif.mon_mp.mon_cb.io_debugEnqLsq_req_5_bits_lqIdx_value;
        io_debugInstrAddrTransType_bare = this.vif.mon_mp.mon_cb.io_debugInstrAddrTransType_bare;
        io_debugInstrAddrTransType_sv39 = this.vif.mon_mp.mon_cb.io_debugInstrAddrTransType_sv39;
        io_debugInstrAddrTransType_sv39x4 = this.vif.mon_mp.mon_cb.io_debugInstrAddrTransType_sv39x4;
        io_debugInstrAddrTransType_sv48 = this.vif.mon_mp.mon_cb.io_debugInstrAddrTransType_sv48;
        io_debugInstrAddrTransType_sv48x4 = this.vif.mon_mp.mon_cb.io_debugInstrAddrTransType_sv48x4;
        io_storeDebugInfo_0_robidx_value = this.vif.mon_mp.mon_cb.io_storeDebugInfo_0_robidx_value;
        io_storeDebugInfo_1_robidx_value = this.vif.mon_mp.mon_cb.io_storeDebugInfo_1_robidx_value;

        if(this.cfg.xz_sw==tcnt_dec_base::ON & this.vif.rst_n==1'b1) begin
            `TCNT_CHECK_SIG_XZ(io_csr_intrBitSet,io_csr_intrBitSet,1);
            `TCNT_CHECK_SIG_XZ(io_csr_wfiEvent,io_csr_wfiEvent,1);
            `TCNT_CHECK_SIG_XZ(io_csr_criticalErrorState,io_csr_criticalErrorState,1);
            `TCNT_CHECK_SIG_XZ(io_snpt_snptDeq,io_snpt_snptDeq,1);
            `TCNT_CHECK_SIG_XZ(io_snpt_useSnpt,io_snpt_useSnpt,1);
            `TCNT_CHECK_SIG_XZ(io_snpt_snptSelect,io_snpt_snptSelect,2);
            `TCNT_CHECK_SIG_XZ(io_snpt_flushVec_0,io_snpt_flushVec_0,1);
            `TCNT_CHECK_SIG_XZ(io_snpt_flushVec_1,io_snpt_flushVec_1,1);
            `TCNT_CHECK_SIG_XZ(io_snpt_flushVec_2,io_snpt_flushVec_2,1);
            `TCNT_CHECK_SIG_XZ(io_snpt_flushVec_3,io_snpt_flushVec_3,1);
            `TCNT_CHECK_SIG_XZ(io_wfi_safeFromMem,io_wfi_safeFromMem,1);
            `TCNT_CHECK_SIG_XZ(io_wfi_safeFromFrontend,io_wfi_safeFromFrontend,1);
            `TCNT_CHECK_SIG_XZ(io_wfi_enable,io_wfi_enable,1);
            `TCNT_CHECK_SIG_XZ(io_fromVecExcpMod_busy,io_fromVecExcpMod_busy,1);
            `TCNT_CHECK_SIG_XZ(io_readGPAMemData_gpaddr,io_readGPAMemData_gpaddr,56);
            `TCNT_CHECK_SIG_XZ(io_readGPAMemData_isForVSnonLeafPTE,io_readGPAMemData_isForVSnonLeafPTE,1);
            `TCNT_CHECK_SIG_XZ(io_vstartIsZero,io_vstartIsZero,1);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_canAccept,io_debugEnqLsq_canAccept,1);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_needAlloc_0,io_debugEnqLsq_needAlloc_0,2);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_needAlloc_1,io_debugEnqLsq_needAlloc_1,2);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_needAlloc_2,io_debugEnqLsq_needAlloc_2,2);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_needAlloc_3,io_debugEnqLsq_needAlloc_3,2);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_needAlloc_4,io_debugEnqLsq_needAlloc_4,2);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_needAlloc_5,io_debugEnqLsq_needAlloc_5,2);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_0_valid,io_debugEnqLsq_req_0_valid,1);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_0_bits_robIdx_value,io_debugEnqLsq_req_0_bits_robIdx_value,8);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_0_bits_lqIdx_value,io_debugEnqLsq_req_0_bits_lqIdx_value,7);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_1_valid,io_debugEnqLsq_req_1_valid,1);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_1_bits_robIdx_value,io_debugEnqLsq_req_1_bits_robIdx_value,8);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_1_bits_lqIdx_value,io_debugEnqLsq_req_1_bits_lqIdx_value,7);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_2_valid,io_debugEnqLsq_req_2_valid,1);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_2_bits_robIdx_value,io_debugEnqLsq_req_2_bits_robIdx_value,8);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_2_bits_lqIdx_value,io_debugEnqLsq_req_2_bits_lqIdx_value,7);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_3_valid,io_debugEnqLsq_req_3_valid,1);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_3_bits_robIdx_value,io_debugEnqLsq_req_3_bits_robIdx_value,8);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_3_bits_lqIdx_value,io_debugEnqLsq_req_3_bits_lqIdx_value,7);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_4_valid,io_debugEnqLsq_req_4_valid,1);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_4_bits_robIdx_value,io_debugEnqLsq_req_4_bits_robIdx_value,8);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_4_bits_lqIdx_value,io_debugEnqLsq_req_4_bits_lqIdx_value,7);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_5_valid,io_debugEnqLsq_req_5_valid,1);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_5_bits_robIdx_value,io_debugEnqLsq_req_5_bits_robIdx_value,8);
            `TCNT_CHECK_SIG_XZ(io_debugEnqLsq_req_5_bits_lqIdx_value,io_debugEnqLsq_req_5_bits_lqIdx_value,7);
            `TCNT_CHECK_SIG_XZ(io_debugInstrAddrTransType_bare,io_debugInstrAddrTransType_bare,1);
            `TCNT_CHECK_SIG_XZ(io_debugInstrAddrTransType_sv39,io_debugInstrAddrTransType_sv39,1);
            `TCNT_CHECK_SIG_XZ(io_debugInstrAddrTransType_sv39x4,io_debugInstrAddrTransType_sv39x4,1);
            `TCNT_CHECK_SIG_XZ(io_debugInstrAddrTransType_sv48,io_debugInstrAddrTransType_sv48,1);
            `TCNT_CHECK_SIG_XZ(io_debugInstrAddrTransType_sv48x4,io_debugInstrAddrTransType_sv48x4,1);
            `TCNT_CHECK_SIG_XZ(io_storeDebugInfo_0_robidx_value,io_storeDebugInfo_0_robidx_value,8);
            `TCNT_CHECK_SIG_XZ(io_storeDebugInfo_1_robidx_value,io_storeDebugInfo_1_robidx_value,8);

        end
        //if(xxxTODOxxx==1'b1) begin
        //    mon_tr = CSR_in_agent_xaction::type_id::create("mon_tr");
        //    mon_tr.io_csr_intrBitSet = io_csr_intrBitSet;
        //    mon_tr.io_csr_wfiEvent = io_csr_wfiEvent;
        //    mon_tr.io_csr_criticalErrorState = io_csr_criticalErrorState;
        //    mon_tr.io_snpt_snptDeq = io_snpt_snptDeq;
        //    mon_tr.io_snpt_useSnpt = io_snpt_useSnpt;
        //    mon_tr.io_snpt_snptSelect = io_snpt_snptSelect;
        //    mon_tr.io_snpt_flushVec_0 = io_snpt_flushVec_0;
        //    mon_tr.io_snpt_flushVec_1 = io_snpt_flushVec_1;
        //    mon_tr.io_snpt_flushVec_2 = io_snpt_flushVec_2;
        //    mon_tr.io_snpt_flushVec_3 = io_snpt_flushVec_3;
        //    mon_tr.io_wfi_safeFromMem = io_wfi_safeFromMem;
        //    mon_tr.io_wfi_safeFromFrontend = io_wfi_safeFromFrontend;
        //    mon_tr.io_wfi_enable = io_wfi_enable;
        //    mon_tr.io_fromVecExcpMod_busy = io_fromVecExcpMod_busy;
        //    mon_tr.io_readGPAMemData_gpaddr = io_readGPAMemData_gpaddr;
        //    mon_tr.io_readGPAMemData_isForVSnonLeafPTE = io_readGPAMemData_isForVSnonLeafPTE;
        //    mon_tr.io_vstartIsZero = io_vstartIsZero;
        //    mon_tr.io_debugEnqLsq_canAccept = io_debugEnqLsq_canAccept;
        //    mon_tr.io_debugEnqLsq_needAlloc_0 = io_debugEnqLsq_needAlloc_0;
        //    mon_tr.io_debugEnqLsq_needAlloc_1 = io_debugEnqLsq_needAlloc_1;
        //    mon_tr.io_debugEnqLsq_needAlloc_2 = io_debugEnqLsq_needAlloc_2;
        //    mon_tr.io_debugEnqLsq_needAlloc_3 = io_debugEnqLsq_needAlloc_3;
        //    mon_tr.io_debugEnqLsq_needAlloc_4 = io_debugEnqLsq_needAlloc_4;
        //    mon_tr.io_debugEnqLsq_needAlloc_5 = io_debugEnqLsq_needAlloc_5;
        //    mon_tr.io_debugEnqLsq_req_0_valid = io_debugEnqLsq_req_0_valid;
        //    mon_tr.io_debugEnqLsq_req_0_bits_robIdx_value = io_debugEnqLsq_req_0_bits_robIdx_value;
        //    mon_tr.io_debugEnqLsq_req_0_bits_lqIdx_value = io_debugEnqLsq_req_0_bits_lqIdx_value;
        //    mon_tr.io_debugEnqLsq_req_1_valid = io_debugEnqLsq_req_1_valid;
        //    mon_tr.io_debugEnqLsq_req_1_bits_robIdx_value = io_debugEnqLsq_req_1_bits_robIdx_value;
        //    mon_tr.io_debugEnqLsq_req_1_bits_lqIdx_value = io_debugEnqLsq_req_1_bits_lqIdx_value;
        //    mon_tr.io_debugEnqLsq_req_2_valid = io_debugEnqLsq_req_2_valid;
        //    mon_tr.io_debugEnqLsq_req_2_bits_robIdx_value = io_debugEnqLsq_req_2_bits_robIdx_value;
        //    mon_tr.io_debugEnqLsq_req_2_bits_lqIdx_value = io_debugEnqLsq_req_2_bits_lqIdx_value;
        //    mon_tr.io_debugEnqLsq_req_3_valid = io_debugEnqLsq_req_3_valid;
        //    mon_tr.io_debugEnqLsq_req_3_bits_robIdx_value = io_debugEnqLsq_req_3_bits_robIdx_value;
        //    mon_tr.io_debugEnqLsq_req_3_bits_lqIdx_value = io_debugEnqLsq_req_3_bits_lqIdx_value;
        //    mon_tr.io_debugEnqLsq_req_4_valid = io_debugEnqLsq_req_4_valid;
        //    mon_tr.io_debugEnqLsq_req_4_bits_robIdx_value = io_debugEnqLsq_req_4_bits_robIdx_value;
        //    mon_tr.io_debugEnqLsq_req_4_bits_lqIdx_value = io_debugEnqLsq_req_4_bits_lqIdx_value;
        //    mon_tr.io_debugEnqLsq_req_5_valid = io_debugEnqLsq_req_5_valid;
        //    mon_tr.io_debugEnqLsq_req_5_bits_robIdx_value = io_debugEnqLsq_req_5_bits_robIdx_value;
        //    mon_tr.io_debugEnqLsq_req_5_bits_lqIdx_value = io_debugEnqLsq_req_5_bits_lqIdx_value;
        //    mon_tr.io_debugInstrAddrTransType_bare = io_debugInstrAddrTransType_bare;
        //    mon_tr.io_debugInstrAddrTransType_sv39 = io_debugInstrAddrTransType_sv39;
        //    mon_tr.io_debugInstrAddrTransType_sv39x4 = io_debugInstrAddrTransType_sv39x4;
        //    mon_tr.io_debugInstrAddrTransType_sv48 = io_debugInstrAddrTransType_sv48;
        //    mon_tr.io_debugInstrAddrTransType_sv48x4 = io_debugInstrAddrTransType_sv48x4;
        //    mon_tr.io_storeDebugInfo_0_robidx_value = io_storeDebugInfo_0_robidx_value;
        //    mon_tr.io_storeDebugInfo_1_robidx_value = io_storeDebugInfo_1_robidx_value;

        //    mon_tr.channel_id = this.cfg.channel_id;
        //    mon_tr.unpack();
        //    this.mon_item_port.write(mon_tr);
        //end
    end
endtask:mon_data

`endif

