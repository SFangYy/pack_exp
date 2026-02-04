//=========================================================
//File name    : CSR_in_agent_interface.sv
//Author       : nanyunhao
//Module name  : CSR_in_agent_interface
//Discribution : CSR_in_agent_interface : signal interface
//Date         : 2026-01-22
//=========================================================
`ifndef CSR_IN_AGENT_INTERFACE__SV
`define CSR_IN_AGENT_INTERFACE__SV

`ifndef DEF_SETUP_TIME
    `define DEF_SETUP_TIME 1
`endif
`ifndef DEF_HOLD_TIME
    `define DEF_HOLD_TIME 1
`endif

interface CSR_in_agent_interface  (input bit clk,input bit rst_n);

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

    clocking drv_cb @(posedge clk);
        `ifdef INTERFACE_ADD_DELAY
            default input #`DEF_SETUP_TIME output #`DEF_HOLD_TIME;
        `endif
        output io_csr_intrBitSet;
        output io_csr_wfiEvent;
        output io_csr_criticalErrorState;
        output io_snpt_snptDeq;
        output io_snpt_useSnpt;
        output io_snpt_snptSelect;
        output io_snpt_flushVec_0;
        output io_snpt_flushVec_1;
        output io_snpt_flushVec_2;
        output io_snpt_flushVec_3;
        output io_wfi_safeFromMem;
        output io_wfi_safeFromFrontend;
        output io_wfi_enable;
        output io_fromVecExcpMod_busy;
        output io_readGPAMemData_gpaddr;
        output io_readGPAMemData_isForVSnonLeafPTE;
        output io_vstartIsZero;
        output io_debugEnqLsq_canAccept;
        output io_debugEnqLsq_needAlloc_0;
        output io_debugEnqLsq_needAlloc_1;
        output io_debugEnqLsq_needAlloc_2;
        output io_debugEnqLsq_needAlloc_3;
        output io_debugEnqLsq_needAlloc_4;
        output io_debugEnqLsq_needAlloc_5;
        output io_debugEnqLsq_req_0_valid;
        output io_debugEnqLsq_req_0_bits_robIdx_value;
        output io_debugEnqLsq_req_0_bits_lqIdx_value;
        output io_debugEnqLsq_req_1_valid;
        output io_debugEnqLsq_req_1_bits_robIdx_value;
        output io_debugEnqLsq_req_1_bits_lqIdx_value;
        output io_debugEnqLsq_req_2_valid;
        output io_debugEnqLsq_req_2_bits_robIdx_value;
        output io_debugEnqLsq_req_2_bits_lqIdx_value;
        output io_debugEnqLsq_req_3_valid;
        output io_debugEnqLsq_req_3_bits_robIdx_value;
        output io_debugEnqLsq_req_3_bits_lqIdx_value;
        output io_debugEnqLsq_req_4_valid;
        output io_debugEnqLsq_req_4_bits_robIdx_value;
        output io_debugEnqLsq_req_4_bits_lqIdx_value;
        output io_debugEnqLsq_req_5_valid;
        output io_debugEnqLsq_req_5_bits_robIdx_value;
        output io_debugEnqLsq_req_5_bits_lqIdx_value;
        output io_debugInstrAddrTransType_bare;
        output io_debugInstrAddrTransType_sv39;
        output io_debugInstrAddrTransType_sv39x4;
        output io_debugInstrAddrTransType_sv48;
        output io_debugInstrAddrTransType_sv48x4;
        output io_storeDebugInfo_0_robidx_value;
        output io_storeDebugInfo_1_robidx_value;

    endclocking:drv_cb

    clocking mon_cb @(posedge clk);
        `ifdef INTERFACE_ADD_DELAY
            default input #`DEF_SETUP_TIME output #`DEF_HOLD_TIME;
        `endif
        input  io_csr_intrBitSet;
        input  io_csr_wfiEvent;
        input  io_csr_criticalErrorState;
        input  io_snpt_snptDeq;
        input  io_snpt_useSnpt;
        input  io_snpt_snptSelect;
        input  io_snpt_flushVec_0;
        input  io_snpt_flushVec_1;
        input  io_snpt_flushVec_2;
        input  io_snpt_flushVec_3;
        input  io_wfi_safeFromMem;
        input  io_wfi_safeFromFrontend;
        input  io_wfi_enable;
        input  io_fromVecExcpMod_busy;
        input  io_readGPAMemData_gpaddr;
        input  io_readGPAMemData_isForVSnonLeafPTE;
        input  io_vstartIsZero;
        input  io_debugEnqLsq_canAccept;
        input  io_debugEnqLsq_needAlloc_0;
        input  io_debugEnqLsq_needAlloc_1;
        input  io_debugEnqLsq_needAlloc_2;
        input  io_debugEnqLsq_needAlloc_3;
        input  io_debugEnqLsq_needAlloc_4;
        input  io_debugEnqLsq_needAlloc_5;
        input  io_debugEnqLsq_req_0_valid;
        input  io_debugEnqLsq_req_0_bits_robIdx_value;
        input  io_debugEnqLsq_req_0_bits_lqIdx_value;
        input  io_debugEnqLsq_req_1_valid;
        input  io_debugEnqLsq_req_1_bits_robIdx_value;
        input  io_debugEnqLsq_req_1_bits_lqIdx_value;
        input  io_debugEnqLsq_req_2_valid;
        input  io_debugEnqLsq_req_2_bits_robIdx_value;
        input  io_debugEnqLsq_req_2_bits_lqIdx_value;
        input  io_debugEnqLsq_req_3_valid;
        input  io_debugEnqLsq_req_3_bits_robIdx_value;
        input  io_debugEnqLsq_req_3_bits_lqIdx_value;
        input  io_debugEnqLsq_req_4_valid;
        input  io_debugEnqLsq_req_4_bits_robIdx_value;
        input  io_debugEnqLsq_req_4_bits_lqIdx_value;
        input  io_debugEnqLsq_req_5_valid;
        input  io_debugEnqLsq_req_5_bits_robIdx_value;
        input  io_debugEnqLsq_req_5_bits_lqIdx_value;
        input  io_debugInstrAddrTransType_bare;
        input  io_debugInstrAddrTransType_sv39;
        input  io_debugInstrAddrTransType_sv39x4;
        input  io_debugInstrAddrTransType_sv48;
        input  io_debugInstrAddrTransType_sv48x4;
        input  io_storeDebugInfo_0_robidx_value;
        input  io_storeDebugInfo_1_robidx_value;

    endclocking:mon_cb

    modport drv_mp (clocking drv_cb);
    modport mon_mp (clocking mon_cb);

endinterface:CSR_in_agent_interface

`endif

