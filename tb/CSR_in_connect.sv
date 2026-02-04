//=========================================================
//File name    : CSR_in_connect.sv
//Author       : nanyunhao
//Module name  : CSR_in_connect
//Discribution : CSR_in_connect : CSR_in Interface connection macro
//Date         : 2026-01-22
//=========================================================
`ifndef CSR_IN_CONNECT__SV
`define CSR_IN_CONNECT__SV

`define ROB__CSR_IN_CONNECT(U_IF_NAME,AGENT_PATH,RTL_PATH) \
    CSR_in_agent_interface  U_IF_NAME (clk,tc_if.rst_n); \
    initial begin \
        uvm_config_db#(virtual CSR_in_agent_interface)::set(null,`"*AGENT_PATH*`", "vif", U_IF_NAME); \
    end \
    `ifdef ROB_UT \
    initial begin \
        force RTL_PATH.io_csr_intrBitSet = U_IF_NAME.io_csr_intrBitSet; \
        force RTL_PATH.io_csr_wfiEvent = U_IF_NAME.io_csr_wfiEvent; \
        force RTL_PATH.io_csr_criticalErrorState = U_IF_NAME.io_csr_criticalErrorState; \
        force RTL_PATH.io_snpt_snptDeq = U_IF_NAME.io_snpt_snptDeq; \
        force RTL_PATH.io_snpt_useSnpt = U_IF_NAME.io_snpt_useSnpt; \
        force RTL_PATH.io_snpt_snptSelect = U_IF_NAME.io_snpt_snptSelect; \
        force RTL_PATH.io_snpt_flushVec_0 = U_IF_NAME.io_snpt_flushVec_0; \
        force RTL_PATH.io_snpt_flushVec_1 = U_IF_NAME.io_snpt_flushVec_1; \
        force RTL_PATH.io_snpt_flushVec_2 = U_IF_NAME.io_snpt_flushVec_2; \
        force RTL_PATH.io_snpt_flushVec_3 = U_IF_NAME.io_snpt_flushVec_3; \
        force RTL_PATH.io_wfi_safeFromMem = U_IF_NAME.io_wfi_safeFromMem; \
        force RTL_PATH.io_wfi_safeFromFrontend = U_IF_NAME.io_wfi_safeFromFrontend; \
        force RTL_PATH.io_wfi_enable = U_IF_NAME.io_wfi_enable; \
        force RTL_PATH.io_fromVecExcpMod_busy = U_IF_NAME.io_fromVecExcpMod_busy; \
        force RTL_PATH.io_readGPAMemData_gpaddr = U_IF_NAME.io_readGPAMemData_gpaddr; \
        force RTL_PATH.io_readGPAMemData_isForVSnonLeafPTE = U_IF_NAME.io_readGPAMemData_isForVSnonLeafPTE; \
        force RTL_PATH.io_vstartIsZero = U_IF_NAME.io_vstartIsZero; \
        force RTL_PATH.io_debugEnqLsq_canAccept = U_IF_NAME.io_debugEnqLsq_canAccept; \
        force RTL_PATH.io_debugEnqLsq_needAlloc_0 = U_IF_NAME.io_debugEnqLsq_needAlloc_0; \
        force RTL_PATH.io_debugEnqLsq_needAlloc_1 = U_IF_NAME.io_debugEnqLsq_needAlloc_1; \
        force RTL_PATH.io_debugEnqLsq_needAlloc_2 = U_IF_NAME.io_debugEnqLsq_needAlloc_2; \
        force RTL_PATH.io_debugEnqLsq_needAlloc_3 = U_IF_NAME.io_debugEnqLsq_needAlloc_3; \
        force RTL_PATH.io_debugEnqLsq_needAlloc_4 = U_IF_NAME.io_debugEnqLsq_needAlloc_4; \
        force RTL_PATH.io_debugEnqLsq_needAlloc_5 = U_IF_NAME.io_debugEnqLsq_needAlloc_5; \
        force RTL_PATH.io_debugEnqLsq_req_0_valid = U_IF_NAME.io_debugEnqLsq_req_0_valid; \
        force RTL_PATH.io_debugEnqLsq_req_0_bits_robIdx_value = U_IF_NAME.io_debugEnqLsq_req_0_bits_robIdx_value; \
        force RTL_PATH.io_debugEnqLsq_req_0_bits_lqIdx_value = U_IF_NAME.io_debugEnqLsq_req_0_bits_lqIdx_value; \
        force RTL_PATH.io_debugEnqLsq_req_1_valid = U_IF_NAME.io_debugEnqLsq_req_1_valid; \
        force RTL_PATH.io_debugEnqLsq_req_1_bits_robIdx_value = U_IF_NAME.io_debugEnqLsq_req_1_bits_robIdx_value; \
        force RTL_PATH.io_debugEnqLsq_req_1_bits_lqIdx_value = U_IF_NAME.io_debugEnqLsq_req_1_bits_lqIdx_value; \
        force RTL_PATH.io_debugEnqLsq_req_2_valid = U_IF_NAME.io_debugEnqLsq_req_2_valid; \
        force RTL_PATH.io_debugEnqLsq_req_2_bits_robIdx_value = U_IF_NAME.io_debugEnqLsq_req_2_bits_robIdx_value; \
        force RTL_PATH.io_debugEnqLsq_req_2_bits_lqIdx_value = U_IF_NAME.io_debugEnqLsq_req_2_bits_lqIdx_value; \
        force RTL_PATH.io_debugEnqLsq_req_3_valid = U_IF_NAME.io_debugEnqLsq_req_3_valid; \
        force RTL_PATH.io_debugEnqLsq_req_3_bits_robIdx_value = U_IF_NAME.io_debugEnqLsq_req_3_bits_robIdx_value; \
        force RTL_PATH.io_debugEnqLsq_req_3_bits_lqIdx_value = U_IF_NAME.io_debugEnqLsq_req_3_bits_lqIdx_value; \
        force RTL_PATH.io_debugEnqLsq_req_4_valid = U_IF_NAME.io_debugEnqLsq_req_4_valid; \
        force RTL_PATH.io_debugEnqLsq_req_4_bits_robIdx_value = U_IF_NAME.io_debugEnqLsq_req_4_bits_robIdx_value; \
        force RTL_PATH.io_debugEnqLsq_req_4_bits_lqIdx_value = U_IF_NAME.io_debugEnqLsq_req_4_bits_lqIdx_value; \
        force RTL_PATH.io_debugEnqLsq_req_5_valid = U_IF_NAME.io_debugEnqLsq_req_5_valid; \
        force RTL_PATH.io_debugEnqLsq_req_5_bits_robIdx_value = U_IF_NAME.io_debugEnqLsq_req_5_bits_robIdx_value; \
        force RTL_PATH.io_debugEnqLsq_req_5_bits_lqIdx_value = U_IF_NAME.io_debugEnqLsq_req_5_bits_lqIdx_value; \
        force RTL_PATH.io_debugInstrAddrTransType_bare = U_IF_NAME.io_debugInstrAddrTransType_bare; \
        force RTL_PATH.io_debugInstrAddrTransType_sv39 = U_IF_NAME.io_debugInstrAddrTransType_sv39; \
        force RTL_PATH.io_debugInstrAddrTransType_sv39x4 = U_IF_NAME.io_debugInstrAddrTransType_sv39x4; \
        force RTL_PATH.io_debugInstrAddrTransType_sv48 = U_IF_NAME.io_debugInstrAddrTransType_sv48; \
        force RTL_PATH.io_debugInstrAddrTransType_sv48x4 = U_IF_NAME.io_debugInstrAddrTransType_sv48x4; \
        force RTL_PATH.io_storeDebugInfo_0_robidx_value = U_IF_NAME.io_storeDebugInfo_0_robidx_value; \
        force RTL_PATH.io_storeDebugInfo_1_robidx_value = U_IF_NAME.io_storeDebugInfo_1_robidx_value; \
    end \
    `else \
    initial begin \
        force U_IF_NAME.io_csr_intrBitSet = RTL_PATH.io_csr_intrBitSet; \
        force U_IF_NAME.io_csr_wfiEvent = RTL_PATH.io_csr_wfiEvent; \
        force U_IF_NAME.io_csr_criticalErrorState = RTL_PATH.io_csr_criticalErrorState; \
        force U_IF_NAME.io_snpt_snptDeq = RTL_PATH.io_snpt_snptDeq; \
        force U_IF_NAME.io_snpt_useSnpt = RTL_PATH.io_snpt_useSnpt; \
        force U_IF_NAME.io_snpt_snptSelect = RTL_PATH.io_snpt_snptSelect; \
        force U_IF_NAME.io_snpt_flushVec_0 = RTL_PATH.io_snpt_flushVec_0; \
        force U_IF_NAME.io_snpt_flushVec_1 = RTL_PATH.io_snpt_flushVec_1; \
        force U_IF_NAME.io_snpt_flushVec_2 = RTL_PATH.io_snpt_flushVec_2; \
        force U_IF_NAME.io_snpt_flushVec_3 = RTL_PATH.io_snpt_flushVec_3; \
        force U_IF_NAME.io_wfi_safeFromMem = RTL_PATH.io_wfi_safeFromMem; \
        force U_IF_NAME.io_wfi_safeFromFrontend = RTL_PATH.io_wfi_safeFromFrontend; \
        force U_IF_NAME.io_wfi_enable = RTL_PATH.io_wfi_enable; \
        force U_IF_NAME.io_fromVecExcpMod_busy = RTL_PATH.io_fromVecExcpMod_busy; \
        force U_IF_NAME.io_readGPAMemData_gpaddr = RTL_PATH.io_readGPAMemData_gpaddr; \
        force U_IF_NAME.io_readGPAMemData_isForVSnonLeafPTE = RTL_PATH.io_readGPAMemData_isForVSnonLeafPTE; \
        force U_IF_NAME.io_vstartIsZero = RTL_PATH.io_vstartIsZero; \
        force U_IF_NAME.io_debugEnqLsq_canAccept = RTL_PATH.io_debugEnqLsq_canAccept; \
        force U_IF_NAME.io_debugEnqLsq_needAlloc_0 = RTL_PATH.io_debugEnqLsq_needAlloc_0; \
        force U_IF_NAME.io_debugEnqLsq_needAlloc_1 = RTL_PATH.io_debugEnqLsq_needAlloc_1; \
        force U_IF_NAME.io_debugEnqLsq_needAlloc_2 = RTL_PATH.io_debugEnqLsq_needAlloc_2; \
        force U_IF_NAME.io_debugEnqLsq_needAlloc_3 = RTL_PATH.io_debugEnqLsq_needAlloc_3; \
        force U_IF_NAME.io_debugEnqLsq_needAlloc_4 = RTL_PATH.io_debugEnqLsq_needAlloc_4; \
        force U_IF_NAME.io_debugEnqLsq_needAlloc_5 = RTL_PATH.io_debugEnqLsq_needAlloc_5; \
        force U_IF_NAME.io_debugEnqLsq_req_0_valid = RTL_PATH.io_debugEnqLsq_req_0_valid; \
        force U_IF_NAME.io_debugEnqLsq_req_0_bits_robIdx_value = RTL_PATH.io_debugEnqLsq_req_0_bits_robIdx_value; \
        force U_IF_NAME.io_debugEnqLsq_req_0_bits_lqIdx_value = RTL_PATH.io_debugEnqLsq_req_0_bits_lqIdx_value; \
        force U_IF_NAME.io_debugEnqLsq_req_1_valid = RTL_PATH.io_debugEnqLsq_req_1_valid; \
        force U_IF_NAME.io_debugEnqLsq_req_1_bits_robIdx_value = RTL_PATH.io_debugEnqLsq_req_1_bits_robIdx_value; \
        force U_IF_NAME.io_debugEnqLsq_req_1_bits_lqIdx_value = RTL_PATH.io_debugEnqLsq_req_1_bits_lqIdx_value; \
        force U_IF_NAME.io_debugEnqLsq_req_2_valid = RTL_PATH.io_debugEnqLsq_req_2_valid; \
        force U_IF_NAME.io_debugEnqLsq_req_2_bits_robIdx_value = RTL_PATH.io_debugEnqLsq_req_2_bits_robIdx_value; \
        force U_IF_NAME.io_debugEnqLsq_req_2_bits_lqIdx_value = RTL_PATH.io_debugEnqLsq_req_2_bits_lqIdx_value; \
        force U_IF_NAME.io_debugEnqLsq_req_3_valid = RTL_PATH.io_debugEnqLsq_req_3_valid; \
        force U_IF_NAME.io_debugEnqLsq_req_3_bits_robIdx_value = RTL_PATH.io_debugEnqLsq_req_3_bits_robIdx_value; \
        force U_IF_NAME.io_debugEnqLsq_req_3_bits_lqIdx_value = RTL_PATH.io_debugEnqLsq_req_3_bits_lqIdx_value; \
        force U_IF_NAME.io_debugEnqLsq_req_4_valid = RTL_PATH.io_debugEnqLsq_req_4_valid; \
        force U_IF_NAME.io_debugEnqLsq_req_4_bits_robIdx_value = RTL_PATH.io_debugEnqLsq_req_4_bits_robIdx_value; \
        force U_IF_NAME.io_debugEnqLsq_req_4_bits_lqIdx_value = RTL_PATH.io_debugEnqLsq_req_4_bits_lqIdx_value; \
        force U_IF_NAME.io_debugEnqLsq_req_5_valid = RTL_PATH.io_debugEnqLsq_req_5_valid; \
        force U_IF_NAME.io_debugEnqLsq_req_5_bits_robIdx_value = RTL_PATH.io_debugEnqLsq_req_5_bits_robIdx_value; \
        force U_IF_NAME.io_debugEnqLsq_req_5_bits_lqIdx_value = RTL_PATH.io_debugEnqLsq_req_5_bits_lqIdx_value; \
        force U_IF_NAME.io_debugInstrAddrTransType_bare = RTL_PATH.io_debugInstrAddrTransType_bare; \
        force U_IF_NAME.io_debugInstrAddrTransType_sv39 = RTL_PATH.io_debugInstrAddrTransType_sv39; \
        force U_IF_NAME.io_debugInstrAddrTransType_sv39x4 = RTL_PATH.io_debugInstrAddrTransType_sv39x4; \
        force U_IF_NAME.io_debugInstrAddrTransType_sv48 = RTL_PATH.io_debugInstrAddrTransType_sv48; \
        force U_IF_NAME.io_debugInstrAddrTransType_sv48x4 = RTL_PATH.io_debugInstrAddrTransType_sv48x4; \
        force U_IF_NAME.io_storeDebugInfo_0_robidx_value = RTL_PATH.io_storeDebugInfo_0_robidx_value; \
        force U_IF_NAME.io_storeDebugInfo_1_robidx_value = RTL_PATH.io_storeDebugInfo_1_robidx_value; \
    end \
    `endif

`endif
