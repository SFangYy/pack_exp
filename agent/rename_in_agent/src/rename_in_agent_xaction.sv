//=========================================================
//File name    : rename_in_agent_xaction.sv
//Author       : nanyunhao
//Module name  : rename_in_agent_xaction
//Discribution : rename_in_agent_xaction : agent transaction
//Date         : 2026-01-22
//=========================================================
`ifndef RENAME_IN_AGENT_XACTION__SV
`define RENAME_IN_AGENT_XACTION__SV

class rename_in_agent_xaction  extends tcnt_data_base;
    rand bit         clock             ;
    rand bit         reset             ;
    rand bit [5:0]   io_hartId         ;
    rand bit         io_enq_req_0_valid;
    rand bit [31:0]  io_enq_req_0_bits_instr;
    rand bit [49:0]  io_enq_req_0_bits_pc;
    rand bit         io_enq_req_0_bits_exceptionVec_0;
    rand bit         io_enq_req_0_bits_exceptionVec_1;
    rand bit         io_enq_req_0_bits_exceptionVec_2;
    rand bit         io_enq_req_0_bits_exceptionVec_3;
    rand bit         io_enq_req_0_bits_exceptionVec_12;
    rand bit         io_enq_req_0_bits_exceptionVec_20;
    rand bit         io_enq_req_0_bits_exceptionVec_22;
    rand bit         io_enq_req_0_bits_isFetchMalAddr;
    rand bit         io_enq_req_0_bits_hasException;
    rand bit [3:0]   io_enq_req_0_bits_trigger;
    rand bit         io_enq_req_0_bits_preDecodeInfo_isRVC;
    rand bit         io_enq_req_0_bits_crossPageIPFFix;
    rand bit         io_enq_req_0_bits_ftqPtr_flag;
    rand bit [5:0]   io_enq_req_0_bits_ftqPtr_value;
    rand bit [3:0]   io_enq_req_0_bits_ftqOffset;
    rand bit [5:0]   io_enq_req_0_bits_ldest;
    rand bit [34:0]  io_enq_req_0_bits_fuType;
    rand bit [8:0]   io_enq_req_0_bits_fuOpType;
    rand bit         io_enq_req_0_bits_rfWen;
    rand bit         io_enq_req_0_bits_fpWen;
    rand bit         io_enq_req_0_bits_vecWen;
    rand bit         io_enq_req_0_bits_v0Wen;
    rand bit         io_enq_req_0_bits_vlWen;
    rand bit         io_enq_req_0_bits_isXSTrap;
    rand bit         io_enq_req_0_bits_waitForward;
    rand bit         io_enq_req_0_bits_blockBackward;
    rand bit         io_enq_req_0_bits_flushPipe;
    rand bit         io_enq_req_0_bits_vpu_vill;
    rand bit         io_enq_req_0_bits_vpu_vma;
    rand bit         io_enq_req_0_bits_vpu_vta;
    rand bit [1:0]   io_enq_req_0_bits_vpu_vsew;
    rand bit [2:0]   io_enq_req_0_bits_vpu_vlmul;
    rand bit         io_enq_req_0_bits_vpu_specVill;
    rand bit         io_enq_req_0_bits_vpu_specVma;
    rand bit         io_enq_req_0_bits_vpu_specVta;
    rand bit [1:0]   io_enq_req_0_bits_vpu_specVsew;
    rand bit [2:0]   io_enq_req_0_bits_vpu_specVlmul;
    rand bit         io_enq_req_0_bits_vlsInstr;
    rand bit         io_enq_req_0_bits_wfflags;
    rand bit         io_enq_req_0_bits_isMove;
    rand bit         io_enq_req_0_bits_isVset;
    rand bit         io_enq_req_0_bits_firstUop;
    rand bit         io_enq_req_0_bits_lastUop;
    rand bit [6:0]   io_enq_req_0_bits_numWB;
    rand bit [2:0]   io_enq_req_0_bits_commitType;
    rand bit [7:0]   io_enq_req_0_bits_pdest;
    rand bit         io_enq_req_0_bits_robIdx_flag;
    rand bit [7:0]   io_enq_req_0_bits_robIdx_value;
    rand bit [2:0]   io_enq_req_0_bits_instrSize;
    rand bit         io_enq_req_0_bits_dirtyFs;
    rand bit         io_enq_req_0_bits_dirtyVs;
    rand bit [3:0]   io_enq_req_0_bits_traceBlockInPipe_itype;
    rand bit [3:0]   io_enq_req_0_bits_traceBlockInPipe_iretire;
    rand bit         io_enq_req_0_bits_traceBlockInPipe_ilastsize;
    rand bit         io_enq_req_0_bits_eliminatedMove;
    rand bit         io_enq_req_0_bits_snapshot;
    rand bit [6:0]   io_enq_req_0_bits_lqIdx_value;
    rand bit [5:0]   io_enq_req_0_bits_sqIdx_value;
    rand bit         io_enq_req_0_bits_singleStep;
    rand bit         io_enq_req_0_bits_debug_sim_trig;
    rand bit         io_enq_req_1_valid;
    rand bit [31:0]  io_enq_req_1_bits_instr;
    rand bit [49:0]  io_enq_req_1_bits_pc;
    rand bit         io_enq_req_1_bits_exceptionVec_0;
    rand bit         io_enq_req_1_bits_exceptionVec_1;
    rand bit         io_enq_req_1_bits_exceptionVec_2;
    rand bit         io_enq_req_1_bits_exceptionVec_3;
    rand bit         io_enq_req_1_bits_exceptionVec_12;
    rand bit         io_enq_req_1_bits_exceptionVec_20;
    rand bit         io_enq_req_1_bits_exceptionVec_22;
    rand bit         io_enq_req_1_bits_isFetchMalAddr;
    rand bit         io_enq_req_1_bits_hasException;
    rand bit [3:0]   io_enq_req_1_bits_trigger;
    rand bit         io_enq_req_1_bits_preDecodeInfo_isRVC;
    rand bit         io_enq_req_1_bits_crossPageIPFFix;
    rand bit         io_enq_req_1_bits_ftqPtr_flag;
    rand bit [5:0]   io_enq_req_1_bits_ftqPtr_value;
    rand bit [3:0]   io_enq_req_1_bits_ftqOffset;
    rand bit [5:0]   io_enq_req_1_bits_ldest;
    rand bit [34:0]  io_enq_req_1_bits_fuType;
    rand bit [8:0]   io_enq_req_1_bits_fuOpType;
    rand bit         io_enq_req_1_bits_rfWen;
    rand bit         io_enq_req_1_bits_fpWen;
    rand bit         io_enq_req_1_bits_vecWen;
    rand bit         io_enq_req_1_bits_v0Wen;
    rand bit         io_enq_req_1_bits_vlWen;
    rand bit         io_enq_req_1_bits_isXSTrap;
    rand bit         io_enq_req_1_bits_waitForward;
    rand bit         io_enq_req_1_bits_blockBackward;
    rand bit         io_enq_req_1_bits_flushPipe;
    rand bit         io_enq_req_1_bits_vpu_vill;
    rand bit         io_enq_req_1_bits_vpu_vma;
    rand bit         io_enq_req_1_bits_vpu_vta;
    rand bit [1:0]   io_enq_req_1_bits_vpu_vsew;
    rand bit [2:0]   io_enq_req_1_bits_vpu_vlmul;
    rand bit         io_enq_req_1_bits_vpu_specVill;
    rand bit         io_enq_req_1_bits_vpu_specVma;
    rand bit         io_enq_req_1_bits_vpu_specVta;
    rand bit [1:0]   io_enq_req_1_bits_vpu_specVsew;
    rand bit [2:0]   io_enq_req_1_bits_vpu_specVlmul;
    rand bit         io_enq_req_1_bits_vlsInstr;
    rand bit         io_enq_req_1_bits_wfflags;
    rand bit         io_enq_req_1_bits_isMove;
    rand bit         io_enq_req_1_bits_isVset;
    rand bit         io_enq_req_1_bits_firstUop;
    rand bit         io_enq_req_1_bits_lastUop;
    rand bit [6:0]   io_enq_req_1_bits_numWB;
    rand bit [2:0]   io_enq_req_1_bits_commitType;
    rand bit [7:0]   io_enq_req_1_bits_pdest;
    rand bit         io_enq_req_1_bits_robIdx_flag;
    rand bit [7:0]   io_enq_req_1_bits_robIdx_value;
    rand bit [2:0]   io_enq_req_1_bits_instrSize;
    rand bit         io_enq_req_1_bits_dirtyFs;
    rand bit         io_enq_req_1_bits_dirtyVs;
    rand bit [3:0]   io_enq_req_1_bits_traceBlockInPipe_itype;
    rand bit [3:0]   io_enq_req_1_bits_traceBlockInPipe_iretire;
    rand bit         io_enq_req_1_bits_traceBlockInPipe_ilastsize;
    rand bit         io_enq_req_1_bits_eliminatedMove;
    rand bit         io_enq_req_1_bits_snapshot;
    rand bit [6:0]   io_enq_req_1_bits_lqIdx_value;
    rand bit [5:0]   io_enq_req_1_bits_sqIdx_value;
    rand bit         io_enq_req_1_bits_singleStep;
    rand bit         io_enq_req_1_bits_debug_sim_trig;
    rand bit         io_enq_req_2_valid;
    rand bit [31:0]  io_enq_req_2_bits_instr;
    rand bit [49:0]  io_enq_req_2_bits_pc;
    rand bit         io_enq_req_2_bits_exceptionVec_0;
    rand bit         io_enq_req_2_bits_exceptionVec_1;
    rand bit         io_enq_req_2_bits_exceptionVec_2;
    rand bit         io_enq_req_2_bits_exceptionVec_3;
    rand bit         io_enq_req_2_bits_exceptionVec_12;
    rand bit         io_enq_req_2_bits_exceptionVec_20;
    rand bit         io_enq_req_2_bits_exceptionVec_22;
    rand bit         io_enq_req_2_bits_isFetchMalAddr;
    rand bit         io_enq_req_2_bits_hasException;
    rand bit [3:0]   io_enq_req_2_bits_trigger;
    rand bit         io_enq_req_2_bits_preDecodeInfo_isRVC;
    rand bit         io_enq_req_2_bits_crossPageIPFFix;
    rand bit         io_enq_req_2_bits_ftqPtr_flag;
    rand bit [5:0]   io_enq_req_2_bits_ftqPtr_value;
    rand bit [3:0]   io_enq_req_2_bits_ftqOffset;
    rand bit [5:0]   io_enq_req_2_bits_ldest;
    rand bit [34:0]  io_enq_req_2_bits_fuType;
    rand bit [8:0]   io_enq_req_2_bits_fuOpType;
    rand bit         io_enq_req_2_bits_rfWen;
    rand bit         io_enq_req_2_bits_fpWen;
    rand bit         io_enq_req_2_bits_vecWen;
    rand bit         io_enq_req_2_bits_v0Wen;
    rand bit         io_enq_req_2_bits_vlWen;
    rand bit         io_enq_req_2_bits_isXSTrap;
    rand bit         io_enq_req_2_bits_waitForward;
    rand bit         io_enq_req_2_bits_blockBackward;
    rand bit         io_enq_req_2_bits_flushPipe;
    rand bit         io_enq_req_2_bits_vpu_vill;
    rand bit         io_enq_req_2_bits_vpu_vma;
    rand bit         io_enq_req_2_bits_vpu_vta;
    rand bit [1:0]   io_enq_req_2_bits_vpu_vsew;
    rand bit [2:0]   io_enq_req_2_bits_vpu_vlmul;
    rand bit         io_enq_req_2_bits_vpu_specVill;
    rand bit         io_enq_req_2_bits_vpu_specVma;
    rand bit         io_enq_req_2_bits_vpu_specVta;
    rand bit [1:0]   io_enq_req_2_bits_vpu_specVsew;
    rand bit [2:0]   io_enq_req_2_bits_vpu_specVlmul;
    rand bit         io_enq_req_2_bits_vlsInstr;
    rand bit         io_enq_req_2_bits_wfflags;
    rand bit         io_enq_req_2_bits_isMove;
    rand bit         io_enq_req_2_bits_isVset;
    rand bit         io_enq_req_2_bits_firstUop;
    rand bit         io_enq_req_2_bits_lastUop;
    rand bit [6:0]   io_enq_req_2_bits_numWB;
    rand bit [2:0]   io_enq_req_2_bits_commitType;
    rand bit [7:0]   io_enq_req_2_bits_pdest;
    rand bit         io_enq_req_2_bits_robIdx_flag;
    rand bit [7:0]   io_enq_req_2_bits_robIdx_value;
    rand bit [2:0]   io_enq_req_2_bits_instrSize;
    rand bit         io_enq_req_2_bits_dirtyFs;
    rand bit         io_enq_req_2_bits_dirtyVs;
    rand bit [3:0]   io_enq_req_2_bits_traceBlockInPipe_itype;
    rand bit [3:0]   io_enq_req_2_bits_traceBlockInPipe_iretire;
    rand bit         io_enq_req_2_bits_traceBlockInPipe_ilastsize;
    rand bit         io_enq_req_2_bits_eliminatedMove;
    rand bit         io_enq_req_2_bits_snapshot;
    rand bit [6:0]   io_enq_req_2_bits_lqIdx_value;
    rand bit [5:0]   io_enq_req_2_bits_sqIdx_value;
    rand bit         io_enq_req_2_bits_singleStep;
    rand bit         io_enq_req_2_bits_debug_sim_trig;
    rand bit         io_enq_req_3_valid;
    rand bit [31:0]  io_enq_req_3_bits_instr;
    rand bit [49:0]  io_enq_req_3_bits_pc;
    rand bit         io_enq_req_3_bits_exceptionVec_0;
    rand bit         io_enq_req_3_bits_exceptionVec_1;
    rand bit         io_enq_req_3_bits_exceptionVec_2;
    rand bit         io_enq_req_3_bits_exceptionVec_3;
    rand bit         io_enq_req_3_bits_exceptionVec_12;
    rand bit         io_enq_req_3_bits_exceptionVec_20;
    rand bit         io_enq_req_3_bits_exceptionVec_22;
    rand bit         io_enq_req_3_bits_isFetchMalAddr;
    rand bit         io_enq_req_3_bits_hasException;
    rand bit [3:0]   io_enq_req_3_bits_trigger;
    rand bit         io_enq_req_3_bits_preDecodeInfo_isRVC;
    rand bit         io_enq_req_3_bits_crossPageIPFFix;
    rand bit         io_enq_req_3_bits_ftqPtr_flag;
    rand bit [5:0]   io_enq_req_3_bits_ftqPtr_value;
    rand bit [3:0]   io_enq_req_3_bits_ftqOffset;
    rand bit [5:0]   io_enq_req_3_bits_ldest;
    rand bit [34:0]  io_enq_req_3_bits_fuType;
    rand bit [8:0]   io_enq_req_3_bits_fuOpType;
    rand bit         io_enq_req_3_bits_rfWen;
    rand bit         io_enq_req_3_bits_fpWen;
    rand bit         io_enq_req_3_bits_vecWen;
    rand bit         io_enq_req_3_bits_v0Wen;
    rand bit         io_enq_req_3_bits_vlWen;
    rand bit         io_enq_req_3_bits_isXSTrap;
    rand bit         io_enq_req_3_bits_waitForward;
    rand bit         io_enq_req_3_bits_blockBackward;
    rand bit         io_enq_req_3_bits_flushPipe;
    rand bit         io_enq_req_3_bits_vpu_vill;
    rand bit         io_enq_req_3_bits_vpu_vma;
    rand bit         io_enq_req_3_bits_vpu_vta;
    rand bit [1:0]   io_enq_req_3_bits_vpu_vsew;
    rand bit [2:0]   io_enq_req_3_bits_vpu_vlmul;
    rand bit         io_enq_req_3_bits_vpu_specVill;
    rand bit         io_enq_req_3_bits_vpu_specVma;
    rand bit         io_enq_req_3_bits_vpu_specVta;
    rand bit [1:0]   io_enq_req_3_bits_vpu_specVsew;
    rand bit [2:0]   io_enq_req_3_bits_vpu_specVlmul;
    rand bit         io_enq_req_3_bits_vlsInstr;
    rand bit         io_enq_req_3_bits_wfflags;
    rand bit         io_enq_req_3_bits_isMove;
    rand bit         io_enq_req_3_bits_isVset;
    rand bit         io_enq_req_3_bits_firstUop;
    rand bit         io_enq_req_3_bits_lastUop;
    rand bit [6:0]   io_enq_req_3_bits_numWB;
    rand bit [2:0]   io_enq_req_3_bits_commitType;
    rand bit [7:0]   io_enq_req_3_bits_pdest;
    rand bit         io_enq_req_3_bits_robIdx_flag;
    rand bit [7:0]   io_enq_req_3_bits_robIdx_value;
    rand bit [2:0]   io_enq_req_3_bits_instrSize;
    rand bit         io_enq_req_3_bits_dirtyFs;
    rand bit         io_enq_req_3_bits_dirtyVs;
    rand bit [3:0]   io_enq_req_3_bits_traceBlockInPipe_itype;
    rand bit [3:0]   io_enq_req_3_bits_traceBlockInPipe_iretire;
    rand bit         io_enq_req_3_bits_traceBlockInPipe_ilastsize;
    rand bit         io_enq_req_3_bits_eliminatedMove;
    rand bit         io_enq_req_3_bits_snapshot;
    rand bit [6:0]   io_enq_req_3_bits_lqIdx_value;
    rand bit [5:0]   io_enq_req_3_bits_sqIdx_value;
    rand bit         io_enq_req_3_bits_singleStep;
    rand bit         io_enq_req_3_bits_debug_sim_trig;
    rand bit         io_enq_req_4_valid;
    rand bit [31:0]  io_enq_req_4_bits_instr;
    rand bit [49:0]  io_enq_req_4_bits_pc;
    rand bit         io_enq_req_4_bits_exceptionVec_0;
    rand bit         io_enq_req_4_bits_exceptionVec_1;
    rand bit         io_enq_req_4_bits_exceptionVec_2;
    rand bit         io_enq_req_4_bits_exceptionVec_3;
    rand bit         io_enq_req_4_bits_exceptionVec_12;
    rand bit         io_enq_req_4_bits_exceptionVec_20;
    rand bit         io_enq_req_4_bits_exceptionVec_22;
    rand bit         io_enq_req_4_bits_isFetchMalAddr;
    rand bit         io_enq_req_4_bits_hasException;
    rand bit [3:0]   io_enq_req_4_bits_trigger;
    rand bit         io_enq_req_4_bits_preDecodeInfo_isRVC;
    rand bit         io_enq_req_4_bits_crossPageIPFFix;
    rand bit         io_enq_req_4_bits_ftqPtr_flag;
    rand bit [5:0]   io_enq_req_4_bits_ftqPtr_value;
    rand bit [3:0]   io_enq_req_4_bits_ftqOffset;
    rand bit [5:0]   io_enq_req_4_bits_ldest;
    rand bit [34:0]  io_enq_req_4_bits_fuType;
    rand bit [8:0]   io_enq_req_4_bits_fuOpType;
    rand bit         io_enq_req_4_bits_rfWen;
    rand bit         io_enq_req_4_bits_fpWen;
    rand bit         io_enq_req_4_bits_vecWen;
    rand bit         io_enq_req_4_bits_v0Wen;
    rand bit         io_enq_req_4_bits_vlWen;
    rand bit         io_enq_req_4_bits_isXSTrap;
    rand bit         io_enq_req_4_bits_waitForward;
    rand bit         io_enq_req_4_bits_blockBackward;
    rand bit         io_enq_req_4_bits_flushPipe;
    rand bit         io_enq_req_4_bits_vpu_vill;
    rand bit         io_enq_req_4_bits_vpu_vma;
    rand bit         io_enq_req_4_bits_vpu_vta;
    rand bit [1:0]   io_enq_req_4_bits_vpu_vsew;
    rand bit [2:0]   io_enq_req_4_bits_vpu_vlmul;
    rand bit         io_enq_req_4_bits_vpu_specVill;
    rand bit         io_enq_req_4_bits_vpu_specVma;
    rand bit         io_enq_req_4_bits_vpu_specVta;
    rand bit [1:0]   io_enq_req_4_bits_vpu_specVsew;
    rand bit [2:0]   io_enq_req_4_bits_vpu_specVlmul;
    rand bit         io_enq_req_4_bits_vlsInstr;
    rand bit         io_enq_req_4_bits_wfflags;
    rand bit         io_enq_req_4_bits_isMove;
    rand bit         io_enq_req_4_bits_isVset;
    rand bit         io_enq_req_4_bits_firstUop;
    rand bit         io_enq_req_4_bits_lastUop;
    rand bit [6:0]   io_enq_req_4_bits_numWB;
    rand bit [2:0]   io_enq_req_4_bits_commitType;
    rand bit [7:0]   io_enq_req_4_bits_pdest;
    rand bit         io_enq_req_4_bits_robIdx_flag;
    rand bit [7:0]   io_enq_req_4_bits_robIdx_value;
    rand bit [2:0]   io_enq_req_4_bits_instrSize;
    rand bit         io_enq_req_4_bits_dirtyFs;
    rand bit         io_enq_req_4_bits_dirtyVs;
    rand bit [3:0]   io_enq_req_4_bits_traceBlockInPipe_itype;
    rand bit [3:0]   io_enq_req_4_bits_traceBlockInPipe_iretire;
    rand bit         io_enq_req_4_bits_traceBlockInPipe_ilastsize;
    rand bit         io_enq_req_4_bits_eliminatedMove;
    rand bit         io_enq_req_4_bits_snapshot;
    rand bit [6:0]   io_enq_req_4_bits_lqIdx_value;
    rand bit [5:0]   io_enq_req_4_bits_sqIdx_value;
    rand bit         io_enq_req_4_bits_singleStep;
    rand bit         io_enq_req_4_bits_debug_sim_trig;
    rand bit         io_enq_req_5_valid;
    rand bit [31:0]  io_enq_req_5_bits_instr;
    rand bit [49:0]  io_enq_req_5_bits_pc;
    rand bit         io_enq_req_5_bits_exceptionVec_0;
    rand bit         io_enq_req_5_bits_exceptionVec_1;
    rand bit         io_enq_req_5_bits_exceptionVec_2;
    rand bit         io_enq_req_5_bits_exceptionVec_3;
    rand bit         io_enq_req_5_bits_exceptionVec_12;
    rand bit         io_enq_req_5_bits_exceptionVec_20;
    rand bit         io_enq_req_5_bits_exceptionVec_22;
    rand bit         io_enq_req_5_bits_isFetchMalAddr;
    rand bit         io_enq_req_5_bits_hasException;
    rand bit [3:0]   io_enq_req_5_bits_trigger;
    rand bit         io_enq_req_5_bits_preDecodeInfo_isRVC;
    rand bit         io_enq_req_5_bits_crossPageIPFFix;
    rand bit         io_enq_req_5_bits_ftqPtr_flag;
    rand bit [5:0]   io_enq_req_5_bits_ftqPtr_value;
    rand bit [3:0]   io_enq_req_5_bits_ftqOffset;
    rand bit [5:0]   io_enq_req_5_bits_ldest;
    rand bit [34:0]  io_enq_req_5_bits_fuType;
    rand bit [8:0]   io_enq_req_5_bits_fuOpType;
    rand bit         io_enq_req_5_bits_rfWen;
    rand bit         io_enq_req_5_bits_fpWen;
    rand bit         io_enq_req_5_bits_vecWen;
    rand bit         io_enq_req_5_bits_v0Wen;
    rand bit         io_enq_req_5_bits_vlWen;
    rand bit         io_enq_req_5_bits_isXSTrap;
    rand bit         io_enq_req_5_bits_waitForward;
    rand bit         io_enq_req_5_bits_blockBackward;
    rand bit         io_enq_req_5_bits_flushPipe;
    rand bit         io_enq_req_5_bits_vpu_vill;
    rand bit         io_enq_req_5_bits_vpu_vma;
    rand bit         io_enq_req_5_bits_vpu_vta;
    rand bit [1:0]   io_enq_req_5_bits_vpu_vsew;
    rand bit [2:0]   io_enq_req_5_bits_vpu_vlmul;
    rand bit         io_enq_req_5_bits_vpu_specVill;
    rand bit         io_enq_req_5_bits_vpu_specVma;
    rand bit         io_enq_req_5_bits_vpu_specVta;
    rand bit [1:0]   io_enq_req_5_bits_vpu_specVsew;
    rand bit [2:0]   io_enq_req_5_bits_vpu_specVlmul;
    rand bit         io_enq_req_5_bits_vlsInstr;
    rand bit         io_enq_req_5_bits_wfflags;
    rand bit         io_enq_req_5_bits_isMove;
    rand bit         io_enq_req_5_bits_isVset;
    rand bit         io_enq_req_5_bits_firstUop;
    rand bit         io_enq_req_5_bits_lastUop;
    rand bit [6:0]   io_enq_req_5_bits_numWB;
    rand bit [2:0]   io_enq_req_5_bits_commitType;
    rand bit [7:0]   io_enq_req_5_bits_pdest;
    rand bit         io_enq_req_5_bits_robIdx_flag;
    rand bit [7:0]   io_enq_req_5_bits_robIdx_value;
    rand bit [2:0]   io_enq_req_5_bits_instrSize;
    rand bit         io_enq_req_5_bits_dirtyFs;
    rand bit         io_enq_req_5_bits_dirtyVs;
    rand bit [3:0]   io_enq_req_5_bits_traceBlockInPipe_itype;
    rand bit [3:0]   io_enq_req_5_bits_traceBlockInPipe_iretire;
    rand bit         io_enq_req_5_bits_traceBlockInPipe_ilastsize;
    rand bit         io_enq_req_5_bits_eliminatedMove;
    rand bit         io_enq_req_5_bits_snapshot;
    rand bit [6:0]   io_enq_req_5_bits_lqIdx_value;
    rand bit [5:0]   io_enq_req_5_bits_sqIdx_value;
    rand bit         io_enq_req_5_bits_singleStep;
    rand bit         io_enq_req_5_bits_debug_sim_trig;

    extern constraint default_clock_cons;
    extern constraint default_reset_cons;
    extern constraint default_io_hartId_cons;
    extern constraint default_io_enq_req_0_valid_cons;
    extern constraint default_io_enq_req_0_bits_instr_cons;
    extern constraint default_io_enq_req_0_bits_pc_cons;
    extern constraint default_io_enq_req_0_bits_exceptionVec_0_cons;
    extern constraint default_io_enq_req_0_bits_exceptionVec_1_cons;
    extern constraint default_io_enq_req_0_bits_exceptionVec_2_cons;
    extern constraint default_io_enq_req_0_bits_exceptionVec_3_cons;
    extern constraint default_io_enq_req_0_bits_exceptionVec_12_cons;
    extern constraint default_io_enq_req_0_bits_exceptionVec_20_cons;
    extern constraint default_io_enq_req_0_bits_exceptionVec_22_cons;
    extern constraint default_io_enq_req_0_bits_isFetchMalAddr_cons;
    extern constraint default_io_enq_req_0_bits_hasException_cons;
    extern constraint default_io_enq_req_0_bits_trigger_cons;
    extern constraint default_io_enq_req_0_bits_preDecodeInfo_isRVC_cons;
    extern constraint default_io_enq_req_0_bits_crossPageIPFFix_cons;
    extern constraint default_io_enq_req_0_bits_ftqPtr_flag_cons;
    extern constraint default_io_enq_req_0_bits_ftqPtr_value_cons;
    extern constraint default_io_enq_req_0_bits_ftqOffset_cons;
    extern constraint default_io_enq_req_0_bits_ldest_cons;
    extern constraint default_io_enq_req_0_bits_fuType_cons;
    extern constraint default_io_enq_req_0_bits_fuOpType_cons;
    extern constraint default_io_enq_req_0_bits_rfWen_cons;
    extern constraint default_io_enq_req_0_bits_fpWen_cons;
    extern constraint default_io_enq_req_0_bits_vecWen_cons;
    extern constraint default_io_enq_req_0_bits_v0Wen_cons;
    extern constraint default_io_enq_req_0_bits_vlWen_cons;
    extern constraint default_io_enq_req_0_bits_isXSTrap_cons;
    extern constraint default_io_enq_req_0_bits_waitForward_cons;
    extern constraint default_io_enq_req_0_bits_blockBackward_cons;
    extern constraint default_io_enq_req_0_bits_flushPipe_cons;
    extern constraint default_io_enq_req_0_bits_vpu_vill_cons;
    extern constraint default_io_enq_req_0_bits_vpu_vma_cons;
    extern constraint default_io_enq_req_0_bits_vpu_vta_cons;
    extern constraint default_io_enq_req_0_bits_vpu_vsew_cons;
    extern constraint default_io_enq_req_0_bits_vpu_vlmul_cons;
    extern constraint default_io_enq_req_0_bits_vpu_specVill_cons;
    extern constraint default_io_enq_req_0_bits_vpu_specVma_cons;
    extern constraint default_io_enq_req_0_bits_vpu_specVta_cons;
    extern constraint default_io_enq_req_0_bits_vpu_specVsew_cons;
    extern constraint default_io_enq_req_0_bits_vpu_specVlmul_cons;
    extern constraint default_io_enq_req_0_bits_vlsInstr_cons;
    extern constraint default_io_enq_req_0_bits_wfflags_cons;
    extern constraint default_io_enq_req_0_bits_isMove_cons;
    extern constraint default_io_enq_req_0_bits_isVset_cons;
    extern constraint default_io_enq_req_0_bits_firstUop_cons;
    extern constraint default_io_enq_req_0_bits_lastUop_cons;
    extern constraint default_io_enq_req_0_bits_numWB_cons;
    extern constraint default_io_enq_req_0_bits_commitType_cons;
    extern constraint default_io_enq_req_0_bits_pdest_cons;
    extern constraint default_io_enq_req_0_bits_robIdx_flag_cons;
    extern constraint default_io_enq_req_0_bits_robIdx_value_cons;
    extern constraint default_io_enq_req_0_bits_instrSize_cons;
    extern constraint default_io_enq_req_0_bits_dirtyFs_cons;
    extern constraint default_io_enq_req_0_bits_dirtyVs_cons;
    extern constraint default_io_enq_req_0_bits_traceBlockInPipe_itype_cons;
    extern constraint default_io_enq_req_0_bits_traceBlockInPipe_iretire_cons;
    extern constraint default_io_enq_req_0_bits_traceBlockInPipe_ilastsize_cons;
    extern constraint default_io_enq_req_0_bits_eliminatedMove_cons;
    extern constraint default_io_enq_req_0_bits_snapshot_cons;
    extern constraint default_io_enq_req_0_bits_lqIdx_value_cons;
    extern constraint default_io_enq_req_0_bits_sqIdx_value_cons;
    extern constraint default_io_enq_req_0_bits_singleStep_cons;
    extern constraint default_io_enq_req_0_bits_debug_sim_trig_cons;
    extern constraint default_io_enq_req_1_valid_cons;
    extern constraint default_io_enq_req_1_bits_instr_cons;
    extern constraint default_io_enq_req_1_bits_pc_cons;
    extern constraint default_io_enq_req_1_bits_exceptionVec_0_cons;
    extern constraint default_io_enq_req_1_bits_exceptionVec_1_cons;
    extern constraint default_io_enq_req_1_bits_exceptionVec_2_cons;
    extern constraint default_io_enq_req_1_bits_exceptionVec_3_cons;
    extern constraint default_io_enq_req_1_bits_exceptionVec_12_cons;
    extern constraint default_io_enq_req_1_bits_exceptionVec_20_cons;
    extern constraint default_io_enq_req_1_bits_exceptionVec_22_cons;
    extern constraint default_io_enq_req_1_bits_isFetchMalAddr_cons;
    extern constraint default_io_enq_req_1_bits_hasException_cons;
    extern constraint default_io_enq_req_1_bits_trigger_cons;
    extern constraint default_io_enq_req_1_bits_preDecodeInfo_isRVC_cons;
    extern constraint default_io_enq_req_1_bits_crossPageIPFFix_cons;
    extern constraint default_io_enq_req_1_bits_ftqPtr_flag_cons;
    extern constraint default_io_enq_req_1_bits_ftqPtr_value_cons;
    extern constraint default_io_enq_req_1_bits_ftqOffset_cons;
    extern constraint default_io_enq_req_1_bits_ldest_cons;
    extern constraint default_io_enq_req_1_bits_fuType_cons;
    extern constraint default_io_enq_req_1_bits_fuOpType_cons;
    extern constraint default_io_enq_req_1_bits_rfWen_cons;
    extern constraint default_io_enq_req_1_bits_fpWen_cons;
    extern constraint default_io_enq_req_1_bits_vecWen_cons;
    extern constraint default_io_enq_req_1_bits_v0Wen_cons;
    extern constraint default_io_enq_req_1_bits_vlWen_cons;
    extern constraint default_io_enq_req_1_bits_isXSTrap_cons;
    extern constraint default_io_enq_req_1_bits_waitForward_cons;
    extern constraint default_io_enq_req_1_bits_blockBackward_cons;
    extern constraint default_io_enq_req_1_bits_flushPipe_cons;
    extern constraint default_io_enq_req_1_bits_vpu_vill_cons;
    extern constraint default_io_enq_req_1_bits_vpu_vma_cons;
    extern constraint default_io_enq_req_1_bits_vpu_vta_cons;
    extern constraint default_io_enq_req_1_bits_vpu_vsew_cons;
    extern constraint default_io_enq_req_1_bits_vpu_vlmul_cons;
    extern constraint default_io_enq_req_1_bits_vpu_specVill_cons;
    extern constraint default_io_enq_req_1_bits_vpu_specVma_cons;
    extern constraint default_io_enq_req_1_bits_vpu_specVta_cons;
    extern constraint default_io_enq_req_1_bits_vpu_specVsew_cons;
    extern constraint default_io_enq_req_1_bits_vpu_specVlmul_cons;
    extern constraint default_io_enq_req_1_bits_vlsInstr_cons;
    extern constraint default_io_enq_req_1_bits_wfflags_cons;
    extern constraint default_io_enq_req_1_bits_isMove_cons;
    extern constraint default_io_enq_req_1_bits_isVset_cons;
    extern constraint default_io_enq_req_1_bits_firstUop_cons;
    extern constraint default_io_enq_req_1_bits_lastUop_cons;
    extern constraint default_io_enq_req_1_bits_numWB_cons;
    extern constraint default_io_enq_req_1_bits_commitType_cons;
    extern constraint default_io_enq_req_1_bits_pdest_cons;
    extern constraint default_io_enq_req_1_bits_robIdx_flag_cons;
    extern constraint default_io_enq_req_1_bits_robIdx_value_cons;
    extern constraint default_io_enq_req_1_bits_instrSize_cons;
    extern constraint default_io_enq_req_1_bits_dirtyFs_cons;
    extern constraint default_io_enq_req_1_bits_dirtyVs_cons;
    extern constraint default_io_enq_req_1_bits_traceBlockInPipe_itype_cons;
    extern constraint default_io_enq_req_1_bits_traceBlockInPipe_iretire_cons;
    extern constraint default_io_enq_req_1_bits_traceBlockInPipe_ilastsize_cons;
    extern constraint default_io_enq_req_1_bits_eliminatedMove_cons;
    extern constraint default_io_enq_req_1_bits_snapshot_cons;
    extern constraint default_io_enq_req_1_bits_lqIdx_value_cons;
    extern constraint default_io_enq_req_1_bits_sqIdx_value_cons;
    extern constraint default_io_enq_req_1_bits_singleStep_cons;
    extern constraint default_io_enq_req_1_bits_debug_sim_trig_cons;
    extern constraint default_io_enq_req_2_valid_cons;
    extern constraint default_io_enq_req_2_bits_instr_cons;
    extern constraint default_io_enq_req_2_bits_pc_cons;
    extern constraint default_io_enq_req_2_bits_exceptionVec_0_cons;
    extern constraint default_io_enq_req_2_bits_exceptionVec_1_cons;
    extern constraint default_io_enq_req_2_bits_exceptionVec_2_cons;
    extern constraint default_io_enq_req_2_bits_exceptionVec_3_cons;
    extern constraint default_io_enq_req_2_bits_exceptionVec_12_cons;
    extern constraint default_io_enq_req_2_bits_exceptionVec_20_cons;
    extern constraint default_io_enq_req_2_bits_exceptionVec_22_cons;
    extern constraint default_io_enq_req_2_bits_isFetchMalAddr_cons;
    extern constraint default_io_enq_req_2_bits_hasException_cons;
    extern constraint default_io_enq_req_2_bits_trigger_cons;
    extern constraint default_io_enq_req_2_bits_preDecodeInfo_isRVC_cons;
    extern constraint default_io_enq_req_2_bits_crossPageIPFFix_cons;
    extern constraint default_io_enq_req_2_bits_ftqPtr_flag_cons;
    extern constraint default_io_enq_req_2_bits_ftqPtr_value_cons;
    extern constraint default_io_enq_req_2_bits_ftqOffset_cons;
    extern constraint default_io_enq_req_2_bits_ldest_cons;
    extern constraint default_io_enq_req_2_bits_fuType_cons;
    extern constraint default_io_enq_req_2_bits_fuOpType_cons;
    extern constraint default_io_enq_req_2_bits_rfWen_cons;
    extern constraint default_io_enq_req_2_bits_fpWen_cons;
    extern constraint default_io_enq_req_2_bits_vecWen_cons;
    extern constraint default_io_enq_req_2_bits_v0Wen_cons;
    extern constraint default_io_enq_req_2_bits_vlWen_cons;
    extern constraint default_io_enq_req_2_bits_isXSTrap_cons;
    extern constraint default_io_enq_req_2_bits_waitForward_cons;
    extern constraint default_io_enq_req_2_bits_blockBackward_cons;
    extern constraint default_io_enq_req_2_bits_flushPipe_cons;
    extern constraint default_io_enq_req_2_bits_vpu_vill_cons;
    extern constraint default_io_enq_req_2_bits_vpu_vma_cons;
    extern constraint default_io_enq_req_2_bits_vpu_vta_cons;
    extern constraint default_io_enq_req_2_bits_vpu_vsew_cons;
    extern constraint default_io_enq_req_2_bits_vpu_vlmul_cons;
    extern constraint default_io_enq_req_2_bits_vpu_specVill_cons;
    extern constraint default_io_enq_req_2_bits_vpu_specVma_cons;
    extern constraint default_io_enq_req_2_bits_vpu_specVta_cons;
    extern constraint default_io_enq_req_2_bits_vpu_specVsew_cons;
    extern constraint default_io_enq_req_2_bits_vpu_specVlmul_cons;
    extern constraint default_io_enq_req_2_bits_vlsInstr_cons;
    extern constraint default_io_enq_req_2_bits_wfflags_cons;
    extern constraint default_io_enq_req_2_bits_isMove_cons;
    extern constraint default_io_enq_req_2_bits_isVset_cons;
    extern constraint default_io_enq_req_2_bits_firstUop_cons;
    extern constraint default_io_enq_req_2_bits_lastUop_cons;
    extern constraint default_io_enq_req_2_bits_numWB_cons;
    extern constraint default_io_enq_req_2_bits_commitType_cons;
    extern constraint default_io_enq_req_2_bits_pdest_cons;
    extern constraint default_io_enq_req_2_bits_robIdx_flag_cons;
    extern constraint default_io_enq_req_2_bits_robIdx_value_cons;
    extern constraint default_io_enq_req_2_bits_instrSize_cons;
    extern constraint default_io_enq_req_2_bits_dirtyFs_cons;
    extern constraint default_io_enq_req_2_bits_dirtyVs_cons;
    extern constraint default_io_enq_req_2_bits_traceBlockInPipe_itype_cons;
    extern constraint default_io_enq_req_2_bits_traceBlockInPipe_iretire_cons;
    extern constraint default_io_enq_req_2_bits_traceBlockInPipe_ilastsize_cons;
    extern constraint default_io_enq_req_2_bits_eliminatedMove_cons;
    extern constraint default_io_enq_req_2_bits_snapshot_cons;
    extern constraint default_io_enq_req_2_bits_lqIdx_value_cons;
    extern constraint default_io_enq_req_2_bits_sqIdx_value_cons;
    extern constraint default_io_enq_req_2_bits_singleStep_cons;
    extern constraint default_io_enq_req_2_bits_debug_sim_trig_cons;
    extern constraint default_io_enq_req_3_valid_cons;
    extern constraint default_io_enq_req_3_bits_instr_cons;
    extern constraint default_io_enq_req_3_bits_pc_cons;
    extern constraint default_io_enq_req_3_bits_exceptionVec_0_cons;
    extern constraint default_io_enq_req_3_bits_exceptionVec_1_cons;
    extern constraint default_io_enq_req_3_bits_exceptionVec_2_cons;
    extern constraint default_io_enq_req_3_bits_exceptionVec_3_cons;
    extern constraint default_io_enq_req_3_bits_exceptionVec_12_cons;
    extern constraint default_io_enq_req_3_bits_exceptionVec_20_cons;
    extern constraint default_io_enq_req_3_bits_exceptionVec_22_cons;
    extern constraint default_io_enq_req_3_bits_isFetchMalAddr_cons;
    extern constraint default_io_enq_req_3_bits_hasException_cons;
    extern constraint default_io_enq_req_3_bits_trigger_cons;
    extern constraint default_io_enq_req_3_bits_preDecodeInfo_isRVC_cons;
    extern constraint default_io_enq_req_3_bits_crossPageIPFFix_cons;
    extern constraint default_io_enq_req_3_bits_ftqPtr_flag_cons;
    extern constraint default_io_enq_req_3_bits_ftqPtr_value_cons;
    extern constraint default_io_enq_req_3_bits_ftqOffset_cons;
    extern constraint default_io_enq_req_3_bits_ldest_cons;
    extern constraint default_io_enq_req_3_bits_fuType_cons;
    extern constraint default_io_enq_req_3_bits_fuOpType_cons;
    extern constraint default_io_enq_req_3_bits_rfWen_cons;
    extern constraint default_io_enq_req_3_bits_fpWen_cons;
    extern constraint default_io_enq_req_3_bits_vecWen_cons;
    extern constraint default_io_enq_req_3_bits_v0Wen_cons;
    extern constraint default_io_enq_req_3_bits_vlWen_cons;
    extern constraint default_io_enq_req_3_bits_isXSTrap_cons;
    extern constraint default_io_enq_req_3_bits_waitForward_cons;
    extern constraint default_io_enq_req_3_bits_blockBackward_cons;
    extern constraint default_io_enq_req_3_bits_flushPipe_cons;
    extern constraint default_io_enq_req_3_bits_vpu_vill_cons;
    extern constraint default_io_enq_req_3_bits_vpu_vma_cons;
    extern constraint default_io_enq_req_3_bits_vpu_vta_cons;
    extern constraint default_io_enq_req_3_bits_vpu_vsew_cons;
    extern constraint default_io_enq_req_3_bits_vpu_vlmul_cons;
    extern constraint default_io_enq_req_3_bits_vpu_specVill_cons;
    extern constraint default_io_enq_req_3_bits_vpu_specVma_cons;
    extern constraint default_io_enq_req_3_bits_vpu_specVta_cons;
    extern constraint default_io_enq_req_3_bits_vpu_specVsew_cons;
    extern constraint default_io_enq_req_3_bits_vpu_specVlmul_cons;
    extern constraint default_io_enq_req_3_bits_vlsInstr_cons;
    extern constraint default_io_enq_req_3_bits_wfflags_cons;
    extern constraint default_io_enq_req_3_bits_isMove_cons;
    extern constraint default_io_enq_req_3_bits_isVset_cons;
    extern constraint default_io_enq_req_3_bits_firstUop_cons;
    extern constraint default_io_enq_req_3_bits_lastUop_cons;
    extern constraint default_io_enq_req_3_bits_numWB_cons;
    extern constraint default_io_enq_req_3_bits_commitType_cons;
    extern constraint default_io_enq_req_3_bits_pdest_cons;
    extern constraint default_io_enq_req_3_bits_robIdx_flag_cons;
    extern constraint default_io_enq_req_3_bits_robIdx_value_cons;
    extern constraint default_io_enq_req_3_bits_instrSize_cons;
    extern constraint default_io_enq_req_3_bits_dirtyFs_cons;
    extern constraint default_io_enq_req_3_bits_dirtyVs_cons;
    extern constraint default_io_enq_req_3_bits_traceBlockInPipe_itype_cons;
    extern constraint default_io_enq_req_3_bits_traceBlockInPipe_iretire_cons;
    extern constraint default_io_enq_req_3_bits_traceBlockInPipe_ilastsize_cons;
    extern constraint default_io_enq_req_3_bits_eliminatedMove_cons;
    extern constraint default_io_enq_req_3_bits_snapshot_cons;
    extern constraint default_io_enq_req_3_bits_lqIdx_value_cons;
    extern constraint default_io_enq_req_3_bits_sqIdx_value_cons;
    extern constraint default_io_enq_req_3_bits_singleStep_cons;
    extern constraint default_io_enq_req_3_bits_debug_sim_trig_cons;
    extern constraint default_io_enq_req_4_valid_cons;
    extern constraint default_io_enq_req_4_bits_instr_cons;
    extern constraint default_io_enq_req_4_bits_pc_cons;
    extern constraint default_io_enq_req_4_bits_exceptionVec_0_cons;
    extern constraint default_io_enq_req_4_bits_exceptionVec_1_cons;
    extern constraint default_io_enq_req_4_bits_exceptionVec_2_cons;
    extern constraint default_io_enq_req_4_bits_exceptionVec_3_cons;
    extern constraint default_io_enq_req_4_bits_exceptionVec_12_cons;
    extern constraint default_io_enq_req_4_bits_exceptionVec_20_cons;
    extern constraint default_io_enq_req_4_bits_exceptionVec_22_cons;
    extern constraint default_io_enq_req_4_bits_isFetchMalAddr_cons;
    extern constraint default_io_enq_req_4_bits_hasException_cons;
    extern constraint default_io_enq_req_4_bits_trigger_cons;
    extern constraint default_io_enq_req_4_bits_preDecodeInfo_isRVC_cons;
    extern constraint default_io_enq_req_4_bits_crossPageIPFFix_cons;
    extern constraint default_io_enq_req_4_bits_ftqPtr_flag_cons;
    extern constraint default_io_enq_req_4_bits_ftqPtr_value_cons;
    extern constraint default_io_enq_req_4_bits_ftqOffset_cons;
    extern constraint default_io_enq_req_4_bits_ldest_cons;
    extern constraint default_io_enq_req_4_bits_fuType_cons;
    extern constraint default_io_enq_req_4_bits_fuOpType_cons;
    extern constraint default_io_enq_req_4_bits_rfWen_cons;
    extern constraint default_io_enq_req_4_bits_fpWen_cons;
    extern constraint default_io_enq_req_4_bits_vecWen_cons;
    extern constraint default_io_enq_req_4_bits_v0Wen_cons;
    extern constraint default_io_enq_req_4_bits_vlWen_cons;
    extern constraint default_io_enq_req_4_bits_isXSTrap_cons;
    extern constraint default_io_enq_req_4_bits_waitForward_cons;
    extern constraint default_io_enq_req_4_bits_blockBackward_cons;
    extern constraint default_io_enq_req_4_bits_flushPipe_cons;
    extern constraint default_io_enq_req_4_bits_vpu_vill_cons;
    extern constraint default_io_enq_req_4_bits_vpu_vma_cons;
    extern constraint default_io_enq_req_4_bits_vpu_vta_cons;
    extern constraint default_io_enq_req_4_bits_vpu_vsew_cons;
    extern constraint default_io_enq_req_4_bits_vpu_vlmul_cons;
    extern constraint default_io_enq_req_4_bits_vpu_specVill_cons;
    extern constraint default_io_enq_req_4_bits_vpu_specVma_cons;
    extern constraint default_io_enq_req_4_bits_vpu_specVta_cons;
    extern constraint default_io_enq_req_4_bits_vpu_specVsew_cons;
    extern constraint default_io_enq_req_4_bits_vpu_specVlmul_cons;
    extern constraint default_io_enq_req_4_bits_vlsInstr_cons;
    extern constraint default_io_enq_req_4_bits_wfflags_cons;
    extern constraint default_io_enq_req_4_bits_isMove_cons;
    extern constraint default_io_enq_req_4_bits_isVset_cons;
    extern constraint default_io_enq_req_4_bits_firstUop_cons;
    extern constraint default_io_enq_req_4_bits_lastUop_cons;
    extern constraint default_io_enq_req_4_bits_numWB_cons;
    extern constraint default_io_enq_req_4_bits_commitType_cons;
    extern constraint default_io_enq_req_4_bits_pdest_cons;
    extern constraint default_io_enq_req_4_bits_robIdx_flag_cons;
    extern constraint default_io_enq_req_4_bits_robIdx_value_cons;
    extern constraint default_io_enq_req_4_bits_instrSize_cons;
    extern constraint default_io_enq_req_4_bits_dirtyFs_cons;
    extern constraint default_io_enq_req_4_bits_dirtyVs_cons;
    extern constraint default_io_enq_req_4_bits_traceBlockInPipe_itype_cons;
    extern constraint default_io_enq_req_4_bits_traceBlockInPipe_iretire_cons;
    extern constraint default_io_enq_req_4_bits_traceBlockInPipe_ilastsize_cons;
    extern constraint default_io_enq_req_4_bits_eliminatedMove_cons;
    extern constraint default_io_enq_req_4_bits_snapshot_cons;
    extern constraint default_io_enq_req_4_bits_lqIdx_value_cons;
    extern constraint default_io_enq_req_4_bits_sqIdx_value_cons;
    extern constraint default_io_enq_req_4_bits_singleStep_cons;
    extern constraint default_io_enq_req_4_bits_debug_sim_trig_cons;
    extern constraint default_io_enq_req_5_valid_cons;
    extern constraint default_io_enq_req_5_bits_instr_cons;
    extern constraint default_io_enq_req_5_bits_pc_cons;
    extern constraint default_io_enq_req_5_bits_exceptionVec_0_cons;
    extern constraint default_io_enq_req_5_bits_exceptionVec_1_cons;
    extern constraint default_io_enq_req_5_bits_exceptionVec_2_cons;
    extern constraint default_io_enq_req_5_bits_exceptionVec_3_cons;
    extern constraint default_io_enq_req_5_bits_exceptionVec_12_cons;
    extern constraint default_io_enq_req_5_bits_exceptionVec_20_cons;
    extern constraint default_io_enq_req_5_bits_exceptionVec_22_cons;
    extern constraint default_io_enq_req_5_bits_isFetchMalAddr_cons;
    extern constraint default_io_enq_req_5_bits_hasException_cons;
    extern constraint default_io_enq_req_5_bits_trigger_cons;
    extern constraint default_io_enq_req_5_bits_preDecodeInfo_isRVC_cons;
    extern constraint default_io_enq_req_5_bits_crossPageIPFFix_cons;
    extern constraint default_io_enq_req_5_bits_ftqPtr_flag_cons;
    extern constraint default_io_enq_req_5_bits_ftqPtr_value_cons;
    extern constraint default_io_enq_req_5_bits_ftqOffset_cons;
    extern constraint default_io_enq_req_5_bits_ldest_cons;
    extern constraint default_io_enq_req_5_bits_fuType_cons;
    extern constraint default_io_enq_req_5_bits_fuOpType_cons;
    extern constraint default_io_enq_req_5_bits_rfWen_cons;
    extern constraint default_io_enq_req_5_bits_fpWen_cons;
    extern constraint default_io_enq_req_5_bits_vecWen_cons;
    extern constraint default_io_enq_req_5_bits_v0Wen_cons;
    extern constraint default_io_enq_req_5_bits_vlWen_cons;
    extern constraint default_io_enq_req_5_bits_isXSTrap_cons;
    extern constraint default_io_enq_req_5_bits_waitForward_cons;
    extern constraint default_io_enq_req_5_bits_blockBackward_cons;
    extern constraint default_io_enq_req_5_bits_flushPipe_cons;
    extern constraint default_io_enq_req_5_bits_vpu_vill_cons;
    extern constraint default_io_enq_req_5_bits_vpu_vma_cons;
    extern constraint default_io_enq_req_5_bits_vpu_vta_cons;
    extern constraint default_io_enq_req_5_bits_vpu_vsew_cons;
    extern constraint default_io_enq_req_5_bits_vpu_vlmul_cons;
    extern constraint default_io_enq_req_5_bits_vpu_specVill_cons;
    extern constraint default_io_enq_req_5_bits_vpu_specVma_cons;
    extern constraint default_io_enq_req_5_bits_vpu_specVta_cons;
    extern constraint default_io_enq_req_5_bits_vpu_specVsew_cons;
    extern constraint default_io_enq_req_5_bits_vpu_specVlmul_cons;
    extern constraint default_io_enq_req_5_bits_vlsInstr_cons;
    extern constraint default_io_enq_req_5_bits_wfflags_cons;
    extern constraint default_io_enq_req_5_bits_isMove_cons;
    extern constraint default_io_enq_req_5_bits_isVset_cons;
    extern constraint default_io_enq_req_5_bits_firstUop_cons;
    extern constraint default_io_enq_req_5_bits_lastUop_cons;
    extern constraint default_io_enq_req_5_bits_numWB_cons;
    extern constraint default_io_enq_req_5_bits_commitType_cons;
    extern constraint default_io_enq_req_5_bits_pdest_cons;
    extern constraint default_io_enq_req_5_bits_robIdx_flag_cons;
    extern constraint default_io_enq_req_5_bits_robIdx_value_cons;
    extern constraint default_io_enq_req_5_bits_instrSize_cons;
    extern constraint default_io_enq_req_5_bits_dirtyFs_cons;
    extern constraint default_io_enq_req_5_bits_dirtyVs_cons;
    extern constraint default_io_enq_req_5_bits_traceBlockInPipe_itype_cons;
    extern constraint default_io_enq_req_5_bits_traceBlockInPipe_iretire_cons;
    extern constraint default_io_enq_req_5_bits_traceBlockInPipe_ilastsize_cons;
    extern constraint default_io_enq_req_5_bits_eliminatedMove_cons;
    extern constraint default_io_enq_req_5_bits_snapshot_cons;
    extern constraint default_io_enq_req_5_bits_lqIdx_value_cons;
    extern constraint default_io_enq_req_5_bits_sqIdx_value_cons;
    extern constraint default_io_enq_req_5_bits_singleStep_cons;
    extern constraint default_io_enq_req_5_bits_debug_sim_trig_cons;

    extern function new(string name="rename_in_agent_xaction");
    extern function void pack();
    extern function void unpack();
    extern function void pre_randomize();
    extern function void post_randomize();
    extern function string psdisplay(string prefix = "");
    extern function bit compare(uvm_object rhs, uvm_comparer comparer=null);

    `uvm_object_utils_begin(rename_in_agent_xaction)
        `uvm_field_int(clock, UVM_ALL_ON);
        `uvm_field_int(reset, UVM_ALL_ON);
        `uvm_field_int(io_hartId, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_valid, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_instr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_pc, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_exceptionVec_0, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_exceptionVec_1, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_exceptionVec_2, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_exceptionVec_3, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_exceptionVec_12, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_exceptionVec_20, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_exceptionVec_22, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_isFetchMalAddr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_hasException, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_trigger, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_preDecodeInfo_isRVC, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_crossPageIPFFix, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_ftqPtr_flag, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_ftqPtr_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_ftqOffset, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_ldest, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_fuType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_fuOpType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_rfWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_fpWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vecWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_v0Wen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vlWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_isXSTrap, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_waitForward, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_blockBackward, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_flushPipe, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vpu_vill, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vpu_vma, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vpu_vta, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vpu_vsew, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vpu_vlmul, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vpu_specVill, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vpu_specVma, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vpu_specVta, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vpu_specVsew, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vpu_specVlmul, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_vlsInstr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_wfflags, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_isMove, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_isVset, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_firstUop, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_lastUop, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_numWB, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_commitType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_pdest, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_robIdx_flag, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_robIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_instrSize, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_dirtyFs, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_dirtyVs, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_traceBlockInPipe_itype, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_traceBlockInPipe_iretire, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_traceBlockInPipe_ilastsize, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_eliminatedMove, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_snapshot, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_lqIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_sqIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_singleStep, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_0_bits_debug_sim_trig, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_valid, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_instr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_pc, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_exceptionVec_0, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_exceptionVec_1, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_exceptionVec_2, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_exceptionVec_3, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_exceptionVec_12, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_exceptionVec_20, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_exceptionVec_22, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_isFetchMalAddr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_hasException, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_trigger, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_preDecodeInfo_isRVC, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_crossPageIPFFix, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_ftqPtr_flag, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_ftqPtr_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_ftqOffset, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_ldest, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_fuType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_fuOpType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_rfWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_fpWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vecWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_v0Wen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vlWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_isXSTrap, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_waitForward, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_blockBackward, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_flushPipe, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vpu_vill, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vpu_vma, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vpu_vta, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vpu_vsew, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vpu_vlmul, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vpu_specVill, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vpu_specVma, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vpu_specVta, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vpu_specVsew, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vpu_specVlmul, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_vlsInstr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_wfflags, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_isMove, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_isVset, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_firstUop, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_lastUop, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_numWB, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_commitType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_pdest, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_robIdx_flag, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_robIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_instrSize, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_dirtyFs, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_dirtyVs, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_traceBlockInPipe_itype, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_traceBlockInPipe_iretire, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_traceBlockInPipe_ilastsize, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_eliminatedMove, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_snapshot, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_lqIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_sqIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_singleStep, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_1_bits_debug_sim_trig, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_valid, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_instr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_pc, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_exceptionVec_0, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_exceptionVec_1, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_exceptionVec_2, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_exceptionVec_3, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_exceptionVec_12, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_exceptionVec_20, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_exceptionVec_22, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_isFetchMalAddr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_hasException, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_trigger, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_preDecodeInfo_isRVC, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_crossPageIPFFix, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_ftqPtr_flag, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_ftqPtr_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_ftqOffset, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_ldest, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_fuType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_fuOpType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_rfWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_fpWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vecWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_v0Wen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vlWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_isXSTrap, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_waitForward, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_blockBackward, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_flushPipe, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vpu_vill, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vpu_vma, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vpu_vta, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vpu_vsew, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vpu_vlmul, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vpu_specVill, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vpu_specVma, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vpu_specVta, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vpu_specVsew, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vpu_specVlmul, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_vlsInstr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_wfflags, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_isMove, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_isVset, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_firstUop, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_lastUop, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_numWB, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_commitType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_pdest, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_robIdx_flag, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_robIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_instrSize, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_dirtyFs, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_dirtyVs, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_traceBlockInPipe_itype, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_traceBlockInPipe_iretire, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_traceBlockInPipe_ilastsize, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_eliminatedMove, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_snapshot, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_lqIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_sqIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_singleStep, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_2_bits_debug_sim_trig, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_valid, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_instr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_pc, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_exceptionVec_0, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_exceptionVec_1, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_exceptionVec_2, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_exceptionVec_3, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_exceptionVec_12, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_exceptionVec_20, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_exceptionVec_22, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_isFetchMalAddr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_hasException, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_trigger, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_preDecodeInfo_isRVC, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_crossPageIPFFix, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_ftqPtr_flag, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_ftqPtr_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_ftqOffset, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_ldest, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_fuType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_fuOpType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_rfWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_fpWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vecWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_v0Wen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vlWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_isXSTrap, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_waitForward, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_blockBackward, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_flushPipe, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vpu_vill, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vpu_vma, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vpu_vta, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vpu_vsew, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vpu_vlmul, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vpu_specVill, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vpu_specVma, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vpu_specVta, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vpu_specVsew, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vpu_specVlmul, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_vlsInstr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_wfflags, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_isMove, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_isVset, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_firstUop, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_lastUop, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_numWB, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_commitType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_pdest, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_robIdx_flag, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_robIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_instrSize, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_dirtyFs, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_dirtyVs, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_traceBlockInPipe_itype, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_traceBlockInPipe_iretire, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_traceBlockInPipe_ilastsize, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_eliminatedMove, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_snapshot, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_lqIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_sqIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_singleStep, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_3_bits_debug_sim_trig, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_valid, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_instr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_pc, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_exceptionVec_0, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_exceptionVec_1, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_exceptionVec_2, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_exceptionVec_3, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_exceptionVec_12, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_exceptionVec_20, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_exceptionVec_22, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_isFetchMalAddr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_hasException, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_trigger, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_preDecodeInfo_isRVC, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_crossPageIPFFix, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_ftqPtr_flag, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_ftqPtr_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_ftqOffset, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_ldest, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_fuType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_fuOpType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_rfWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_fpWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vecWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_v0Wen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vlWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_isXSTrap, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_waitForward, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_blockBackward, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_flushPipe, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vpu_vill, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vpu_vma, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vpu_vta, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vpu_vsew, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vpu_vlmul, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vpu_specVill, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vpu_specVma, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vpu_specVta, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vpu_specVsew, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vpu_specVlmul, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_vlsInstr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_wfflags, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_isMove, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_isVset, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_firstUop, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_lastUop, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_numWB, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_commitType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_pdest, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_robIdx_flag, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_robIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_instrSize, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_dirtyFs, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_dirtyVs, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_traceBlockInPipe_itype, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_traceBlockInPipe_iretire, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_traceBlockInPipe_ilastsize, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_eliminatedMove, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_snapshot, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_lqIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_sqIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_singleStep, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_4_bits_debug_sim_trig, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_valid, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_instr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_pc, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_exceptionVec_0, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_exceptionVec_1, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_exceptionVec_2, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_exceptionVec_3, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_exceptionVec_12, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_exceptionVec_20, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_exceptionVec_22, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_isFetchMalAddr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_hasException, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_trigger, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_preDecodeInfo_isRVC, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_crossPageIPFFix, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_ftqPtr_flag, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_ftqPtr_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_ftqOffset, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_ldest, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_fuType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_fuOpType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_rfWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_fpWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vecWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_v0Wen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vlWen, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_isXSTrap, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_waitForward, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_blockBackward, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_flushPipe, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vpu_vill, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vpu_vma, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vpu_vta, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vpu_vsew, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vpu_vlmul, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vpu_specVill, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vpu_specVma, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vpu_specVta, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vpu_specVsew, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vpu_specVlmul, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_vlsInstr, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_wfflags, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_isMove, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_isVset, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_firstUop, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_lastUop, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_numWB, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_commitType, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_pdest, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_robIdx_flag, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_robIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_instrSize, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_dirtyFs, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_dirtyVs, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_traceBlockInPipe_itype, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_traceBlockInPipe_iretire, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_traceBlockInPipe_ilastsize, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_eliminatedMove, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_snapshot, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_lqIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_sqIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_singleStep, UVM_ALL_ON);
        `uvm_field_int(io_enq_req_5_bits_debug_sim_trig, UVM_ALL_ON);

    `uvm_object_utils_end

endclass:rename_in_agent_xaction

constraint rename_in_agent_xaction::default_clock_cons{

}

constraint rename_in_agent_xaction::default_reset_cons{

}

constraint rename_in_agent_xaction::default_io_hartId_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_valid_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_instr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_pc_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_exceptionVec_0_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_exceptionVec_1_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_exceptionVec_2_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_exceptionVec_3_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_exceptionVec_12_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_exceptionVec_20_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_exceptionVec_22_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_isFetchMalAddr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_hasException_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_trigger_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_preDecodeInfo_isRVC_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_crossPageIPFFix_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_ftqPtr_flag_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_ftqPtr_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_ftqOffset_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_ldest_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_fuType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_fuOpType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_rfWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_fpWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vecWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_v0Wen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vlWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_isXSTrap_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_waitForward_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_blockBackward_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_flushPipe_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vpu_vill_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vpu_vma_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vpu_vta_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vpu_vsew_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vpu_vlmul_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vpu_specVill_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vpu_specVma_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vpu_specVta_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vpu_specVsew_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vpu_specVlmul_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_vlsInstr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_wfflags_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_isMove_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_isVset_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_firstUop_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_lastUop_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_numWB_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_commitType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_pdest_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_robIdx_flag_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_robIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_instrSize_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_dirtyFs_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_dirtyVs_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_traceBlockInPipe_itype_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_traceBlockInPipe_iretire_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_traceBlockInPipe_ilastsize_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_eliminatedMove_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_snapshot_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_lqIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_sqIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_singleStep_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_0_bits_debug_sim_trig_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_valid_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_instr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_pc_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_exceptionVec_0_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_exceptionVec_1_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_exceptionVec_2_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_exceptionVec_3_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_exceptionVec_12_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_exceptionVec_20_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_exceptionVec_22_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_isFetchMalAddr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_hasException_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_trigger_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_preDecodeInfo_isRVC_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_crossPageIPFFix_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_ftqPtr_flag_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_ftqPtr_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_ftqOffset_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_ldest_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_fuType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_fuOpType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_rfWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_fpWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vecWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_v0Wen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vlWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_isXSTrap_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_waitForward_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_blockBackward_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_flushPipe_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vpu_vill_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vpu_vma_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vpu_vta_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vpu_vsew_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vpu_vlmul_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vpu_specVill_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vpu_specVma_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vpu_specVta_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vpu_specVsew_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vpu_specVlmul_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_vlsInstr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_wfflags_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_isMove_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_isVset_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_firstUop_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_lastUop_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_numWB_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_commitType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_pdest_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_robIdx_flag_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_robIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_instrSize_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_dirtyFs_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_dirtyVs_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_traceBlockInPipe_itype_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_traceBlockInPipe_iretire_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_traceBlockInPipe_ilastsize_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_eliminatedMove_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_snapshot_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_lqIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_sqIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_singleStep_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_1_bits_debug_sim_trig_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_valid_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_instr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_pc_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_exceptionVec_0_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_exceptionVec_1_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_exceptionVec_2_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_exceptionVec_3_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_exceptionVec_12_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_exceptionVec_20_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_exceptionVec_22_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_isFetchMalAddr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_hasException_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_trigger_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_preDecodeInfo_isRVC_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_crossPageIPFFix_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_ftqPtr_flag_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_ftqPtr_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_ftqOffset_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_ldest_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_fuType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_fuOpType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_rfWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_fpWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vecWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_v0Wen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vlWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_isXSTrap_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_waitForward_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_blockBackward_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_flushPipe_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vpu_vill_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vpu_vma_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vpu_vta_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vpu_vsew_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vpu_vlmul_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vpu_specVill_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vpu_specVma_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vpu_specVta_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vpu_specVsew_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vpu_specVlmul_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_vlsInstr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_wfflags_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_isMove_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_isVset_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_firstUop_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_lastUop_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_numWB_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_commitType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_pdest_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_robIdx_flag_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_robIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_instrSize_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_dirtyFs_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_dirtyVs_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_traceBlockInPipe_itype_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_traceBlockInPipe_iretire_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_traceBlockInPipe_ilastsize_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_eliminatedMove_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_snapshot_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_lqIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_sqIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_singleStep_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_2_bits_debug_sim_trig_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_valid_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_instr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_pc_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_exceptionVec_0_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_exceptionVec_1_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_exceptionVec_2_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_exceptionVec_3_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_exceptionVec_12_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_exceptionVec_20_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_exceptionVec_22_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_isFetchMalAddr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_hasException_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_trigger_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_preDecodeInfo_isRVC_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_crossPageIPFFix_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_ftqPtr_flag_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_ftqPtr_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_ftqOffset_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_ldest_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_fuType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_fuOpType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_rfWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_fpWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vecWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_v0Wen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vlWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_isXSTrap_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_waitForward_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_blockBackward_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_flushPipe_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vpu_vill_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vpu_vma_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vpu_vta_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vpu_vsew_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vpu_vlmul_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vpu_specVill_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vpu_specVma_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vpu_specVta_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vpu_specVsew_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vpu_specVlmul_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_vlsInstr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_wfflags_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_isMove_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_isVset_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_firstUop_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_lastUop_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_numWB_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_commitType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_pdest_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_robIdx_flag_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_robIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_instrSize_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_dirtyFs_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_dirtyVs_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_traceBlockInPipe_itype_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_traceBlockInPipe_iretire_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_traceBlockInPipe_ilastsize_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_eliminatedMove_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_snapshot_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_lqIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_sqIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_singleStep_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_3_bits_debug_sim_trig_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_valid_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_instr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_pc_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_exceptionVec_0_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_exceptionVec_1_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_exceptionVec_2_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_exceptionVec_3_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_exceptionVec_12_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_exceptionVec_20_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_exceptionVec_22_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_isFetchMalAddr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_hasException_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_trigger_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_preDecodeInfo_isRVC_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_crossPageIPFFix_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_ftqPtr_flag_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_ftqPtr_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_ftqOffset_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_ldest_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_fuType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_fuOpType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_rfWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_fpWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vecWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_v0Wen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vlWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_isXSTrap_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_waitForward_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_blockBackward_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_flushPipe_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vpu_vill_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vpu_vma_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vpu_vta_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vpu_vsew_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vpu_vlmul_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vpu_specVill_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vpu_specVma_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vpu_specVta_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vpu_specVsew_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vpu_specVlmul_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_vlsInstr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_wfflags_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_isMove_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_isVset_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_firstUop_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_lastUop_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_numWB_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_commitType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_pdest_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_robIdx_flag_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_robIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_instrSize_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_dirtyFs_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_dirtyVs_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_traceBlockInPipe_itype_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_traceBlockInPipe_iretire_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_traceBlockInPipe_ilastsize_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_eliminatedMove_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_snapshot_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_lqIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_sqIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_singleStep_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_4_bits_debug_sim_trig_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_valid_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_instr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_pc_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_exceptionVec_0_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_exceptionVec_1_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_exceptionVec_2_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_exceptionVec_3_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_exceptionVec_12_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_exceptionVec_20_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_exceptionVec_22_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_isFetchMalAddr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_hasException_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_trigger_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_preDecodeInfo_isRVC_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_crossPageIPFFix_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_ftqPtr_flag_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_ftqPtr_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_ftqOffset_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_ldest_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_fuType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_fuOpType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_rfWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_fpWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vecWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_v0Wen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vlWen_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_isXSTrap_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_waitForward_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_blockBackward_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_flushPipe_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vpu_vill_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vpu_vma_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vpu_vta_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vpu_vsew_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vpu_vlmul_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vpu_specVill_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vpu_specVma_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vpu_specVta_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vpu_specVsew_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vpu_specVlmul_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_vlsInstr_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_wfflags_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_isMove_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_isVset_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_firstUop_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_lastUop_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_numWB_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_commitType_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_pdest_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_robIdx_flag_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_robIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_instrSize_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_dirtyFs_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_dirtyVs_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_traceBlockInPipe_itype_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_traceBlockInPipe_iretire_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_traceBlockInPipe_ilastsize_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_eliminatedMove_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_snapshot_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_lqIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_sqIdx_value_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_singleStep_cons{

}

constraint rename_in_agent_xaction::default_io_enq_req_5_bits_debug_sim_trig_cons{

}

function rename_in_agent_xaction::new(string name = "rename_in_agent_xaction");
    super.new();
endfunction:new

function void rename_in_agent_xaction::pack();
    super.pack();
endfunction:pack
function void rename_in_agent_xaction::unpack();
    super.unpack();
endfunction:unpack
function void rename_in_agent_xaction::pre_randomize();
    super.pre_randomize();
endfunction:pre_randomize
function void rename_in_agent_xaction::post_randomize();
    super.post_randomize();
    //this.pack();
endfunction:post_randomize

function string rename_in_agent_xaction::psdisplay(string prefix = "");
    string pkt_str;
    pkt_str = $sformatf("%s for packet[%0d] >>>>",prefix,this.pkt_index);
    pkt_str = $sformatf("%schannel_id=%0d ",pkt_str,this.channel_id);
    pkt_str = $sformatf("%sstart=%0f finish=%0f >>>>\n",pkt_str,this.start,this.finish);
    //foreach(this.pload_q[i]) begin
    //    pkt_str = $sformatf("%spload_q[%0d]=0x%2h  ",pkt_str,i,this.pload_q[i]);
    //end
    pkt_str = $sformatf("%sclock = 0x%0h ",pkt_str,this.clock);
    pkt_str = $sformatf("%sreset = 0x%0h ",pkt_str,this.reset);
    pkt_str = $sformatf("%sio_hartId = 0x%0h ",pkt_str,this.io_hartId);
    pkt_str = $sformatf("%sio_enq_req_0_valid = 0x%0h ",pkt_str,this.io_enq_req_0_valid);
    pkt_str = $sformatf("%sio_enq_req_0_bits_instr = 0x%0h ",pkt_str,this.io_enq_req_0_bits_instr);
    pkt_str = $sformatf("%sio_enq_req_0_bits_pc = 0x%0h ",pkt_str,this.io_enq_req_0_bits_pc);
    pkt_str = $sformatf("%sio_enq_req_0_bits_exceptionVec_0 = 0x%0h ",pkt_str,this.io_enq_req_0_bits_exceptionVec_0);
    pkt_str = $sformatf("%sio_enq_req_0_bits_exceptionVec_1 = 0x%0h ",pkt_str,this.io_enq_req_0_bits_exceptionVec_1);
    pkt_str = $sformatf("%sio_enq_req_0_bits_exceptionVec_2 = 0x%0h ",pkt_str,this.io_enq_req_0_bits_exceptionVec_2);
    pkt_str = $sformatf("%sio_enq_req_0_bits_exceptionVec_3 = 0x%0h ",pkt_str,this.io_enq_req_0_bits_exceptionVec_3);
    pkt_str = $sformatf("%sio_enq_req_0_bits_exceptionVec_12 = 0x%0h ",pkt_str,this.io_enq_req_0_bits_exceptionVec_12);
    pkt_str = $sformatf("%sio_enq_req_0_bits_exceptionVec_20 = 0x%0h ",pkt_str,this.io_enq_req_0_bits_exceptionVec_20);
    pkt_str = $sformatf("%sio_enq_req_0_bits_exceptionVec_22 = 0x%0h ",pkt_str,this.io_enq_req_0_bits_exceptionVec_22);
    pkt_str = $sformatf("%sio_enq_req_0_bits_isFetchMalAddr = 0x%0h ",pkt_str,this.io_enq_req_0_bits_isFetchMalAddr);
    pkt_str = $sformatf("%sio_enq_req_0_bits_hasException = 0x%0h ",pkt_str,this.io_enq_req_0_bits_hasException);
    pkt_str = $sformatf("%sio_enq_req_0_bits_trigger = 0x%0h ",pkt_str,this.io_enq_req_0_bits_trigger);
    pkt_str = $sformatf("%sio_enq_req_0_bits_preDecodeInfo_isRVC = 0x%0h ",pkt_str,this.io_enq_req_0_bits_preDecodeInfo_isRVC);
    pkt_str = $sformatf("%sio_enq_req_0_bits_crossPageIPFFix = 0x%0h ",pkt_str,this.io_enq_req_0_bits_crossPageIPFFix);
    pkt_str = $sformatf("%sio_enq_req_0_bits_ftqPtr_flag = 0x%0h ",pkt_str,this.io_enq_req_0_bits_ftqPtr_flag);
    pkt_str = $sformatf("%sio_enq_req_0_bits_ftqPtr_value = 0x%0h ",pkt_str,this.io_enq_req_0_bits_ftqPtr_value);
    pkt_str = $sformatf("%sio_enq_req_0_bits_ftqOffset = 0x%0h ",pkt_str,this.io_enq_req_0_bits_ftqOffset);
    pkt_str = $sformatf("%sio_enq_req_0_bits_ldest = 0x%0h ",pkt_str,this.io_enq_req_0_bits_ldest);
    pkt_str = $sformatf("%sio_enq_req_0_bits_fuType = 0x%0h ",pkt_str,this.io_enq_req_0_bits_fuType);
    pkt_str = $sformatf("%sio_enq_req_0_bits_fuOpType = 0x%0h ",pkt_str,this.io_enq_req_0_bits_fuOpType);
    pkt_str = $sformatf("%sio_enq_req_0_bits_rfWen = 0x%0h ",pkt_str,this.io_enq_req_0_bits_rfWen);
    pkt_str = $sformatf("%sio_enq_req_0_bits_fpWen = 0x%0h ",pkt_str,this.io_enq_req_0_bits_fpWen);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vecWen = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vecWen);
    pkt_str = $sformatf("%sio_enq_req_0_bits_v0Wen = 0x%0h ",pkt_str,this.io_enq_req_0_bits_v0Wen);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vlWen = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vlWen);
    pkt_str = $sformatf("%sio_enq_req_0_bits_isXSTrap = 0x%0h ",pkt_str,this.io_enq_req_0_bits_isXSTrap);
    pkt_str = $sformatf("%sio_enq_req_0_bits_waitForward = 0x%0h ",pkt_str,this.io_enq_req_0_bits_waitForward);
    pkt_str = $sformatf("%sio_enq_req_0_bits_blockBackward = 0x%0h ",pkt_str,this.io_enq_req_0_bits_blockBackward);
    pkt_str = $sformatf("%sio_enq_req_0_bits_flushPipe = 0x%0h ",pkt_str,this.io_enq_req_0_bits_flushPipe);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vpu_vill = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vpu_vill);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vpu_vma = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vpu_vma);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vpu_vta = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vpu_vta);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vpu_vsew = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vpu_vsew);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vpu_vlmul = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vpu_vlmul);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vpu_specVill = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vpu_specVill);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vpu_specVma = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vpu_specVma);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vpu_specVta = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vpu_specVta);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vpu_specVsew = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vpu_specVsew);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vpu_specVlmul = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vpu_specVlmul);
    pkt_str = $sformatf("%sio_enq_req_0_bits_vlsInstr = 0x%0h ",pkt_str,this.io_enq_req_0_bits_vlsInstr);
    pkt_str = $sformatf("%sio_enq_req_0_bits_wfflags = 0x%0h ",pkt_str,this.io_enq_req_0_bits_wfflags);
    pkt_str = $sformatf("%sio_enq_req_0_bits_isMove = 0x%0h ",pkt_str,this.io_enq_req_0_bits_isMove);
    pkt_str = $sformatf("%sio_enq_req_0_bits_isVset = 0x%0h ",pkt_str,this.io_enq_req_0_bits_isVset);
    pkt_str = $sformatf("%sio_enq_req_0_bits_firstUop = 0x%0h ",pkt_str,this.io_enq_req_0_bits_firstUop);
    pkt_str = $sformatf("%sio_enq_req_0_bits_lastUop = 0x%0h ",pkt_str,this.io_enq_req_0_bits_lastUop);
    pkt_str = $sformatf("%sio_enq_req_0_bits_numWB = 0x%0h ",pkt_str,this.io_enq_req_0_bits_numWB);
    pkt_str = $sformatf("%sio_enq_req_0_bits_commitType = 0x%0h ",pkt_str,this.io_enq_req_0_bits_commitType);
    pkt_str = $sformatf("%sio_enq_req_0_bits_pdest = 0x%0h ",pkt_str,this.io_enq_req_0_bits_pdest);
    pkt_str = $sformatf("%sio_enq_req_0_bits_robIdx_flag = 0x%0h ",pkt_str,this.io_enq_req_0_bits_robIdx_flag);
    pkt_str = $sformatf("%sio_enq_req_0_bits_robIdx_value = 0x%0h ",pkt_str,this.io_enq_req_0_bits_robIdx_value);
    pkt_str = $sformatf("%sio_enq_req_0_bits_instrSize = 0x%0h ",pkt_str,this.io_enq_req_0_bits_instrSize);
    pkt_str = $sformatf("%sio_enq_req_0_bits_dirtyFs = 0x%0h ",pkt_str,this.io_enq_req_0_bits_dirtyFs);
    pkt_str = $sformatf("%sio_enq_req_0_bits_dirtyVs = 0x%0h ",pkt_str,this.io_enq_req_0_bits_dirtyVs);
    pkt_str = $sformatf("%sio_enq_req_0_bits_traceBlockInPipe_itype = 0x%0h ",pkt_str,this.io_enq_req_0_bits_traceBlockInPipe_itype);
    pkt_str = $sformatf("%sio_enq_req_0_bits_traceBlockInPipe_iretire = 0x%0h ",pkt_str,this.io_enq_req_0_bits_traceBlockInPipe_iretire);
    pkt_str = $sformatf("%sio_enq_req_0_bits_traceBlockInPipe_ilastsize = 0x%0h ",pkt_str,this.io_enq_req_0_bits_traceBlockInPipe_ilastsize);
    pkt_str = $sformatf("%sio_enq_req_0_bits_eliminatedMove = 0x%0h ",pkt_str,this.io_enq_req_0_bits_eliminatedMove);
    pkt_str = $sformatf("%sio_enq_req_0_bits_snapshot = 0x%0h ",pkt_str,this.io_enq_req_0_bits_snapshot);
    pkt_str = $sformatf("%sio_enq_req_0_bits_lqIdx_value = 0x%0h ",pkt_str,this.io_enq_req_0_bits_lqIdx_value);
    pkt_str = $sformatf("%sio_enq_req_0_bits_sqIdx_value = 0x%0h ",pkt_str,this.io_enq_req_0_bits_sqIdx_value);
    pkt_str = $sformatf("%sio_enq_req_0_bits_singleStep = 0x%0h ",pkt_str,this.io_enq_req_0_bits_singleStep);
    pkt_str = $sformatf("%sio_enq_req_0_bits_debug_sim_trig = 0x%0h ",pkt_str,this.io_enq_req_0_bits_debug_sim_trig);
    pkt_str = $sformatf("%sio_enq_req_1_valid = 0x%0h ",pkt_str,this.io_enq_req_1_valid);
    pkt_str = $sformatf("%sio_enq_req_1_bits_instr = 0x%0h ",pkt_str,this.io_enq_req_1_bits_instr);
    pkt_str = $sformatf("%sio_enq_req_1_bits_pc = 0x%0h ",pkt_str,this.io_enq_req_1_bits_pc);
    pkt_str = $sformatf("%sio_enq_req_1_bits_exceptionVec_0 = 0x%0h ",pkt_str,this.io_enq_req_1_bits_exceptionVec_0);
    pkt_str = $sformatf("%sio_enq_req_1_bits_exceptionVec_1 = 0x%0h ",pkt_str,this.io_enq_req_1_bits_exceptionVec_1);
    pkt_str = $sformatf("%sio_enq_req_1_bits_exceptionVec_2 = 0x%0h ",pkt_str,this.io_enq_req_1_bits_exceptionVec_2);
    pkt_str = $sformatf("%sio_enq_req_1_bits_exceptionVec_3 = 0x%0h ",pkt_str,this.io_enq_req_1_bits_exceptionVec_3);
    pkt_str = $sformatf("%sio_enq_req_1_bits_exceptionVec_12 = 0x%0h ",pkt_str,this.io_enq_req_1_bits_exceptionVec_12);
    pkt_str = $sformatf("%sio_enq_req_1_bits_exceptionVec_20 = 0x%0h ",pkt_str,this.io_enq_req_1_bits_exceptionVec_20);
    pkt_str = $sformatf("%sio_enq_req_1_bits_exceptionVec_22 = 0x%0h ",pkt_str,this.io_enq_req_1_bits_exceptionVec_22);
    pkt_str = $sformatf("%sio_enq_req_1_bits_isFetchMalAddr = 0x%0h ",pkt_str,this.io_enq_req_1_bits_isFetchMalAddr);
    pkt_str = $sformatf("%sio_enq_req_1_bits_hasException = 0x%0h ",pkt_str,this.io_enq_req_1_bits_hasException);
    pkt_str = $sformatf("%sio_enq_req_1_bits_trigger = 0x%0h ",pkt_str,this.io_enq_req_1_bits_trigger);
    pkt_str = $sformatf("%sio_enq_req_1_bits_preDecodeInfo_isRVC = 0x%0h ",pkt_str,this.io_enq_req_1_bits_preDecodeInfo_isRVC);
    pkt_str = $sformatf("%sio_enq_req_1_bits_crossPageIPFFix = 0x%0h ",pkt_str,this.io_enq_req_1_bits_crossPageIPFFix);
    pkt_str = $sformatf("%sio_enq_req_1_bits_ftqPtr_flag = 0x%0h ",pkt_str,this.io_enq_req_1_bits_ftqPtr_flag);
    pkt_str = $sformatf("%sio_enq_req_1_bits_ftqPtr_value = 0x%0h ",pkt_str,this.io_enq_req_1_bits_ftqPtr_value);
    pkt_str = $sformatf("%sio_enq_req_1_bits_ftqOffset = 0x%0h ",pkt_str,this.io_enq_req_1_bits_ftqOffset);
    pkt_str = $sformatf("%sio_enq_req_1_bits_ldest = 0x%0h ",pkt_str,this.io_enq_req_1_bits_ldest);
    pkt_str = $sformatf("%sio_enq_req_1_bits_fuType = 0x%0h ",pkt_str,this.io_enq_req_1_bits_fuType);
    pkt_str = $sformatf("%sio_enq_req_1_bits_fuOpType = 0x%0h ",pkt_str,this.io_enq_req_1_bits_fuOpType);
    pkt_str = $sformatf("%sio_enq_req_1_bits_rfWen = 0x%0h ",pkt_str,this.io_enq_req_1_bits_rfWen);
    pkt_str = $sformatf("%sio_enq_req_1_bits_fpWen = 0x%0h ",pkt_str,this.io_enq_req_1_bits_fpWen);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vecWen = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vecWen);
    pkt_str = $sformatf("%sio_enq_req_1_bits_v0Wen = 0x%0h ",pkt_str,this.io_enq_req_1_bits_v0Wen);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vlWen = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vlWen);
    pkt_str = $sformatf("%sio_enq_req_1_bits_isXSTrap = 0x%0h ",pkt_str,this.io_enq_req_1_bits_isXSTrap);
    pkt_str = $sformatf("%sio_enq_req_1_bits_waitForward = 0x%0h ",pkt_str,this.io_enq_req_1_bits_waitForward);
    pkt_str = $sformatf("%sio_enq_req_1_bits_blockBackward = 0x%0h ",pkt_str,this.io_enq_req_1_bits_blockBackward);
    pkt_str = $sformatf("%sio_enq_req_1_bits_flushPipe = 0x%0h ",pkt_str,this.io_enq_req_1_bits_flushPipe);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vpu_vill = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vpu_vill);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vpu_vma = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vpu_vma);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vpu_vta = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vpu_vta);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vpu_vsew = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vpu_vsew);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vpu_vlmul = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vpu_vlmul);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vpu_specVill = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vpu_specVill);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vpu_specVma = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vpu_specVma);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vpu_specVta = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vpu_specVta);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vpu_specVsew = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vpu_specVsew);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vpu_specVlmul = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vpu_specVlmul);
    pkt_str = $sformatf("%sio_enq_req_1_bits_vlsInstr = 0x%0h ",pkt_str,this.io_enq_req_1_bits_vlsInstr);
    pkt_str = $sformatf("%sio_enq_req_1_bits_wfflags = 0x%0h ",pkt_str,this.io_enq_req_1_bits_wfflags);
    pkt_str = $sformatf("%sio_enq_req_1_bits_isMove = 0x%0h ",pkt_str,this.io_enq_req_1_bits_isMove);
    pkt_str = $sformatf("%sio_enq_req_1_bits_isVset = 0x%0h ",pkt_str,this.io_enq_req_1_bits_isVset);
    pkt_str = $sformatf("%sio_enq_req_1_bits_firstUop = 0x%0h ",pkt_str,this.io_enq_req_1_bits_firstUop);
    pkt_str = $sformatf("%sio_enq_req_1_bits_lastUop = 0x%0h ",pkt_str,this.io_enq_req_1_bits_lastUop);
    pkt_str = $sformatf("%sio_enq_req_1_bits_numWB = 0x%0h ",pkt_str,this.io_enq_req_1_bits_numWB);
    pkt_str = $sformatf("%sio_enq_req_1_bits_commitType = 0x%0h ",pkt_str,this.io_enq_req_1_bits_commitType);
    pkt_str = $sformatf("%sio_enq_req_1_bits_pdest = 0x%0h ",pkt_str,this.io_enq_req_1_bits_pdest);
    pkt_str = $sformatf("%sio_enq_req_1_bits_robIdx_flag = 0x%0h ",pkt_str,this.io_enq_req_1_bits_robIdx_flag);
    pkt_str = $sformatf("%sio_enq_req_1_bits_robIdx_value = 0x%0h ",pkt_str,this.io_enq_req_1_bits_robIdx_value);
    pkt_str = $sformatf("%sio_enq_req_1_bits_instrSize = 0x%0h ",pkt_str,this.io_enq_req_1_bits_instrSize);
    pkt_str = $sformatf("%sio_enq_req_1_bits_dirtyFs = 0x%0h ",pkt_str,this.io_enq_req_1_bits_dirtyFs);
    pkt_str = $sformatf("%sio_enq_req_1_bits_dirtyVs = 0x%0h ",pkt_str,this.io_enq_req_1_bits_dirtyVs);
    pkt_str = $sformatf("%sio_enq_req_1_bits_traceBlockInPipe_itype = 0x%0h ",pkt_str,this.io_enq_req_1_bits_traceBlockInPipe_itype);
    pkt_str = $sformatf("%sio_enq_req_1_bits_traceBlockInPipe_iretire = 0x%0h ",pkt_str,this.io_enq_req_1_bits_traceBlockInPipe_iretire);
    pkt_str = $sformatf("%sio_enq_req_1_bits_traceBlockInPipe_ilastsize = 0x%0h ",pkt_str,this.io_enq_req_1_bits_traceBlockInPipe_ilastsize);
    pkt_str = $sformatf("%sio_enq_req_1_bits_eliminatedMove = 0x%0h ",pkt_str,this.io_enq_req_1_bits_eliminatedMove);
    pkt_str = $sformatf("%sio_enq_req_1_bits_snapshot = 0x%0h ",pkt_str,this.io_enq_req_1_bits_snapshot);
    pkt_str = $sformatf("%sio_enq_req_1_bits_lqIdx_value = 0x%0h ",pkt_str,this.io_enq_req_1_bits_lqIdx_value);
    pkt_str = $sformatf("%sio_enq_req_1_bits_sqIdx_value = 0x%0h ",pkt_str,this.io_enq_req_1_bits_sqIdx_value);
    pkt_str = $sformatf("%sio_enq_req_1_bits_singleStep = 0x%0h ",pkt_str,this.io_enq_req_1_bits_singleStep);
    pkt_str = $sformatf("%sio_enq_req_1_bits_debug_sim_trig = 0x%0h ",pkt_str,this.io_enq_req_1_bits_debug_sim_trig);
    pkt_str = $sformatf("%sio_enq_req_2_valid = 0x%0h ",pkt_str,this.io_enq_req_2_valid);
    pkt_str = $sformatf("%sio_enq_req_2_bits_instr = 0x%0h ",pkt_str,this.io_enq_req_2_bits_instr);
    pkt_str = $sformatf("%sio_enq_req_2_bits_pc = 0x%0h ",pkt_str,this.io_enq_req_2_bits_pc);
    pkt_str = $sformatf("%sio_enq_req_2_bits_exceptionVec_0 = 0x%0h ",pkt_str,this.io_enq_req_2_bits_exceptionVec_0);
    pkt_str = $sformatf("%sio_enq_req_2_bits_exceptionVec_1 = 0x%0h ",pkt_str,this.io_enq_req_2_bits_exceptionVec_1);
    pkt_str = $sformatf("%sio_enq_req_2_bits_exceptionVec_2 = 0x%0h ",pkt_str,this.io_enq_req_2_bits_exceptionVec_2);
    pkt_str = $sformatf("%sio_enq_req_2_bits_exceptionVec_3 = 0x%0h ",pkt_str,this.io_enq_req_2_bits_exceptionVec_3);
    pkt_str = $sformatf("%sio_enq_req_2_bits_exceptionVec_12 = 0x%0h ",pkt_str,this.io_enq_req_2_bits_exceptionVec_12);
    pkt_str = $sformatf("%sio_enq_req_2_bits_exceptionVec_20 = 0x%0h ",pkt_str,this.io_enq_req_2_bits_exceptionVec_20);
    pkt_str = $sformatf("%sio_enq_req_2_bits_exceptionVec_22 = 0x%0h ",pkt_str,this.io_enq_req_2_bits_exceptionVec_22);
    pkt_str = $sformatf("%sio_enq_req_2_bits_isFetchMalAddr = 0x%0h ",pkt_str,this.io_enq_req_2_bits_isFetchMalAddr);
    pkt_str = $sformatf("%sio_enq_req_2_bits_hasException = 0x%0h ",pkt_str,this.io_enq_req_2_bits_hasException);
    pkt_str = $sformatf("%sio_enq_req_2_bits_trigger = 0x%0h ",pkt_str,this.io_enq_req_2_bits_trigger);
    pkt_str = $sformatf("%sio_enq_req_2_bits_preDecodeInfo_isRVC = 0x%0h ",pkt_str,this.io_enq_req_2_bits_preDecodeInfo_isRVC);
    pkt_str = $sformatf("%sio_enq_req_2_bits_crossPageIPFFix = 0x%0h ",pkt_str,this.io_enq_req_2_bits_crossPageIPFFix);
    pkt_str = $sformatf("%sio_enq_req_2_bits_ftqPtr_flag = 0x%0h ",pkt_str,this.io_enq_req_2_bits_ftqPtr_flag);
    pkt_str = $sformatf("%sio_enq_req_2_bits_ftqPtr_value = 0x%0h ",pkt_str,this.io_enq_req_2_bits_ftqPtr_value);
    pkt_str = $sformatf("%sio_enq_req_2_bits_ftqOffset = 0x%0h ",pkt_str,this.io_enq_req_2_bits_ftqOffset);
    pkt_str = $sformatf("%sio_enq_req_2_bits_ldest = 0x%0h ",pkt_str,this.io_enq_req_2_bits_ldest);
    pkt_str = $sformatf("%sio_enq_req_2_bits_fuType = 0x%0h ",pkt_str,this.io_enq_req_2_bits_fuType);
    pkt_str = $sformatf("%sio_enq_req_2_bits_fuOpType = 0x%0h ",pkt_str,this.io_enq_req_2_bits_fuOpType);
    pkt_str = $sformatf("%sio_enq_req_2_bits_rfWen = 0x%0h ",pkt_str,this.io_enq_req_2_bits_rfWen);
    pkt_str = $sformatf("%sio_enq_req_2_bits_fpWen = 0x%0h ",pkt_str,this.io_enq_req_2_bits_fpWen);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vecWen = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vecWen);
    pkt_str = $sformatf("%sio_enq_req_2_bits_v0Wen = 0x%0h ",pkt_str,this.io_enq_req_2_bits_v0Wen);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vlWen = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vlWen);
    pkt_str = $sformatf("%sio_enq_req_2_bits_isXSTrap = 0x%0h ",pkt_str,this.io_enq_req_2_bits_isXSTrap);
    pkt_str = $sformatf("%sio_enq_req_2_bits_waitForward = 0x%0h ",pkt_str,this.io_enq_req_2_bits_waitForward);
    pkt_str = $sformatf("%sio_enq_req_2_bits_blockBackward = 0x%0h ",pkt_str,this.io_enq_req_2_bits_blockBackward);
    pkt_str = $sformatf("%sio_enq_req_2_bits_flushPipe = 0x%0h ",pkt_str,this.io_enq_req_2_bits_flushPipe);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vpu_vill = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vpu_vill);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vpu_vma = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vpu_vma);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vpu_vta = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vpu_vta);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vpu_vsew = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vpu_vsew);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vpu_vlmul = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vpu_vlmul);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vpu_specVill = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vpu_specVill);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vpu_specVma = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vpu_specVma);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vpu_specVta = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vpu_specVta);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vpu_specVsew = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vpu_specVsew);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vpu_specVlmul = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vpu_specVlmul);
    pkt_str = $sformatf("%sio_enq_req_2_bits_vlsInstr = 0x%0h ",pkt_str,this.io_enq_req_2_bits_vlsInstr);
    pkt_str = $sformatf("%sio_enq_req_2_bits_wfflags = 0x%0h ",pkt_str,this.io_enq_req_2_bits_wfflags);
    pkt_str = $sformatf("%sio_enq_req_2_bits_isMove = 0x%0h ",pkt_str,this.io_enq_req_2_bits_isMove);
    pkt_str = $sformatf("%sio_enq_req_2_bits_isVset = 0x%0h ",pkt_str,this.io_enq_req_2_bits_isVset);
    pkt_str = $sformatf("%sio_enq_req_2_bits_firstUop = 0x%0h ",pkt_str,this.io_enq_req_2_bits_firstUop);
    pkt_str = $sformatf("%sio_enq_req_2_bits_lastUop = 0x%0h ",pkt_str,this.io_enq_req_2_bits_lastUop);
    pkt_str = $sformatf("%sio_enq_req_2_bits_numWB = 0x%0h ",pkt_str,this.io_enq_req_2_bits_numWB);
    pkt_str = $sformatf("%sio_enq_req_2_bits_commitType = 0x%0h ",pkt_str,this.io_enq_req_2_bits_commitType);
    pkt_str = $sformatf("%sio_enq_req_2_bits_pdest = 0x%0h ",pkt_str,this.io_enq_req_2_bits_pdest);
    pkt_str = $sformatf("%sio_enq_req_2_bits_robIdx_flag = 0x%0h ",pkt_str,this.io_enq_req_2_bits_robIdx_flag);
    pkt_str = $sformatf("%sio_enq_req_2_bits_robIdx_value = 0x%0h ",pkt_str,this.io_enq_req_2_bits_robIdx_value);
    pkt_str = $sformatf("%sio_enq_req_2_bits_instrSize = 0x%0h ",pkt_str,this.io_enq_req_2_bits_instrSize);
    pkt_str = $sformatf("%sio_enq_req_2_bits_dirtyFs = 0x%0h ",pkt_str,this.io_enq_req_2_bits_dirtyFs);
    pkt_str = $sformatf("%sio_enq_req_2_bits_dirtyVs = 0x%0h ",pkt_str,this.io_enq_req_2_bits_dirtyVs);
    pkt_str = $sformatf("%sio_enq_req_2_bits_traceBlockInPipe_itype = 0x%0h ",pkt_str,this.io_enq_req_2_bits_traceBlockInPipe_itype);
    pkt_str = $sformatf("%sio_enq_req_2_bits_traceBlockInPipe_iretire = 0x%0h ",pkt_str,this.io_enq_req_2_bits_traceBlockInPipe_iretire);
    pkt_str = $sformatf("%sio_enq_req_2_bits_traceBlockInPipe_ilastsize = 0x%0h ",pkt_str,this.io_enq_req_2_bits_traceBlockInPipe_ilastsize);
    pkt_str = $sformatf("%sio_enq_req_2_bits_eliminatedMove = 0x%0h ",pkt_str,this.io_enq_req_2_bits_eliminatedMove);
    pkt_str = $sformatf("%sio_enq_req_2_bits_snapshot = 0x%0h ",pkt_str,this.io_enq_req_2_bits_snapshot);
    pkt_str = $sformatf("%sio_enq_req_2_bits_lqIdx_value = 0x%0h ",pkt_str,this.io_enq_req_2_bits_lqIdx_value);
    pkt_str = $sformatf("%sio_enq_req_2_bits_sqIdx_value = 0x%0h ",pkt_str,this.io_enq_req_2_bits_sqIdx_value);
    pkt_str = $sformatf("%sio_enq_req_2_bits_singleStep = 0x%0h ",pkt_str,this.io_enq_req_2_bits_singleStep);
    pkt_str = $sformatf("%sio_enq_req_2_bits_debug_sim_trig = 0x%0h ",pkt_str,this.io_enq_req_2_bits_debug_sim_trig);
    pkt_str = $sformatf("%sio_enq_req_3_valid = 0x%0h ",pkt_str,this.io_enq_req_3_valid);
    pkt_str = $sformatf("%sio_enq_req_3_bits_instr = 0x%0h ",pkt_str,this.io_enq_req_3_bits_instr);
    pkt_str = $sformatf("%sio_enq_req_3_bits_pc = 0x%0h ",pkt_str,this.io_enq_req_3_bits_pc);
    pkt_str = $sformatf("%sio_enq_req_3_bits_exceptionVec_0 = 0x%0h ",pkt_str,this.io_enq_req_3_bits_exceptionVec_0);
    pkt_str = $sformatf("%sio_enq_req_3_bits_exceptionVec_1 = 0x%0h ",pkt_str,this.io_enq_req_3_bits_exceptionVec_1);
    pkt_str = $sformatf("%sio_enq_req_3_bits_exceptionVec_2 = 0x%0h ",pkt_str,this.io_enq_req_3_bits_exceptionVec_2);
    pkt_str = $sformatf("%sio_enq_req_3_bits_exceptionVec_3 = 0x%0h ",pkt_str,this.io_enq_req_3_bits_exceptionVec_3);
    pkt_str = $sformatf("%sio_enq_req_3_bits_exceptionVec_12 = 0x%0h ",pkt_str,this.io_enq_req_3_bits_exceptionVec_12);
    pkt_str = $sformatf("%sio_enq_req_3_bits_exceptionVec_20 = 0x%0h ",pkt_str,this.io_enq_req_3_bits_exceptionVec_20);
    pkt_str = $sformatf("%sio_enq_req_3_bits_exceptionVec_22 = 0x%0h ",pkt_str,this.io_enq_req_3_bits_exceptionVec_22);
    pkt_str = $sformatf("%sio_enq_req_3_bits_isFetchMalAddr = 0x%0h ",pkt_str,this.io_enq_req_3_bits_isFetchMalAddr);
    pkt_str = $sformatf("%sio_enq_req_3_bits_hasException = 0x%0h ",pkt_str,this.io_enq_req_3_bits_hasException);
    pkt_str = $sformatf("%sio_enq_req_3_bits_trigger = 0x%0h ",pkt_str,this.io_enq_req_3_bits_trigger);
    pkt_str = $sformatf("%sio_enq_req_3_bits_preDecodeInfo_isRVC = 0x%0h ",pkt_str,this.io_enq_req_3_bits_preDecodeInfo_isRVC);
    pkt_str = $sformatf("%sio_enq_req_3_bits_crossPageIPFFix = 0x%0h ",pkt_str,this.io_enq_req_3_bits_crossPageIPFFix);
    pkt_str = $sformatf("%sio_enq_req_3_bits_ftqPtr_flag = 0x%0h ",pkt_str,this.io_enq_req_3_bits_ftqPtr_flag);
    pkt_str = $sformatf("%sio_enq_req_3_bits_ftqPtr_value = 0x%0h ",pkt_str,this.io_enq_req_3_bits_ftqPtr_value);
    pkt_str = $sformatf("%sio_enq_req_3_bits_ftqOffset = 0x%0h ",pkt_str,this.io_enq_req_3_bits_ftqOffset);
    pkt_str = $sformatf("%sio_enq_req_3_bits_ldest = 0x%0h ",pkt_str,this.io_enq_req_3_bits_ldest);
    pkt_str = $sformatf("%sio_enq_req_3_bits_fuType = 0x%0h ",pkt_str,this.io_enq_req_3_bits_fuType);
    pkt_str = $sformatf("%sio_enq_req_3_bits_fuOpType = 0x%0h ",pkt_str,this.io_enq_req_3_bits_fuOpType);
    pkt_str = $sformatf("%sio_enq_req_3_bits_rfWen = 0x%0h ",pkt_str,this.io_enq_req_3_bits_rfWen);
    pkt_str = $sformatf("%sio_enq_req_3_bits_fpWen = 0x%0h ",pkt_str,this.io_enq_req_3_bits_fpWen);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vecWen = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vecWen);
    pkt_str = $sformatf("%sio_enq_req_3_bits_v0Wen = 0x%0h ",pkt_str,this.io_enq_req_3_bits_v0Wen);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vlWen = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vlWen);
    pkt_str = $sformatf("%sio_enq_req_3_bits_isXSTrap = 0x%0h ",pkt_str,this.io_enq_req_3_bits_isXSTrap);
    pkt_str = $sformatf("%sio_enq_req_3_bits_waitForward = 0x%0h ",pkt_str,this.io_enq_req_3_bits_waitForward);
    pkt_str = $sformatf("%sio_enq_req_3_bits_blockBackward = 0x%0h ",pkt_str,this.io_enq_req_3_bits_blockBackward);
    pkt_str = $sformatf("%sio_enq_req_3_bits_flushPipe = 0x%0h ",pkt_str,this.io_enq_req_3_bits_flushPipe);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vpu_vill = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vpu_vill);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vpu_vma = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vpu_vma);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vpu_vta = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vpu_vta);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vpu_vsew = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vpu_vsew);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vpu_vlmul = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vpu_vlmul);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vpu_specVill = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vpu_specVill);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vpu_specVma = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vpu_specVma);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vpu_specVta = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vpu_specVta);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vpu_specVsew = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vpu_specVsew);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vpu_specVlmul = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vpu_specVlmul);
    pkt_str = $sformatf("%sio_enq_req_3_bits_vlsInstr = 0x%0h ",pkt_str,this.io_enq_req_3_bits_vlsInstr);
    pkt_str = $sformatf("%sio_enq_req_3_bits_wfflags = 0x%0h ",pkt_str,this.io_enq_req_3_bits_wfflags);
    pkt_str = $sformatf("%sio_enq_req_3_bits_isMove = 0x%0h ",pkt_str,this.io_enq_req_3_bits_isMove);
    pkt_str = $sformatf("%sio_enq_req_3_bits_isVset = 0x%0h ",pkt_str,this.io_enq_req_3_bits_isVset);
    pkt_str = $sformatf("%sio_enq_req_3_bits_firstUop = 0x%0h ",pkt_str,this.io_enq_req_3_bits_firstUop);
    pkt_str = $sformatf("%sio_enq_req_3_bits_lastUop = 0x%0h ",pkt_str,this.io_enq_req_3_bits_lastUop);
    pkt_str = $sformatf("%sio_enq_req_3_bits_numWB = 0x%0h ",pkt_str,this.io_enq_req_3_bits_numWB);
    pkt_str = $sformatf("%sio_enq_req_3_bits_commitType = 0x%0h ",pkt_str,this.io_enq_req_3_bits_commitType);
    pkt_str = $sformatf("%sio_enq_req_3_bits_pdest = 0x%0h ",pkt_str,this.io_enq_req_3_bits_pdest);
    pkt_str = $sformatf("%sio_enq_req_3_bits_robIdx_flag = 0x%0h ",pkt_str,this.io_enq_req_3_bits_robIdx_flag);
    pkt_str = $sformatf("%sio_enq_req_3_bits_robIdx_value = 0x%0h ",pkt_str,this.io_enq_req_3_bits_robIdx_value);
    pkt_str = $sformatf("%sio_enq_req_3_bits_instrSize = 0x%0h ",pkt_str,this.io_enq_req_3_bits_instrSize);
    pkt_str = $sformatf("%sio_enq_req_3_bits_dirtyFs = 0x%0h ",pkt_str,this.io_enq_req_3_bits_dirtyFs);
    pkt_str = $sformatf("%sio_enq_req_3_bits_dirtyVs = 0x%0h ",pkt_str,this.io_enq_req_3_bits_dirtyVs);
    pkt_str = $sformatf("%sio_enq_req_3_bits_traceBlockInPipe_itype = 0x%0h ",pkt_str,this.io_enq_req_3_bits_traceBlockInPipe_itype);
    pkt_str = $sformatf("%sio_enq_req_3_bits_traceBlockInPipe_iretire = 0x%0h ",pkt_str,this.io_enq_req_3_bits_traceBlockInPipe_iretire);
    pkt_str = $sformatf("%sio_enq_req_3_bits_traceBlockInPipe_ilastsize = 0x%0h ",pkt_str,this.io_enq_req_3_bits_traceBlockInPipe_ilastsize);
    pkt_str = $sformatf("%sio_enq_req_3_bits_eliminatedMove = 0x%0h ",pkt_str,this.io_enq_req_3_bits_eliminatedMove);
    pkt_str = $sformatf("%sio_enq_req_3_bits_snapshot = 0x%0h ",pkt_str,this.io_enq_req_3_bits_snapshot);
    pkt_str = $sformatf("%sio_enq_req_3_bits_lqIdx_value = 0x%0h ",pkt_str,this.io_enq_req_3_bits_lqIdx_value);
    pkt_str = $sformatf("%sio_enq_req_3_bits_sqIdx_value = 0x%0h ",pkt_str,this.io_enq_req_3_bits_sqIdx_value);
    pkt_str = $sformatf("%sio_enq_req_3_bits_singleStep = 0x%0h ",pkt_str,this.io_enq_req_3_bits_singleStep);
    pkt_str = $sformatf("%sio_enq_req_3_bits_debug_sim_trig = 0x%0h ",pkt_str,this.io_enq_req_3_bits_debug_sim_trig);
    pkt_str = $sformatf("%sio_enq_req_4_valid = 0x%0h ",pkt_str,this.io_enq_req_4_valid);
    pkt_str = $sformatf("%sio_enq_req_4_bits_instr = 0x%0h ",pkt_str,this.io_enq_req_4_bits_instr);
    pkt_str = $sformatf("%sio_enq_req_4_bits_pc = 0x%0h ",pkt_str,this.io_enq_req_4_bits_pc);
    pkt_str = $sformatf("%sio_enq_req_4_bits_exceptionVec_0 = 0x%0h ",pkt_str,this.io_enq_req_4_bits_exceptionVec_0);
    pkt_str = $sformatf("%sio_enq_req_4_bits_exceptionVec_1 = 0x%0h ",pkt_str,this.io_enq_req_4_bits_exceptionVec_1);
    pkt_str = $sformatf("%sio_enq_req_4_bits_exceptionVec_2 = 0x%0h ",pkt_str,this.io_enq_req_4_bits_exceptionVec_2);
    pkt_str = $sformatf("%sio_enq_req_4_bits_exceptionVec_3 = 0x%0h ",pkt_str,this.io_enq_req_4_bits_exceptionVec_3);
    pkt_str = $sformatf("%sio_enq_req_4_bits_exceptionVec_12 = 0x%0h ",pkt_str,this.io_enq_req_4_bits_exceptionVec_12);
    pkt_str = $sformatf("%sio_enq_req_4_bits_exceptionVec_20 = 0x%0h ",pkt_str,this.io_enq_req_4_bits_exceptionVec_20);
    pkt_str = $sformatf("%sio_enq_req_4_bits_exceptionVec_22 = 0x%0h ",pkt_str,this.io_enq_req_4_bits_exceptionVec_22);
    pkt_str = $sformatf("%sio_enq_req_4_bits_isFetchMalAddr = 0x%0h ",pkt_str,this.io_enq_req_4_bits_isFetchMalAddr);
    pkt_str = $sformatf("%sio_enq_req_4_bits_hasException = 0x%0h ",pkt_str,this.io_enq_req_4_bits_hasException);
    pkt_str = $sformatf("%sio_enq_req_4_bits_trigger = 0x%0h ",pkt_str,this.io_enq_req_4_bits_trigger);
    pkt_str = $sformatf("%sio_enq_req_4_bits_preDecodeInfo_isRVC = 0x%0h ",pkt_str,this.io_enq_req_4_bits_preDecodeInfo_isRVC);
    pkt_str = $sformatf("%sio_enq_req_4_bits_crossPageIPFFix = 0x%0h ",pkt_str,this.io_enq_req_4_bits_crossPageIPFFix);
    pkt_str = $sformatf("%sio_enq_req_4_bits_ftqPtr_flag = 0x%0h ",pkt_str,this.io_enq_req_4_bits_ftqPtr_flag);
    pkt_str = $sformatf("%sio_enq_req_4_bits_ftqPtr_value = 0x%0h ",pkt_str,this.io_enq_req_4_bits_ftqPtr_value);
    pkt_str = $sformatf("%sio_enq_req_4_bits_ftqOffset = 0x%0h ",pkt_str,this.io_enq_req_4_bits_ftqOffset);
    pkt_str = $sformatf("%sio_enq_req_4_bits_ldest = 0x%0h ",pkt_str,this.io_enq_req_4_bits_ldest);
    pkt_str = $sformatf("%sio_enq_req_4_bits_fuType = 0x%0h ",pkt_str,this.io_enq_req_4_bits_fuType);
    pkt_str = $sformatf("%sio_enq_req_4_bits_fuOpType = 0x%0h ",pkt_str,this.io_enq_req_4_bits_fuOpType);
    pkt_str = $sformatf("%sio_enq_req_4_bits_rfWen = 0x%0h ",pkt_str,this.io_enq_req_4_bits_rfWen);
    pkt_str = $sformatf("%sio_enq_req_4_bits_fpWen = 0x%0h ",pkt_str,this.io_enq_req_4_bits_fpWen);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vecWen = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vecWen);
    pkt_str = $sformatf("%sio_enq_req_4_bits_v0Wen = 0x%0h ",pkt_str,this.io_enq_req_4_bits_v0Wen);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vlWen = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vlWen);
    pkt_str = $sformatf("%sio_enq_req_4_bits_isXSTrap = 0x%0h ",pkt_str,this.io_enq_req_4_bits_isXSTrap);
    pkt_str = $sformatf("%sio_enq_req_4_bits_waitForward = 0x%0h ",pkt_str,this.io_enq_req_4_bits_waitForward);
    pkt_str = $sformatf("%sio_enq_req_4_bits_blockBackward = 0x%0h ",pkt_str,this.io_enq_req_4_bits_blockBackward);
    pkt_str = $sformatf("%sio_enq_req_4_bits_flushPipe = 0x%0h ",pkt_str,this.io_enq_req_4_bits_flushPipe);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vpu_vill = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vpu_vill);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vpu_vma = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vpu_vma);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vpu_vta = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vpu_vta);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vpu_vsew = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vpu_vsew);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vpu_vlmul = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vpu_vlmul);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vpu_specVill = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vpu_specVill);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vpu_specVma = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vpu_specVma);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vpu_specVta = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vpu_specVta);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vpu_specVsew = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vpu_specVsew);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vpu_specVlmul = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vpu_specVlmul);
    pkt_str = $sformatf("%sio_enq_req_4_bits_vlsInstr = 0x%0h ",pkt_str,this.io_enq_req_4_bits_vlsInstr);
    pkt_str = $sformatf("%sio_enq_req_4_bits_wfflags = 0x%0h ",pkt_str,this.io_enq_req_4_bits_wfflags);
    pkt_str = $sformatf("%sio_enq_req_4_bits_isMove = 0x%0h ",pkt_str,this.io_enq_req_4_bits_isMove);
    pkt_str = $sformatf("%sio_enq_req_4_bits_isVset = 0x%0h ",pkt_str,this.io_enq_req_4_bits_isVset);
    pkt_str = $sformatf("%sio_enq_req_4_bits_firstUop = 0x%0h ",pkt_str,this.io_enq_req_4_bits_firstUop);
    pkt_str = $sformatf("%sio_enq_req_4_bits_lastUop = 0x%0h ",pkt_str,this.io_enq_req_4_bits_lastUop);
    pkt_str = $sformatf("%sio_enq_req_4_bits_numWB = 0x%0h ",pkt_str,this.io_enq_req_4_bits_numWB);
    pkt_str = $sformatf("%sio_enq_req_4_bits_commitType = 0x%0h ",pkt_str,this.io_enq_req_4_bits_commitType);
    pkt_str = $sformatf("%sio_enq_req_4_bits_pdest = 0x%0h ",pkt_str,this.io_enq_req_4_bits_pdest);
    pkt_str = $sformatf("%sio_enq_req_4_bits_robIdx_flag = 0x%0h ",pkt_str,this.io_enq_req_4_bits_robIdx_flag);
    pkt_str = $sformatf("%sio_enq_req_4_bits_robIdx_value = 0x%0h ",pkt_str,this.io_enq_req_4_bits_robIdx_value);
    pkt_str = $sformatf("%sio_enq_req_4_bits_instrSize = 0x%0h ",pkt_str,this.io_enq_req_4_bits_instrSize);
    pkt_str = $sformatf("%sio_enq_req_4_bits_dirtyFs = 0x%0h ",pkt_str,this.io_enq_req_4_bits_dirtyFs);
    pkt_str = $sformatf("%sio_enq_req_4_bits_dirtyVs = 0x%0h ",pkt_str,this.io_enq_req_4_bits_dirtyVs);
    pkt_str = $sformatf("%sio_enq_req_4_bits_traceBlockInPipe_itype = 0x%0h ",pkt_str,this.io_enq_req_4_bits_traceBlockInPipe_itype);
    pkt_str = $sformatf("%sio_enq_req_4_bits_traceBlockInPipe_iretire = 0x%0h ",pkt_str,this.io_enq_req_4_bits_traceBlockInPipe_iretire);
    pkt_str = $sformatf("%sio_enq_req_4_bits_traceBlockInPipe_ilastsize = 0x%0h ",pkt_str,this.io_enq_req_4_bits_traceBlockInPipe_ilastsize);
    pkt_str = $sformatf("%sio_enq_req_4_bits_eliminatedMove = 0x%0h ",pkt_str,this.io_enq_req_4_bits_eliminatedMove);
    pkt_str = $sformatf("%sio_enq_req_4_bits_snapshot = 0x%0h ",pkt_str,this.io_enq_req_4_bits_snapshot);
    pkt_str = $sformatf("%sio_enq_req_4_bits_lqIdx_value = 0x%0h ",pkt_str,this.io_enq_req_4_bits_lqIdx_value);
    pkt_str = $sformatf("%sio_enq_req_4_bits_sqIdx_value = 0x%0h ",pkt_str,this.io_enq_req_4_bits_sqIdx_value);
    pkt_str = $sformatf("%sio_enq_req_4_bits_singleStep = 0x%0h ",pkt_str,this.io_enq_req_4_bits_singleStep);
    pkt_str = $sformatf("%sio_enq_req_4_bits_debug_sim_trig = 0x%0h ",pkt_str,this.io_enq_req_4_bits_debug_sim_trig);
    pkt_str = $sformatf("%sio_enq_req_5_valid = 0x%0h ",pkt_str,this.io_enq_req_5_valid);
    pkt_str = $sformatf("%sio_enq_req_5_bits_instr = 0x%0h ",pkt_str,this.io_enq_req_5_bits_instr);
    pkt_str = $sformatf("%sio_enq_req_5_bits_pc = 0x%0h ",pkt_str,this.io_enq_req_5_bits_pc);
    pkt_str = $sformatf("%sio_enq_req_5_bits_exceptionVec_0 = 0x%0h ",pkt_str,this.io_enq_req_5_bits_exceptionVec_0);
    pkt_str = $sformatf("%sio_enq_req_5_bits_exceptionVec_1 = 0x%0h ",pkt_str,this.io_enq_req_5_bits_exceptionVec_1);
    pkt_str = $sformatf("%sio_enq_req_5_bits_exceptionVec_2 = 0x%0h ",pkt_str,this.io_enq_req_5_bits_exceptionVec_2);
    pkt_str = $sformatf("%sio_enq_req_5_bits_exceptionVec_3 = 0x%0h ",pkt_str,this.io_enq_req_5_bits_exceptionVec_3);
    pkt_str = $sformatf("%sio_enq_req_5_bits_exceptionVec_12 = 0x%0h ",pkt_str,this.io_enq_req_5_bits_exceptionVec_12);
    pkt_str = $sformatf("%sio_enq_req_5_bits_exceptionVec_20 = 0x%0h ",pkt_str,this.io_enq_req_5_bits_exceptionVec_20);
    pkt_str = $sformatf("%sio_enq_req_5_bits_exceptionVec_22 = 0x%0h ",pkt_str,this.io_enq_req_5_bits_exceptionVec_22);
    pkt_str = $sformatf("%sio_enq_req_5_bits_isFetchMalAddr = 0x%0h ",pkt_str,this.io_enq_req_5_bits_isFetchMalAddr);
    pkt_str = $sformatf("%sio_enq_req_5_bits_hasException = 0x%0h ",pkt_str,this.io_enq_req_5_bits_hasException);
    pkt_str = $sformatf("%sio_enq_req_5_bits_trigger = 0x%0h ",pkt_str,this.io_enq_req_5_bits_trigger);
    pkt_str = $sformatf("%sio_enq_req_5_bits_preDecodeInfo_isRVC = 0x%0h ",pkt_str,this.io_enq_req_5_bits_preDecodeInfo_isRVC);
    pkt_str = $sformatf("%sio_enq_req_5_bits_crossPageIPFFix = 0x%0h ",pkt_str,this.io_enq_req_5_bits_crossPageIPFFix);
    pkt_str = $sformatf("%sio_enq_req_5_bits_ftqPtr_flag = 0x%0h ",pkt_str,this.io_enq_req_5_bits_ftqPtr_flag);
    pkt_str = $sformatf("%sio_enq_req_5_bits_ftqPtr_value = 0x%0h ",pkt_str,this.io_enq_req_5_bits_ftqPtr_value);
    pkt_str = $sformatf("%sio_enq_req_5_bits_ftqOffset = 0x%0h ",pkt_str,this.io_enq_req_5_bits_ftqOffset);
    pkt_str = $sformatf("%sio_enq_req_5_bits_ldest = 0x%0h ",pkt_str,this.io_enq_req_5_bits_ldest);
    pkt_str = $sformatf("%sio_enq_req_5_bits_fuType = 0x%0h ",pkt_str,this.io_enq_req_5_bits_fuType);
    pkt_str = $sformatf("%sio_enq_req_5_bits_fuOpType = 0x%0h ",pkt_str,this.io_enq_req_5_bits_fuOpType);
    pkt_str = $sformatf("%sio_enq_req_5_bits_rfWen = 0x%0h ",pkt_str,this.io_enq_req_5_bits_rfWen);
    pkt_str = $sformatf("%sio_enq_req_5_bits_fpWen = 0x%0h ",pkt_str,this.io_enq_req_5_bits_fpWen);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vecWen = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vecWen);
    pkt_str = $sformatf("%sio_enq_req_5_bits_v0Wen = 0x%0h ",pkt_str,this.io_enq_req_5_bits_v0Wen);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vlWen = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vlWen);
    pkt_str = $sformatf("%sio_enq_req_5_bits_isXSTrap = 0x%0h ",pkt_str,this.io_enq_req_5_bits_isXSTrap);
    pkt_str = $sformatf("%sio_enq_req_5_bits_waitForward = 0x%0h ",pkt_str,this.io_enq_req_5_bits_waitForward);
    pkt_str = $sformatf("%sio_enq_req_5_bits_blockBackward = 0x%0h ",pkt_str,this.io_enq_req_5_bits_blockBackward);
    pkt_str = $sformatf("%sio_enq_req_5_bits_flushPipe = 0x%0h ",pkt_str,this.io_enq_req_5_bits_flushPipe);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vpu_vill = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vpu_vill);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vpu_vma = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vpu_vma);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vpu_vta = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vpu_vta);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vpu_vsew = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vpu_vsew);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vpu_vlmul = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vpu_vlmul);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vpu_specVill = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vpu_specVill);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vpu_specVma = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vpu_specVma);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vpu_specVta = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vpu_specVta);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vpu_specVsew = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vpu_specVsew);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vpu_specVlmul = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vpu_specVlmul);
    pkt_str = $sformatf("%sio_enq_req_5_bits_vlsInstr = 0x%0h ",pkt_str,this.io_enq_req_5_bits_vlsInstr);
    pkt_str = $sformatf("%sio_enq_req_5_bits_wfflags = 0x%0h ",pkt_str,this.io_enq_req_5_bits_wfflags);
    pkt_str = $sformatf("%sio_enq_req_5_bits_isMove = 0x%0h ",pkt_str,this.io_enq_req_5_bits_isMove);
    pkt_str = $sformatf("%sio_enq_req_5_bits_isVset = 0x%0h ",pkt_str,this.io_enq_req_5_bits_isVset);
    pkt_str = $sformatf("%sio_enq_req_5_bits_firstUop = 0x%0h ",pkt_str,this.io_enq_req_5_bits_firstUop);
    pkt_str = $sformatf("%sio_enq_req_5_bits_lastUop = 0x%0h ",pkt_str,this.io_enq_req_5_bits_lastUop);
    pkt_str = $sformatf("%sio_enq_req_5_bits_numWB = 0x%0h ",pkt_str,this.io_enq_req_5_bits_numWB);
    pkt_str = $sformatf("%sio_enq_req_5_bits_commitType = 0x%0h ",pkt_str,this.io_enq_req_5_bits_commitType);
    pkt_str = $sformatf("%sio_enq_req_5_bits_pdest = 0x%0h ",pkt_str,this.io_enq_req_5_bits_pdest);
    pkt_str = $sformatf("%sio_enq_req_5_bits_robIdx_flag = 0x%0h ",pkt_str,this.io_enq_req_5_bits_robIdx_flag);
    pkt_str = $sformatf("%sio_enq_req_5_bits_robIdx_value = 0x%0h ",pkt_str,this.io_enq_req_5_bits_robIdx_value);
    pkt_str = $sformatf("%sio_enq_req_5_bits_instrSize = 0x%0h ",pkt_str,this.io_enq_req_5_bits_instrSize);
    pkt_str = $sformatf("%sio_enq_req_5_bits_dirtyFs = 0x%0h ",pkt_str,this.io_enq_req_5_bits_dirtyFs);
    pkt_str = $sformatf("%sio_enq_req_5_bits_dirtyVs = 0x%0h ",pkt_str,this.io_enq_req_5_bits_dirtyVs);
    pkt_str = $sformatf("%sio_enq_req_5_bits_traceBlockInPipe_itype = 0x%0h ",pkt_str,this.io_enq_req_5_bits_traceBlockInPipe_itype);
    pkt_str = $sformatf("%sio_enq_req_5_bits_traceBlockInPipe_iretire = 0x%0h ",pkt_str,this.io_enq_req_5_bits_traceBlockInPipe_iretire);
    pkt_str = $sformatf("%sio_enq_req_5_bits_traceBlockInPipe_ilastsize = 0x%0h ",pkt_str,this.io_enq_req_5_bits_traceBlockInPipe_ilastsize);
    pkt_str = $sformatf("%sio_enq_req_5_bits_eliminatedMove = 0x%0h ",pkt_str,this.io_enq_req_5_bits_eliminatedMove);
    pkt_str = $sformatf("%sio_enq_req_5_bits_snapshot = 0x%0h ",pkt_str,this.io_enq_req_5_bits_snapshot);
    pkt_str = $sformatf("%sio_enq_req_5_bits_lqIdx_value = 0x%0h ",pkt_str,this.io_enq_req_5_bits_lqIdx_value);
    pkt_str = $sformatf("%sio_enq_req_5_bits_sqIdx_value = 0x%0h ",pkt_str,this.io_enq_req_5_bits_sqIdx_value);
    pkt_str = $sformatf("%sio_enq_req_5_bits_singleStep = 0x%0h ",pkt_str,this.io_enq_req_5_bits_singleStep);
    pkt_str = $sformatf("%sio_enq_req_5_bits_debug_sim_trig = 0x%0h ",pkt_str,this.io_enq_req_5_bits_debug_sim_trig);

    return pkt_str;
endfunction:psdisplay

function bit rename_in_agent_xaction::compare(uvm_object rhs, uvm_comparer comparer=null);
    bit super_result;
    rename_in_agent_xaction  rhs_;
    if(!$cast(rhs_, rhs)) begin
        `uvm_fatal(get_type_name(),$sformatf("rhs is not a rename_in_agent_xaction or its extend"))
    end
    super_result = super.compare(rhs_,comparer);
    if(super_result==0) begin
        super_result = 1;
        //foreach(this.pload_q[i]) begin
        //    if(this.pload_q[i]!=rhs_.pload_q[i]) begin
        //        super_result = 0;
        //        `uvm_info(get_type_name(),$sformatf("compare fail for this.pload[%0d]=0x%2h while the rhs_.pload[%0d]=0x%2h",i,this.pload_q[i],i,rhs_.pload_q[i]),UVM_NONE)
        //    end
        //end

        if(this.clock!=rhs_.clock) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.clock=0x%0h while the rhs_.clock=0x%0h",this.clock,rhs_.clock),UVM_NONE)
        end

        if(this.reset!=rhs_.reset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.reset=0x%0h while the rhs_.reset=0x%0h",this.reset,rhs_.reset),UVM_NONE)
        end

        if(this.io_hartId!=rhs_.io_hartId) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_hartId=0x%0h while the rhs_.io_hartId=0x%0h",this.io_hartId,rhs_.io_hartId),UVM_NONE)
        end

        if(this.io_enq_req_0_valid!=rhs_.io_enq_req_0_valid) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_valid=0x%0h while the rhs_.io_enq_req_0_valid=0x%0h",this.io_enq_req_0_valid,rhs_.io_enq_req_0_valid),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_instr!=rhs_.io_enq_req_0_bits_instr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_instr=0x%0h while the rhs_.io_enq_req_0_bits_instr=0x%0h",this.io_enq_req_0_bits_instr,rhs_.io_enq_req_0_bits_instr),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_pc!=rhs_.io_enq_req_0_bits_pc) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_pc=0x%0h while the rhs_.io_enq_req_0_bits_pc=0x%0h",this.io_enq_req_0_bits_pc,rhs_.io_enq_req_0_bits_pc),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_exceptionVec_0!=rhs_.io_enq_req_0_bits_exceptionVec_0) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_exceptionVec_0=0x%0h while the rhs_.io_enq_req_0_bits_exceptionVec_0=0x%0h",this.io_enq_req_0_bits_exceptionVec_0,rhs_.io_enq_req_0_bits_exceptionVec_0),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_exceptionVec_1!=rhs_.io_enq_req_0_bits_exceptionVec_1) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_exceptionVec_1=0x%0h while the rhs_.io_enq_req_0_bits_exceptionVec_1=0x%0h",this.io_enq_req_0_bits_exceptionVec_1,rhs_.io_enq_req_0_bits_exceptionVec_1),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_exceptionVec_2!=rhs_.io_enq_req_0_bits_exceptionVec_2) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_exceptionVec_2=0x%0h while the rhs_.io_enq_req_0_bits_exceptionVec_2=0x%0h",this.io_enq_req_0_bits_exceptionVec_2,rhs_.io_enq_req_0_bits_exceptionVec_2),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_exceptionVec_3!=rhs_.io_enq_req_0_bits_exceptionVec_3) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_exceptionVec_3=0x%0h while the rhs_.io_enq_req_0_bits_exceptionVec_3=0x%0h",this.io_enq_req_0_bits_exceptionVec_3,rhs_.io_enq_req_0_bits_exceptionVec_3),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_exceptionVec_12!=rhs_.io_enq_req_0_bits_exceptionVec_12) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_exceptionVec_12=0x%0h while the rhs_.io_enq_req_0_bits_exceptionVec_12=0x%0h",this.io_enq_req_0_bits_exceptionVec_12,rhs_.io_enq_req_0_bits_exceptionVec_12),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_exceptionVec_20!=rhs_.io_enq_req_0_bits_exceptionVec_20) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_exceptionVec_20=0x%0h while the rhs_.io_enq_req_0_bits_exceptionVec_20=0x%0h",this.io_enq_req_0_bits_exceptionVec_20,rhs_.io_enq_req_0_bits_exceptionVec_20),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_exceptionVec_22!=rhs_.io_enq_req_0_bits_exceptionVec_22) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_exceptionVec_22=0x%0h while the rhs_.io_enq_req_0_bits_exceptionVec_22=0x%0h",this.io_enq_req_0_bits_exceptionVec_22,rhs_.io_enq_req_0_bits_exceptionVec_22),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_isFetchMalAddr!=rhs_.io_enq_req_0_bits_isFetchMalAddr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_isFetchMalAddr=0x%0h while the rhs_.io_enq_req_0_bits_isFetchMalAddr=0x%0h",this.io_enq_req_0_bits_isFetchMalAddr,rhs_.io_enq_req_0_bits_isFetchMalAddr),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_hasException!=rhs_.io_enq_req_0_bits_hasException) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_hasException=0x%0h while the rhs_.io_enq_req_0_bits_hasException=0x%0h",this.io_enq_req_0_bits_hasException,rhs_.io_enq_req_0_bits_hasException),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_trigger!=rhs_.io_enq_req_0_bits_trigger) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_trigger=0x%0h while the rhs_.io_enq_req_0_bits_trigger=0x%0h",this.io_enq_req_0_bits_trigger,rhs_.io_enq_req_0_bits_trigger),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_preDecodeInfo_isRVC!=rhs_.io_enq_req_0_bits_preDecodeInfo_isRVC) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_preDecodeInfo_isRVC=0x%0h while the rhs_.io_enq_req_0_bits_preDecodeInfo_isRVC=0x%0h",this.io_enq_req_0_bits_preDecodeInfo_isRVC,rhs_.io_enq_req_0_bits_preDecodeInfo_isRVC),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_crossPageIPFFix!=rhs_.io_enq_req_0_bits_crossPageIPFFix) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_crossPageIPFFix=0x%0h while the rhs_.io_enq_req_0_bits_crossPageIPFFix=0x%0h",this.io_enq_req_0_bits_crossPageIPFFix,rhs_.io_enq_req_0_bits_crossPageIPFFix),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_ftqPtr_flag!=rhs_.io_enq_req_0_bits_ftqPtr_flag) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_ftqPtr_flag=0x%0h while the rhs_.io_enq_req_0_bits_ftqPtr_flag=0x%0h",this.io_enq_req_0_bits_ftqPtr_flag,rhs_.io_enq_req_0_bits_ftqPtr_flag),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_ftqPtr_value!=rhs_.io_enq_req_0_bits_ftqPtr_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_ftqPtr_value=0x%0h while the rhs_.io_enq_req_0_bits_ftqPtr_value=0x%0h",this.io_enq_req_0_bits_ftqPtr_value,rhs_.io_enq_req_0_bits_ftqPtr_value),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_ftqOffset!=rhs_.io_enq_req_0_bits_ftqOffset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_ftqOffset=0x%0h while the rhs_.io_enq_req_0_bits_ftqOffset=0x%0h",this.io_enq_req_0_bits_ftqOffset,rhs_.io_enq_req_0_bits_ftqOffset),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_ldest!=rhs_.io_enq_req_0_bits_ldest) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_ldest=0x%0h while the rhs_.io_enq_req_0_bits_ldest=0x%0h",this.io_enq_req_0_bits_ldest,rhs_.io_enq_req_0_bits_ldest),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_fuType!=rhs_.io_enq_req_0_bits_fuType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_fuType=0x%0h while the rhs_.io_enq_req_0_bits_fuType=0x%0h",this.io_enq_req_0_bits_fuType,rhs_.io_enq_req_0_bits_fuType),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_fuOpType!=rhs_.io_enq_req_0_bits_fuOpType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_fuOpType=0x%0h while the rhs_.io_enq_req_0_bits_fuOpType=0x%0h",this.io_enq_req_0_bits_fuOpType,rhs_.io_enq_req_0_bits_fuOpType),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_rfWen!=rhs_.io_enq_req_0_bits_rfWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_rfWen=0x%0h while the rhs_.io_enq_req_0_bits_rfWen=0x%0h",this.io_enq_req_0_bits_rfWen,rhs_.io_enq_req_0_bits_rfWen),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_fpWen!=rhs_.io_enq_req_0_bits_fpWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_fpWen=0x%0h while the rhs_.io_enq_req_0_bits_fpWen=0x%0h",this.io_enq_req_0_bits_fpWen,rhs_.io_enq_req_0_bits_fpWen),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vecWen!=rhs_.io_enq_req_0_bits_vecWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vecWen=0x%0h while the rhs_.io_enq_req_0_bits_vecWen=0x%0h",this.io_enq_req_0_bits_vecWen,rhs_.io_enq_req_0_bits_vecWen),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_v0Wen!=rhs_.io_enq_req_0_bits_v0Wen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_v0Wen=0x%0h while the rhs_.io_enq_req_0_bits_v0Wen=0x%0h",this.io_enq_req_0_bits_v0Wen,rhs_.io_enq_req_0_bits_v0Wen),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vlWen!=rhs_.io_enq_req_0_bits_vlWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vlWen=0x%0h while the rhs_.io_enq_req_0_bits_vlWen=0x%0h",this.io_enq_req_0_bits_vlWen,rhs_.io_enq_req_0_bits_vlWen),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_isXSTrap!=rhs_.io_enq_req_0_bits_isXSTrap) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_isXSTrap=0x%0h while the rhs_.io_enq_req_0_bits_isXSTrap=0x%0h",this.io_enq_req_0_bits_isXSTrap,rhs_.io_enq_req_0_bits_isXSTrap),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_waitForward!=rhs_.io_enq_req_0_bits_waitForward) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_waitForward=0x%0h while the rhs_.io_enq_req_0_bits_waitForward=0x%0h",this.io_enq_req_0_bits_waitForward,rhs_.io_enq_req_0_bits_waitForward),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_blockBackward!=rhs_.io_enq_req_0_bits_blockBackward) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_blockBackward=0x%0h while the rhs_.io_enq_req_0_bits_blockBackward=0x%0h",this.io_enq_req_0_bits_blockBackward,rhs_.io_enq_req_0_bits_blockBackward),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_flushPipe!=rhs_.io_enq_req_0_bits_flushPipe) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_flushPipe=0x%0h while the rhs_.io_enq_req_0_bits_flushPipe=0x%0h",this.io_enq_req_0_bits_flushPipe,rhs_.io_enq_req_0_bits_flushPipe),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vpu_vill!=rhs_.io_enq_req_0_bits_vpu_vill) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vpu_vill=0x%0h while the rhs_.io_enq_req_0_bits_vpu_vill=0x%0h",this.io_enq_req_0_bits_vpu_vill,rhs_.io_enq_req_0_bits_vpu_vill),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vpu_vma!=rhs_.io_enq_req_0_bits_vpu_vma) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vpu_vma=0x%0h while the rhs_.io_enq_req_0_bits_vpu_vma=0x%0h",this.io_enq_req_0_bits_vpu_vma,rhs_.io_enq_req_0_bits_vpu_vma),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vpu_vta!=rhs_.io_enq_req_0_bits_vpu_vta) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vpu_vta=0x%0h while the rhs_.io_enq_req_0_bits_vpu_vta=0x%0h",this.io_enq_req_0_bits_vpu_vta,rhs_.io_enq_req_0_bits_vpu_vta),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vpu_vsew!=rhs_.io_enq_req_0_bits_vpu_vsew) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vpu_vsew=0x%0h while the rhs_.io_enq_req_0_bits_vpu_vsew=0x%0h",this.io_enq_req_0_bits_vpu_vsew,rhs_.io_enq_req_0_bits_vpu_vsew),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vpu_vlmul!=rhs_.io_enq_req_0_bits_vpu_vlmul) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vpu_vlmul=0x%0h while the rhs_.io_enq_req_0_bits_vpu_vlmul=0x%0h",this.io_enq_req_0_bits_vpu_vlmul,rhs_.io_enq_req_0_bits_vpu_vlmul),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vpu_specVill!=rhs_.io_enq_req_0_bits_vpu_specVill) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vpu_specVill=0x%0h while the rhs_.io_enq_req_0_bits_vpu_specVill=0x%0h",this.io_enq_req_0_bits_vpu_specVill,rhs_.io_enq_req_0_bits_vpu_specVill),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vpu_specVma!=rhs_.io_enq_req_0_bits_vpu_specVma) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vpu_specVma=0x%0h while the rhs_.io_enq_req_0_bits_vpu_specVma=0x%0h",this.io_enq_req_0_bits_vpu_specVma,rhs_.io_enq_req_0_bits_vpu_specVma),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vpu_specVta!=rhs_.io_enq_req_0_bits_vpu_specVta) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vpu_specVta=0x%0h while the rhs_.io_enq_req_0_bits_vpu_specVta=0x%0h",this.io_enq_req_0_bits_vpu_specVta,rhs_.io_enq_req_0_bits_vpu_specVta),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vpu_specVsew!=rhs_.io_enq_req_0_bits_vpu_specVsew) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vpu_specVsew=0x%0h while the rhs_.io_enq_req_0_bits_vpu_specVsew=0x%0h",this.io_enq_req_0_bits_vpu_specVsew,rhs_.io_enq_req_0_bits_vpu_specVsew),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vpu_specVlmul!=rhs_.io_enq_req_0_bits_vpu_specVlmul) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vpu_specVlmul=0x%0h while the rhs_.io_enq_req_0_bits_vpu_specVlmul=0x%0h",this.io_enq_req_0_bits_vpu_specVlmul,rhs_.io_enq_req_0_bits_vpu_specVlmul),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_vlsInstr!=rhs_.io_enq_req_0_bits_vlsInstr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_vlsInstr=0x%0h while the rhs_.io_enq_req_0_bits_vlsInstr=0x%0h",this.io_enq_req_0_bits_vlsInstr,rhs_.io_enq_req_0_bits_vlsInstr),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_wfflags!=rhs_.io_enq_req_0_bits_wfflags) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_wfflags=0x%0h while the rhs_.io_enq_req_0_bits_wfflags=0x%0h",this.io_enq_req_0_bits_wfflags,rhs_.io_enq_req_0_bits_wfflags),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_isMove!=rhs_.io_enq_req_0_bits_isMove) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_isMove=0x%0h while the rhs_.io_enq_req_0_bits_isMove=0x%0h",this.io_enq_req_0_bits_isMove,rhs_.io_enq_req_0_bits_isMove),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_isVset!=rhs_.io_enq_req_0_bits_isVset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_isVset=0x%0h while the rhs_.io_enq_req_0_bits_isVset=0x%0h",this.io_enq_req_0_bits_isVset,rhs_.io_enq_req_0_bits_isVset),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_firstUop!=rhs_.io_enq_req_0_bits_firstUop) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_firstUop=0x%0h while the rhs_.io_enq_req_0_bits_firstUop=0x%0h",this.io_enq_req_0_bits_firstUop,rhs_.io_enq_req_0_bits_firstUop),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_lastUop!=rhs_.io_enq_req_0_bits_lastUop) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_lastUop=0x%0h while the rhs_.io_enq_req_0_bits_lastUop=0x%0h",this.io_enq_req_0_bits_lastUop,rhs_.io_enq_req_0_bits_lastUop),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_numWB!=rhs_.io_enq_req_0_bits_numWB) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_numWB=0x%0h while the rhs_.io_enq_req_0_bits_numWB=0x%0h",this.io_enq_req_0_bits_numWB,rhs_.io_enq_req_0_bits_numWB),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_commitType!=rhs_.io_enq_req_0_bits_commitType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_commitType=0x%0h while the rhs_.io_enq_req_0_bits_commitType=0x%0h",this.io_enq_req_0_bits_commitType,rhs_.io_enq_req_0_bits_commitType),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_pdest!=rhs_.io_enq_req_0_bits_pdest) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_pdest=0x%0h while the rhs_.io_enq_req_0_bits_pdest=0x%0h",this.io_enq_req_0_bits_pdest,rhs_.io_enq_req_0_bits_pdest),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_robIdx_flag!=rhs_.io_enq_req_0_bits_robIdx_flag) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_robIdx_flag=0x%0h while the rhs_.io_enq_req_0_bits_robIdx_flag=0x%0h",this.io_enq_req_0_bits_robIdx_flag,rhs_.io_enq_req_0_bits_robIdx_flag),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_robIdx_value!=rhs_.io_enq_req_0_bits_robIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_robIdx_value=0x%0h while the rhs_.io_enq_req_0_bits_robIdx_value=0x%0h",this.io_enq_req_0_bits_robIdx_value,rhs_.io_enq_req_0_bits_robIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_instrSize!=rhs_.io_enq_req_0_bits_instrSize) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_instrSize=0x%0h while the rhs_.io_enq_req_0_bits_instrSize=0x%0h",this.io_enq_req_0_bits_instrSize,rhs_.io_enq_req_0_bits_instrSize),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_dirtyFs!=rhs_.io_enq_req_0_bits_dirtyFs) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_dirtyFs=0x%0h while the rhs_.io_enq_req_0_bits_dirtyFs=0x%0h",this.io_enq_req_0_bits_dirtyFs,rhs_.io_enq_req_0_bits_dirtyFs),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_dirtyVs!=rhs_.io_enq_req_0_bits_dirtyVs) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_dirtyVs=0x%0h while the rhs_.io_enq_req_0_bits_dirtyVs=0x%0h",this.io_enq_req_0_bits_dirtyVs,rhs_.io_enq_req_0_bits_dirtyVs),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_traceBlockInPipe_itype!=rhs_.io_enq_req_0_bits_traceBlockInPipe_itype) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_traceBlockInPipe_itype=0x%0h while the rhs_.io_enq_req_0_bits_traceBlockInPipe_itype=0x%0h",this.io_enq_req_0_bits_traceBlockInPipe_itype,rhs_.io_enq_req_0_bits_traceBlockInPipe_itype),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_traceBlockInPipe_iretire!=rhs_.io_enq_req_0_bits_traceBlockInPipe_iretire) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_traceBlockInPipe_iretire=0x%0h while the rhs_.io_enq_req_0_bits_traceBlockInPipe_iretire=0x%0h",this.io_enq_req_0_bits_traceBlockInPipe_iretire,rhs_.io_enq_req_0_bits_traceBlockInPipe_iretire),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_traceBlockInPipe_ilastsize!=rhs_.io_enq_req_0_bits_traceBlockInPipe_ilastsize) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_traceBlockInPipe_ilastsize=0x%0h while the rhs_.io_enq_req_0_bits_traceBlockInPipe_ilastsize=0x%0h",this.io_enq_req_0_bits_traceBlockInPipe_ilastsize,rhs_.io_enq_req_0_bits_traceBlockInPipe_ilastsize),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_eliminatedMove!=rhs_.io_enq_req_0_bits_eliminatedMove) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_eliminatedMove=0x%0h while the rhs_.io_enq_req_0_bits_eliminatedMove=0x%0h",this.io_enq_req_0_bits_eliminatedMove,rhs_.io_enq_req_0_bits_eliminatedMove),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_snapshot!=rhs_.io_enq_req_0_bits_snapshot) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_snapshot=0x%0h while the rhs_.io_enq_req_0_bits_snapshot=0x%0h",this.io_enq_req_0_bits_snapshot,rhs_.io_enq_req_0_bits_snapshot),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_lqIdx_value!=rhs_.io_enq_req_0_bits_lqIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_lqIdx_value=0x%0h while the rhs_.io_enq_req_0_bits_lqIdx_value=0x%0h",this.io_enq_req_0_bits_lqIdx_value,rhs_.io_enq_req_0_bits_lqIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_sqIdx_value!=rhs_.io_enq_req_0_bits_sqIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_sqIdx_value=0x%0h while the rhs_.io_enq_req_0_bits_sqIdx_value=0x%0h",this.io_enq_req_0_bits_sqIdx_value,rhs_.io_enq_req_0_bits_sqIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_singleStep!=rhs_.io_enq_req_0_bits_singleStep) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_singleStep=0x%0h while the rhs_.io_enq_req_0_bits_singleStep=0x%0h",this.io_enq_req_0_bits_singleStep,rhs_.io_enq_req_0_bits_singleStep),UVM_NONE)
        end

        if(this.io_enq_req_0_bits_debug_sim_trig!=rhs_.io_enq_req_0_bits_debug_sim_trig) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_0_bits_debug_sim_trig=0x%0h while the rhs_.io_enq_req_0_bits_debug_sim_trig=0x%0h",this.io_enq_req_0_bits_debug_sim_trig,rhs_.io_enq_req_0_bits_debug_sim_trig),UVM_NONE)
        end

        if(this.io_enq_req_1_valid!=rhs_.io_enq_req_1_valid) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_valid=0x%0h while the rhs_.io_enq_req_1_valid=0x%0h",this.io_enq_req_1_valid,rhs_.io_enq_req_1_valid),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_instr!=rhs_.io_enq_req_1_bits_instr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_instr=0x%0h while the rhs_.io_enq_req_1_bits_instr=0x%0h",this.io_enq_req_1_bits_instr,rhs_.io_enq_req_1_bits_instr),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_pc!=rhs_.io_enq_req_1_bits_pc) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_pc=0x%0h while the rhs_.io_enq_req_1_bits_pc=0x%0h",this.io_enq_req_1_bits_pc,rhs_.io_enq_req_1_bits_pc),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_exceptionVec_0!=rhs_.io_enq_req_1_bits_exceptionVec_0) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_exceptionVec_0=0x%0h while the rhs_.io_enq_req_1_bits_exceptionVec_0=0x%0h",this.io_enq_req_1_bits_exceptionVec_0,rhs_.io_enq_req_1_bits_exceptionVec_0),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_exceptionVec_1!=rhs_.io_enq_req_1_bits_exceptionVec_1) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_exceptionVec_1=0x%0h while the rhs_.io_enq_req_1_bits_exceptionVec_1=0x%0h",this.io_enq_req_1_bits_exceptionVec_1,rhs_.io_enq_req_1_bits_exceptionVec_1),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_exceptionVec_2!=rhs_.io_enq_req_1_bits_exceptionVec_2) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_exceptionVec_2=0x%0h while the rhs_.io_enq_req_1_bits_exceptionVec_2=0x%0h",this.io_enq_req_1_bits_exceptionVec_2,rhs_.io_enq_req_1_bits_exceptionVec_2),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_exceptionVec_3!=rhs_.io_enq_req_1_bits_exceptionVec_3) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_exceptionVec_3=0x%0h while the rhs_.io_enq_req_1_bits_exceptionVec_3=0x%0h",this.io_enq_req_1_bits_exceptionVec_3,rhs_.io_enq_req_1_bits_exceptionVec_3),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_exceptionVec_12!=rhs_.io_enq_req_1_bits_exceptionVec_12) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_exceptionVec_12=0x%0h while the rhs_.io_enq_req_1_bits_exceptionVec_12=0x%0h",this.io_enq_req_1_bits_exceptionVec_12,rhs_.io_enq_req_1_bits_exceptionVec_12),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_exceptionVec_20!=rhs_.io_enq_req_1_bits_exceptionVec_20) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_exceptionVec_20=0x%0h while the rhs_.io_enq_req_1_bits_exceptionVec_20=0x%0h",this.io_enq_req_1_bits_exceptionVec_20,rhs_.io_enq_req_1_bits_exceptionVec_20),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_exceptionVec_22!=rhs_.io_enq_req_1_bits_exceptionVec_22) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_exceptionVec_22=0x%0h while the rhs_.io_enq_req_1_bits_exceptionVec_22=0x%0h",this.io_enq_req_1_bits_exceptionVec_22,rhs_.io_enq_req_1_bits_exceptionVec_22),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_isFetchMalAddr!=rhs_.io_enq_req_1_bits_isFetchMalAddr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_isFetchMalAddr=0x%0h while the rhs_.io_enq_req_1_bits_isFetchMalAddr=0x%0h",this.io_enq_req_1_bits_isFetchMalAddr,rhs_.io_enq_req_1_bits_isFetchMalAddr),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_hasException!=rhs_.io_enq_req_1_bits_hasException) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_hasException=0x%0h while the rhs_.io_enq_req_1_bits_hasException=0x%0h",this.io_enq_req_1_bits_hasException,rhs_.io_enq_req_1_bits_hasException),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_trigger!=rhs_.io_enq_req_1_bits_trigger) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_trigger=0x%0h while the rhs_.io_enq_req_1_bits_trigger=0x%0h",this.io_enq_req_1_bits_trigger,rhs_.io_enq_req_1_bits_trigger),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_preDecodeInfo_isRVC!=rhs_.io_enq_req_1_bits_preDecodeInfo_isRVC) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_preDecodeInfo_isRVC=0x%0h while the rhs_.io_enq_req_1_bits_preDecodeInfo_isRVC=0x%0h",this.io_enq_req_1_bits_preDecodeInfo_isRVC,rhs_.io_enq_req_1_bits_preDecodeInfo_isRVC),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_crossPageIPFFix!=rhs_.io_enq_req_1_bits_crossPageIPFFix) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_crossPageIPFFix=0x%0h while the rhs_.io_enq_req_1_bits_crossPageIPFFix=0x%0h",this.io_enq_req_1_bits_crossPageIPFFix,rhs_.io_enq_req_1_bits_crossPageIPFFix),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_ftqPtr_flag!=rhs_.io_enq_req_1_bits_ftqPtr_flag) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_ftqPtr_flag=0x%0h while the rhs_.io_enq_req_1_bits_ftqPtr_flag=0x%0h",this.io_enq_req_1_bits_ftqPtr_flag,rhs_.io_enq_req_1_bits_ftqPtr_flag),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_ftqPtr_value!=rhs_.io_enq_req_1_bits_ftqPtr_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_ftqPtr_value=0x%0h while the rhs_.io_enq_req_1_bits_ftqPtr_value=0x%0h",this.io_enq_req_1_bits_ftqPtr_value,rhs_.io_enq_req_1_bits_ftqPtr_value),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_ftqOffset!=rhs_.io_enq_req_1_bits_ftqOffset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_ftqOffset=0x%0h while the rhs_.io_enq_req_1_bits_ftqOffset=0x%0h",this.io_enq_req_1_bits_ftqOffset,rhs_.io_enq_req_1_bits_ftqOffset),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_ldest!=rhs_.io_enq_req_1_bits_ldest) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_ldest=0x%0h while the rhs_.io_enq_req_1_bits_ldest=0x%0h",this.io_enq_req_1_bits_ldest,rhs_.io_enq_req_1_bits_ldest),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_fuType!=rhs_.io_enq_req_1_bits_fuType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_fuType=0x%0h while the rhs_.io_enq_req_1_bits_fuType=0x%0h",this.io_enq_req_1_bits_fuType,rhs_.io_enq_req_1_bits_fuType),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_fuOpType!=rhs_.io_enq_req_1_bits_fuOpType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_fuOpType=0x%0h while the rhs_.io_enq_req_1_bits_fuOpType=0x%0h",this.io_enq_req_1_bits_fuOpType,rhs_.io_enq_req_1_bits_fuOpType),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_rfWen!=rhs_.io_enq_req_1_bits_rfWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_rfWen=0x%0h while the rhs_.io_enq_req_1_bits_rfWen=0x%0h",this.io_enq_req_1_bits_rfWen,rhs_.io_enq_req_1_bits_rfWen),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_fpWen!=rhs_.io_enq_req_1_bits_fpWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_fpWen=0x%0h while the rhs_.io_enq_req_1_bits_fpWen=0x%0h",this.io_enq_req_1_bits_fpWen,rhs_.io_enq_req_1_bits_fpWen),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vecWen!=rhs_.io_enq_req_1_bits_vecWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vecWen=0x%0h while the rhs_.io_enq_req_1_bits_vecWen=0x%0h",this.io_enq_req_1_bits_vecWen,rhs_.io_enq_req_1_bits_vecWen),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_v0Wen!=rhs_.io_enq_req_1_bits_v0Wen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_v0Wen=0x%0h while the rhs_.io_enq_req_1_bits_v0Wen=0x%0h",this.io_enq_req_1_bits_v0Wen,rhs_.io_enq_req_1_bits_v0Wen),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vlWen!=rhs_.io_enq_req_1_bits_vlWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vlWen=0x%0h while the rhs_.io_enq_req_1_bits_vlWen=0x%0h",this.io_enq_req_1_bits_vlWen,rhs_.io_enq_req_1_bits_vlWen),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_isXSTrap!=rhs_.io_enq_req_1_bits_isXSTrap) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_isXSTrap=0x%0h while the rhs_.io_enq_req_1_bits_isXSTrap=0x%0h",this.io_enq_req_1_bits_isXSTrap,rhs_.io_enq_req_1_bits_isXSTrap),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_waitForward!=rhs_.io_enq_req_1_bits_waitForward) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_waitForward=0x%0h while the rhs_.io_enq_req_1_bits_waitForward=0x%0h",this.io_enq_req_1_bits_waitForward,rhs_.io_enq_req_1_bits_waitForward),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_blockBackward!=rhs_.io_enq_req_1_bits_blockBackward) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_blockBackward=0x%0h while the rhs_.io_enq_req_1_bits_blockBackward=0x%0h",this.io_enq_req_1_bits_blockBackward,rhs_.io_enq_req_1_bits_blockBackward),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_flushPipe!=rhs_.io_enq_req_1_bits_flushPipe) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_flushPipe=0x%0h while the rhs_.io_enq_req_1_bits_flushPipe=0x%0h",this.io_enq_req_1_bits_flushPipe,rhs_.io_enq_req_1_bits_flushPipe),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vpu_vill!=rhs_.io_enq_req_1_bits_vpu_vill) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vpu_vill=0x%0h while the rhs_.io_enq_req_1_bits_vpu_vill=0x%0h",this.io_enq_req_1_bits_vpu_vill,rhs_.io_enq_req_1_bits_vpu_vill),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vpu_vma!=rhs_.io_enq_req_1_bits_vpu_vma) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vpu_vma=0x%0h while the rhs_.io_enq_req_1_bits_vpu_vma=0x%0h",this.io_enq_req_1_bits_vpu_vma,rhs_.io_enq_req_1_bits_vpu_vma),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vpu_vta!=rhs_.io_enq_req_1_bits_vpu_vta) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vpu_vta=0x%0h while the rhs_.io_enq_req_1_bits_vpu_vta=0x%0h",this.io_enq_req_1_bits_vpu_vta,rhs_.io_enq_req_1_bits_vpu_vta),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vpu_vsew!=rhs_.io_enq_req_1_bits_vpu_vsew) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vpu_vsew=0x%0h while the rhs_.io_enq_req_1_bits_vpu_vsew=0x%0h",this.io_enq_req_1_bits_vpu_vsew,rhs_.io_enq_req_1_bits_vpu_vsew),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vpu_vlmul!=rhs_.io_enq_req_1_bits_vpu_vlmul) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vpu_vlmul=0x%0h while the rhs_.io_enq_req_1_bits_vpu_vlmul=0x%0h",this.io_enq_req_1_bits_vpu_vlmul,rhs_.io_enq_req_1_bits_vpu_vlmul),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vpu_specVill!=rhs_.io_enq_req_1_bits_vpu_specVill) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vpu_specVill=0x%0h while the rhs_.io_enq_req_1_bits_vpu_specVill=0x%0h",this.io_enq_req_1_bits_vpu_specVill,rhs_.io_enq_req_1_bits_vpu_specVill),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vpu_specVma!=rhs_.io_enq_req_1_bits_vpu_specVma) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vpu_specVma=0x%0h while the rhs_.io_enq_req_1_bits_vpu_specVma=0x%0h",this.io_enq_req_1_bits_vpu_specVma,rhs_.io_enq_req_1_bits_vpu_specVma),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vpu_specVta!=rhs_.io_enq_req_1_bits_vpu_specVta) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vpu_specVta=0x%0h while the rhs_.io_enq_req_1_bits_vpu_specVta=0x%0h",this.io_enq_req_1_bits_vpu_specVta,rhs_.io_enq_req_1_bits_vpu_specVta),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vpu_specVsew!=rhs_.io_enq_req_1_bits_vpu_specVsew) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vpu_specVsew=0x%0h while the rhs_.io_enq_req_1_bits_vpu_specVsew=0x%0h",this.io_enq_req_1_bits_vpu_specVsew,rhs_.io_enq_req_1_bits_vpu_specVsew),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vpu_specVlmul!=rhs_.io_enq_req_1_bits_vpu_specVlmul) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vpu_specVlmul=0x%0h while the rhs_.io_enq_req_1_bits_vpu_specVlmul=0x%0h",this.io_enq_req_1_bits_vpu_specVlmul,rhs_.io_enq_req_1_bits_vpu_specVlmul),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_vlsInstr!=rhs_.io_enq_req_1_bits_vlsInstr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_vlsInstr=0x%0h while the rhs_.io_enq_req_1_bits_vlsInstr=0x%0h",this.io_enq_req_1_bits_vlsInstr,rhs_.io_enq_req_1_bits_vlsInstr),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_wfflags!=rhs_.io_enq_req_1_bits_wfflags) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_wfflags=0x%0h while the rhs_.io_enq_req_1_bits_wfflags=0x%0h",this.io_enq_req_1_bits_wfflags,rhs_.io_enq_req_1_bits_wfflags),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_isMove!=rhs_.io_enq_req_1_bits_isMove) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_isMove=0x%0h while the rhs_.io_enq_req_1_bits_isMove=0x%0h",this.io_enq_req_1_bits_isMove,rhs_.io_enq_req_1_bits_isMove),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_isVset!=rhs_.io_enq_req_1_bits_isVset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_isVset=0x%0h while the rhs_.io_enq_req_1_bits_isVset=0x%0h",this.io_enq_req_1_bits_isVset,rhs_.io_enq_req_1_bits_isVset),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_firstUop!=rhs_.io_enq_req_1_bits_firstUop) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_firstUop=0x%0h while the rhs_.io_enq_req_1_bits_firstUop=0x%0h",this.io_enq_req_1_bits_firstUop,rhs_.io_enq_req_1_bits_firstUop),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_lastUop!=rhs_.io_enq_req_1_bits_lastUop) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_lastUop=0x%0h while the rhs_.io_enq_req_1_bits_lastUop=0x%0h",this.io_enq_req_1_bits_lastUop,rhs_.io_enq_req_1_bits_lastUop),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_numWB!=rhs_.io_enq_req_1_bits_numWB) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_numWB=0x%0h while the rhs_.io_enq_req_1_bits_numWB=0x%0h",this.io_enq_req_1_bits_numWB,rhs_.io_enq_req_1_bits_numWB),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_commitType!=rhs_.io_enq_req_1_bits_commitType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_commitType=0x%0h while the rhs_.io_enq_req_1_bits_commitType=0x%0h",this.io_enq_req_1_bits_commitType,rhs_.io_enq_req_1_bits_commitType),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_pdest!=rhs_.io_enq_req_1_bits_pdest) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_pdest=0x%0h while the rhs_.io_enq_req_1_bits_pdest=0x%0h",this.io_enq_req_1_bits_pdest,rhs_.io_enq_req_1_bits_pdest),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_robIdx_flag!=rhs_.io_enq_req_1_bits_robIdx_flag) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_robIdx_flag=0x%0h while the rhs_.io_enq_req_1_bits_robIdx_flag=0x%0h",this.io_enq_req_1_bits_robIdx_flag,rhs_.io_enq_req_1_bits_robIdx_flag),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_robIdx_value!=rhs_.io_enq_req_1_bits_robIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_robIdx_value=0x%0h while the rhs_.io_enq_req_1_bits_robIdx_value=0x%0h",this.io_enq_req_1_bits_robIdx_value,rhs_.io_enq_req_1_bits_robIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_instrSize!=rhs_.io_enq_req_1_bits_instrSize) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_instrSize=0x%0h while the rhs_.io_enq_req_1_bits_instrSize=0x%0h",this.io_enq_req_1_bits_instrSize,rhs_.io_enq_req_1_bits_instrSize),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_dirtyFs!=rhs_.io_enq_req_1_bits_dirtyFs) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_dirtyFs=0x%0h while the rhs_.io_enq_req_1_bits_dirtyFs=0x%0h",this.io_enq_req_1_bits_dirtyFs,rhs_.io_enq_req_1_bits_dirtyFs),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_dirtyVs!=rhs_.io_enq_req_1_bits_dirtyVs) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_dirtyVs=0x%0h while the rhs_.io_enq_req_1_bits_dirtyVs=0x%0h",this.io_enq_req_1_bits_dirtyVs,rhs_.io_enq_req_1_bits_dirtyVs),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_traceBlockInPipe_itype!=rhs_.io_enq_req_1_bits_traceBlockInPipe_itype) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_traceBlockInPipe_itype=0x%0h while the rhs_.io_enq_req_1_bits_traceBlockInPipe_itype=0x%0h",this.io_enq_req_1_bits_traceBlockInPipe_itype,rhs_.io_enq_req_1_bits_traceBlockInPipe_itype),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_traceBlockInPipe_iretire!=rhs_.io_enq_req_1_bits_traceBlockInPipe_iretire) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_traceBlockInPipe_iretire=0x%0h while the rhs_.io_enq_req_1_bits_traceBlockInPipe_iretire=0x%0h",this.io_enq_req_1_bits_traceBlockInPipe_iretire,rhs_.io_enq_req_1_bits_traceBlockInPipe_iretire),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_traceBlockInPipe_ilastsize!=rhs_.io_enq_req_1_bits_traceBlockInPipe_ilastsize) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_traceBlockInPipe_ilastsize=0x%0h while the rhs_.io_enq_req_1_bits_traceBlockInPipe_ilastsize=0x%0h",this.io_enq_req_1_bits_traceBlockInPipe_ilastsize,rhs_.io_enq_req_1_bits_traceBlockInPipe_ilastsize),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_eliminatedMove!=rhs_.io_enq_req_1_bits_eliminatedMove) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_eliminatedMove=0x%0h while the rhs_.io_enq_req_1_bits_eliminatedMove=0x%0h",this.io_enq_req_1_bits_eliminatedMove,rhs_.io_enq_req_1_bits_eliminatedMove),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_snapshot!=rhs_.io_enq_req_1_bits_snapshot) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_snapshot=0x%0h while the rhs_.io_enq_req_1_bits_snapshot=0x%0h",this.io_enq_req_1_bits_snapshot,rhs_.io_enq_req_1_bits_snapshot),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_lqIdx_value!=rhs_.io_enq_req_1_bits_lqIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_lqIdx_value=0x%0h while the rhs_.io_enq_req_1_bits_lqIdx_value=0x%0h",this.io_enq_req_1_bits_lqIdx_value,rhs_.io_enq_req_1_bits_lqIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_sqIdx_value!=rhs_.io_enq_req_1_bits_sqIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_sqIdx_value=0x%0h while the rhs_.io_enq_req_1_bits_sqIdx_value=0x%0h",this.io_enq_req_1_bits_sqIdx_value,rhs_.io_enq_req_1_bits_sqIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_singleStep!=rhs_.io_enq_req_1_bits_singleStep) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_singleStep=0x%0h while the rhs_.io_enq_req_1_bits_singleStep=0x%0h",this.io_enq_req_1_bits_singleStep,rhs_.io_enq_req_1_bits_singleStep),UVM_NONE)
        end

        if(this.io_enq_req_1_bits_debug_sim_trig!=rhs_.io_enq_req_1_bits_debug_sim_trig) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_1_bits_debug_sim_trig=0x%0h while the rhs_.io_enq_req_1_bits_debug_sim_trig=0x%0h",this.io_enq_req_1_bits_debug_sim_trig,rhs_.io_enq_req_1_bits_debug_sim_trig),UVM_NONE)
        end

        if(this.io_enq_req_2_valid!=rhs_.io_enq_req_2_valid) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_valid=0x%0h while the rhs_.io_enq_req_2_valid=0x%0h",this.io_enq_req_2_valid,rhs_.io_enq_req_2_valid),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_instr!=rhs_.io_enq_req_2_bits_instr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_instr=0x%0h while the rhs_.io_enq_req_2_bits_instr=0x%0h",this.io_enq_req_2_bits_instr,rhs_.io_enq_req_2_bits_instr),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_pc!=rhs_.io_enq_req_2_bits_pc) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_pc=0x%0h while the rhs_.io_enq_req_2_bits_pc=0x%0h",this.io_enq_req_2_bits_pc,rhs_.io_enq_req_2_bits_pc),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_exceptionVec_0!=rhs_.io_enq_req_2_bits_exceptionVec_0) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_exceptionVec_0=0x%0h while the rhs_.io_enq_req_2_bits_exceptionVec_0=0x%0h",this.io_enq_req_2_bits_exceptionVec_0,rhs_.io_enq_req_2_bits_exceptionVec_0),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_exceptionVec_1!=rhs_.io_enq_req_2_bits_exceptionVec_1) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_exceptionVec_1=0x%0h while the rhs_.io_enq_req_2_bits_exceptionVec_1=0x%0h",this.io_enq_req_2_bits_exceptionVec_1,rhs_.io_enq_req_2_bits_exceptionVec_1),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_exceptionVec_2!=rhs_.io_enq_req_2_bits_exceptionVec_2) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_exceptionVec_2=0x%0h while the rhs_.io_enq_req_2_bits_exceptionVec_2=0x%0h",this.io_enq_req_2_bits_exceptionVec_2,rhs_.io_enq_req_2_bits_exceptionVec_2),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_exceptionVec_3!=rhs_.io_enq_req_2_bits_exceptionVec_3) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_exceptionVec_3=0x%0h while the rhs_.io_enq_req_2_bits_exceptionVec_3=0x%0h",this.io_enq_req_2_bits_exceptionVec_3,rhs_.io_enq_req_2_bits_exceptionVec_3),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_exceptionVec_12!=rhs_.io_enq_req_2_bits_exceptionVec_12) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_exceptionVec_12=0x%0h while the rhs_.io_enq_req_2_bits_exceptionVec_12=0x%0h",this.io_enq_req_2_bits_exceptionVec_12,rhs_.io_enq_req_2_bits_exceptionVec_12),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_exceptionVec_20!=rhs_.io_enq_req_2_bits_exceptionVec_20) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_exceptionVec_20=0x%0h while the rhs_.io_enq_req_2_bits_exceptionVec_20=0x%0h",this.io_enq_req_2_bits_exceptionVec_20,rhs_.io_enq_req_2_bits_exceptionVec_20),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_exceptionVec_22!=rhs_.io_enq_req_2_bits_exceptionVec_22) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_exceptionVec_22=0x%0h while the rhs_.io_enq_req_2_bits_exceptionVec_22=0x%0h",this.io_enq_req_2_bits_exceptionVec_22,rhs_.io_enq_req_2_bits_exceptionVec_22),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_isFetchMalAddr!=rhs_.io_enq_req_2_bits_isFetchMalAddr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_isFetchMalAddr=0x%0h while the rhs_.io_enq_req_2_bits_isFetchMalAddr=0x%0h",this.io_enq_req_2_bits_isFetchMalAddr,rhs_.io_enq_req_2_bits_isFetchMalAddr),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_hasException!=rhs_.io_enq_req_2_bits_hasException) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_hasException=0x%0h while the rhs_.io_enq_req_2_bits_hasException=0x%0h",this.io_enq_req_2_bits_hasException,rhs_.io_enq_req_2_bits_hasException),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_trigger!=rhs_.io_enq_req_2_bits_trigger) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_trigger=0x%0h while the rhs_.io_enq_req_2_bits_trigger=0x%0h",this.io_enq_req_2_bits_trigger,rhs_.io_enq_req_2_bits_trigger),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_preDecodeInfo_isRVC!=rhs_.io_enq_req_2_bits_preDecodeInfo_isRVC) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_preDecodeInfo_isRVC=0x%0h while the rhs_.io_enq_req_2_bits_preDecodeInfo_isRVC=0x%0h",this.io_enq_req_2_bits_preDecodeInfo_isRVC,rhs_.io_enq_req_2_bits_preDecodeInfo_isRVC),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_crossPageIPFFix!=rhs_.io_enq_req_2_bits_crossPageIPFFix) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_crossPageIPFFix=0x%0h while the rhs_.io_enq_req_2_bits_crossPageIPFFix=0x%0h",this.io_enq_req_2_bits_crossPageIPFFix,rhs_.io_enq_req_2_bits_crossPageIPFFix),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_ftqPtr_flag!=rhs_.io_enq_req_2_bits_ftqPtr_flag) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_ftqPtr_flag=0x%0h while the rhs_.io_enq_req_2_bits_ftqPtr_flag=0x%0h",this.io_enq_req_2_bits_ftqPtr_flag,rhs_.io_enq_req_2_bits_ftqPtr_flag),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_ftqPtr_value!=rhs_.io_enq_req_2_bits_ftqPtr_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_ftqPtr_value=0x%0h while the rhs_.io_enq_req_2_bits_ftqPtr_value=0x%0h",this.io_enq_req_2_bits_ftqPtr_value,rhs_.io_enq_req_2_bits_ftqPtr_value),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_ftqOffset!=rhs_.io_enq_req_2_bits_ftqOffset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_ftqOffset=0x%0h while the rhs_.io_enq_req_2_bits_ftqOffset=0x%0h",this.io_enq_req_2_bits_ftqOffset,rhs_.io_enq_req_2_bits_ftqOffset),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_ldest!=rhs_.io_enq_req_2_bits_ldest) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_ldest=0x%0h while the rhs_.io_enq_req_2_bits_ldest=0x%0h",this.io_enq_req_2_bits_ldest,rhs_.io_enq_req_2_bits_ldest),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_fuType!=rhs_.io_enq_req_2_bits_fuType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_fuType=0x%0h while the rhs_.io_enq_req_2_bits_fuType=0x%0h",this.io_enq_req_2_bits_fuType,rhs_.io_enq_req_2_bits_fuType),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_fuOpType!=rhs_.io_enq_req_2_bits_fuOpType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_fuOpType=0x%0h while the rhs_.io_enq_req_2_bits_fuOpType=0x%0h",this.io_enq_req_2_bits_fuOpType,rhs_.io_enq_req_2_bits_fuOpType),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_rfWen!=rhs_.io_enq_req_2_bits_rfWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_rfWen=0x%0h while the rhs_.io_enq_req_2_bits_rfWen=0x%0h",this.io_enq_req_2_bits_rfWen,rhs_.io_enq_req_2_bits_rfWen),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_fpWen!=rhs_.io_enq_req_2_bits_fpWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_fpWen=0x%0h while the rhs_.io_enq_req_2_bits_fpWen=0x%0h",this.io_enq_req_2_bits_fpWen,rhs_.io_enq_req_2_bits_fpWen),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vecWen!=rhs_.io_enq_req_2_bits_vecWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vecWen=0x%0h while the rhs_.io_enq_req_2_bits_vecWen=0x%0h",this.io_enq_req_2_bits_vecWen,rhs_.io_enq_req_2_bits_vecWen),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_v0Wen!=rhs_.io_enq_req_2_bits_v0Wen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_v0Wen=0x%0h while the rhs_.io_enq_req_2_bits_v0Wen=0x%0h",this.io_enq_req_2_bits_v0Wen,rhs_.io_enq_req_2_bits_v0Wen),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vlWen!=rhs_.io_enq_req_2_bits_vlWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vlWen=0x%0h while the rhs_.io_enq_req_2_bits_vlWen=0x%0h",this.io_enq_req_2_bits_vlWen,rhs_.io_enq_req_2_bits_vlWen),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_isXSTrap!=rhs_.io_enq_req_2_bits_isXSTrap) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_isXSTrap=0x%0h while the rhs_.io_enq_req_2_bits_isXSTrap=0x%0h",this.io_enq_req_2_bits_isXSTrap,rhs_.io_enq_req_2_bits_isXSTrap),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_waitForward!=rhs_.io_enq_req_2_bits_waitForward) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_waitForward=0x%0h while the rhs_.io_enq_req_2_bits_waitForward=0x%0h",this.io_enq_req_2_bits_waitForward,rhs_.io_enq_req_2_bits_waitForward),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_blockBackward!=rhs_.io_enq_req_2_bits_blockBackward) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_blockBackward=0x%0h while the rhs_.io_enq_req_2_bits_blockBackward=0x%0h",this.io_enq_req_2_bits_blockBackward,rhs_.io_enq_req_2_bits_blockBackward),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_flushPipe!=rhs_.io_enq_req_2_bits_flushPipe) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_flushPipe=0x%0h while the rhs_.io_enq_req_2_bits_flushPipe=0x%0h",this.io_enq_req_2_bits_flushPipe,rhs_.io_enq_req_2_bits_flushPipe),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vpu_vill!=rhs_.io_enq_req_2_bits_vpu_vill) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vpu_vill=0x%0h while the rhs_.io_enq_req_2_bits_vpu_vill=0x%0h",this.io_enq_req_2_bits_vpu_vill,rhs_.io_enq_req_2_bits_vpu_vill),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vpu_vma!=rhs_.io_enq_req_2_bits_vpu_vma) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vpu_vma=0x%0h while the rhs_.io_enq_req_2_bits_vpu_vma=0x%0h",this.io_enq_req_2_bits_vpu_vma,rhs_.io_enq_req_2_bits_vpu_vma),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vpu_vta!=rhs_.io_enq_req_2_bits_vpu_vta) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vpu_vta=0x%0h while the rhs_.io_enq_req_2_bits_vpu_vta=0x%0h",this.io_enq_req_2_bits_vpu_vta,rhs_.io_enq_req_2_bits_vpu_vta),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vpu_vsew!=rhs_.io_enq_req_2_bits_vpu_vsew) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vpu_vsew=0x%0h while the rhs_.io_enq_req_2_bits_vpu_vsew=0x%0h",this.io_enq_req_2_bits_vpu_vsew,rhs_.io_enq_req_2_bits_vpu_vsew),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vpu_vlmul!=rhs_.io_enq_req_2_bits_vpu_vlmul) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vpu_vlmul=0x%0h while the rhs_.io_enq_req_2_bits_vpu_vlmul=0x%0h",this.io_enq_req_2_bits_vpu_vlmul,rhs_.io_enq_req_2_bits_vpu_vlmul),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vpu_specVill!=rhs_.io_enq_req_2_bits_vpu_specVill) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vpu_specVill=0x%0h while the rhs_.io_enq_req_2_bits_vpu_specVill=0x%0h",this.io_enq_req_2_bits_vpu_specVill,rhs_.io_enq_req_2_bits_vpu_specVill),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vpu_specVma!=rhs_.io_enq_req_2_bits_vpu_specVma) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vpu_specVma=0x%0h while the rhs_.io_enq_req_2_bits_vpu_specVma=0x%0h",this.io_enq_req_2_bits_vpu_specVma,rhs_.io_enq_req_2_bits_vpu_specVma),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vpu_specVta!=rhs_.io_enq_req_2_bits_vpu_specVta) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vpu_specVta=0x%0h while the rhs_.io_enq_req_2_bits_vpu_specVta=0x%0h",this.io_enq_req_2_bits_vpu_specVta,rhs_.io_enq_req_2_bits_vpu_specVta),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vpu_specVsew!=rhs_.io_enq_req_2_bits_vpu_specVsew) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vpu_specVsew=0x%0h while the rhs_.io_enq_req_2_bits_vpu_specVsew=0x%0h",this.io_enq_req_2_bits_vpu_specVsew,rhs_.io_enq_req_2_bits_vpu_specVsew),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vpu_specVlmul!=rhs_.io_enq_req_2_bits_vpu_specVlmul) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vpu_specVlmul=0x%0h while the rhs_.io_enq_req_2_bits_vpu_specVlmul=0x%0h",this.io_enq_req_2_bits_vpu_specVlmul,rhs_.io_enq_req_2_bits_vpu_specVlmul),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_vlsInstr!=rhs_.io_enq_req_2_bits_vlsInstr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_vlsInstr=0x%0h while the rhs_.io_enq_req_2_bits_vlsInstr=0x%0h",this.io_enq_req_2_bits_vlsInstr,rhs_.io_enq_req_2_bits_vlsInstr),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_wfflags!=rhs_.io_enq_req_2_bits_wfflags) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_wfflags=0x%0h while the rhs_.io_enq_req_2_bits_wfflags=0x%0h",this.io_enq_req_2_bits_wfflags,rhs_.io_enq_req_2_bits_wfflags),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_isMove!=rhs_.io_enq_req_2_bits_isMove) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_isMove=0x%0h while the rhs_.io_enq_req_2_bits_isMove=0x%0h",this.io_enq_req_2_bits_isMove,rhs_.io_enq_req_2_bits_isMove),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_isVset!=rhs_.io_enq_req_2_bits_isVset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_isVset=0x%0h while the rhs_.io_enq_req_2_bits_isVset=0x%0h",this.io_enq_req_2_bits_isVset,rhs_.io_enq_req_2_bits_isVset),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_firstUop!=rhs_.io_enq_req_2_bits_firstUop) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_firstUop=0x%0h while the rhs_.io_enq_req_2_bits_firstUop=0x%0h",this.io_enq_req_2_bits_firstUop,rhs_.io_enq_req_2_bits_firstUop),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_lastUop!=rhs_.io_enq_req_2_bits_lastUop) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_lastUop=0x%0h while the rhs_.io_enq_req_2_bits_lastUop=0x%0h",this.io_enq_req_2_bits_lastUop,rhs_.io_enq_req_2_bits_lastUop),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_numWB!=rhs_.io_enq_req_2_bits_numWB) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_numWB=0x%0h while the rhs_.io_enq_req_2_bits_numWB=0x%0h",this.io_enq_req_2_bits_numWB,rhs_.io_enq_req_2_bits_numWB),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_commitType!=rhs_.io_enq_req_2_bits_commitType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_commitType=0x%0h while the rhs_.io_enq_req_2_bits_commitType=0x%0h",this.io_enq_req_2_bits_commitType,rhs_.io_enq_req_2_bits_commitType),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_pdest!=rhs_.io_enq_req_2_bits_pdest) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_pdest=0x%0h while the rhs_.io_enq_req_2_bits_pdest=0x%0h",this.io_enq_req_2_bits_pdest,rhs_.io_enq_req_2_bits_pdest),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_robIdx_flag!=rhs_.io_enq_req_2_bits_robIdx_flag) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_robIdx_flag=0x%0h while the rhs_.io_enq_req_2_bits_robIdx_flag=0x%0h",this.io_enq_req_2_bits_robIdx_flag,rhs_.io_enq_req_2_bits_robIdx_flag),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_robIdx_value!=rhs_.io_enq_req_2_bits_robIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_robIdx_value=0x%0h while the rhs_.io_enq_req_2_bits_robIdx_value=0x%0h",this.io_enq_req_2_bits_robIdx_value,rhs_.io_enq_req_2_bits_robIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_instrSize!=rhs_.io_enq_req_2_bits_instrSize) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_instrSize=0x%0h while the rhs_.io_enq_req_2_bits_instrSize=0x%0h",this.io_enq_req_2_bits_instrSize,rhs_.io_enq_req_2_bits_instrSize),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_dirtyFs!=rhs_.io_enq_req_2_bits_dirtyFs) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_dirtyFs=0x%0h while the rhs_.io_enq_req_2_bits_dirtyFs=0x%0h",this.io_enq_req_2_bits_dirtyFs,rhs_.io_enq_req_2_bits_dirtyFs),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_dirtyVs!=rhs_.io_enq_req_2_bits_dirtyVs) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_dirtyVs=0x%0h while the rhs_.io_enq_req_2_bits_dirtyVs=0x%0h",this.io_enq_req_2_bits_dirtyVs,rhs_.io_enq_req_2_bits_dirtyVs),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_traceBlockInPipe_itype!=rhs_.io_enq_req_2_bits_traceBlockInPipe_itype) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_traceBlockInPipe_itype=0x%0h while the rhs_.io_enq_req_2_bits_traceBlockInPipe_itype=0x%0h",this.io_enq_req_2_bits_traceBlockInPipe_itype,rhs_.io_enq_req_2_bits_traceBlockInPipe_itype),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_traceBlockInPipe_iretire!=rhs_.io_enq_req_2_bits_traceBlockInPipe_iretire) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_traceBlockInPipe_iretire=0x%0h while the rhs_.io_enq_req_2_bits_traceBlockInPipe_iretire=0x%0h",this.io_enq_req_2_bits_traceBlockInPipe_iretire,rhs_.io_enq_req_2_bits_traceBlockInPipe_iretire),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_traceBlockInPipe_ilastsize!=rhs_.io_enq_req_2_bits_traceBlockInPipe_ilastsize) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_traceBlockInPipe_ilastsize=0x%0h while the rhs_.io_enq_req_2_bits_traceBlockInPipe_ilastsize=0x%0h",this.io_enq_req_2_bits_traceBlockInPipe_ilastsize,rhs_.io_enq_req_2_bits_traceBlockInPipe_ilastsize),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_eliminatedMove!=rhs_.io_enq_req_2_bits_eliminatedMove) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_eliminatedMove=0x%0h while the rhs_.io_enq_req_2_bits_eliminatedMove=0x%0h",this.io_enq_req_2_bits_eliminatedMove,rhs_.io_enq_req_2_bits_eliminatedMove),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_snapshot!=rhs_.io_enq_req_2_bits_snapshot) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_snapshot=0x%0h while the rhs_.io_enq_req_2_bits_snapshot=0x%0h",this.io_enq_req_2_bits_snapshot,rhs_.io_enq_req_2_bits_snapshot),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_lqIdx_value!=rhs_.io_enq_req_2_bits_lqIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_lqIdx_value=0x%0h while the rhs_.io_enq_req_2_bits_lqIdx_value=0x%0h",this.io_enq_req_2_bits_lqIdx_value,rhs_.io_enq_req_2_bits_lqIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_sqIdx_value!=rhs_.io_enq_req_2_bits_sqIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_sqIdx_value=0x%0h while the rhs_.io_enq_req_2_bits_sqIdx_value=0x%0h",this.io_enq_req_2_bits_sqIdx_value,rhs_.io_enq_req_2_bits_sqIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_singleStep!=rhs_.io_enq_req_2_bits_singleStep) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_singleStep=0x%0h while the rhs_.io_enq_req_2_bits_singleStep=0x%0h",this.io_enq_req_2_bits_singleStep,rhs_.io_enq_req_2_bits_singleStep),UVM_NONE)
        end

        if(this.io_enq_req_2_bits_debug_sim_trig!=rhs_.io_enq_req_2_bits_debug_sim_trig) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_2_bits_debug_sim_trig=0x%0h while the rhs_.io_enq_req_2_bits_debug_sim_trig=0x%0h",this.io_enq_req_2_bits_debug_sim_trig,rhs_.io_enq_req_2_bits_debug_sim_trig),UVM_NONE)
        end

        if(this.io_enq_req_3_valid!=rhs_.io_enq_req_3_valid) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_valid=0x%0h while the rhs_.io_enq_req_3_valid=0x%0h",this.io_enq_req_3_valid,rhs_.io_enq_req_3_valid),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_instr!=rhs_.io_enq_req_3_bits_instr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_instr=0x%0h while the rhs_.io_enq_req_3_bits_instr=0x%0h",this.io_enq_req_3_bits_instr,rhs_.io_enq_req_3_bits_instr),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_pc!=rhs_.io_enq_req_3_bits_pc) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_pc=0x%0h while the rhs_.io_enq_req_3_bits_pc=0x%0h",this.io_enq_req_3_bits_pc,rhs_.io_enq_req_3_bits_pc),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_exceptionVec_0!=rhs_.io_enq_req_3_bits_exceptionVec_0) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_exceptionVec_0=0x%0h while the rhs_.io_enq_req_3_bits_exceptionVec_0=0x%0h",this.io_enq_req_3_bits_exceptionVec_0,rhs_.io_enq_req_3_bits_exceptionVec_0),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_exceptionVec_1!=rhs_.io_enq_req_3_bits_exceptionVec_1) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_exceptionVec_1=0x%0h while the rhs_.io_enq_req_3_bits_exceptionVec_1=0x%0h",this.io_enq_req_3_bits_exceptionVec_1,rhs_.io_enq_req_3_bits_exceptionVec_1),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_exceptionVec_2!=rhs_.io_enq_req_3_bits_exceptionVec_2) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_exceptionVec_2=0x%0h while the rhs_.io_enq_req_3_bits_exceptionVec_2=0x%0h",this.io_enq_req_3_bits_exceptionVec_2,rhs_.io_enq_req_3_bits_exceptionVec_2),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_exceptionVec_3!=rhs_.io_enq_req_3_bits_exceptionVec_3) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_exceptionVec_3=0x%0h while the rhs_.io_enq_req_3_bits_exceptionVec_3=0x%0h",this.io_enq_req_3_bits_exceptionVec_3,rhs_.io_enq_req_3_bits_exceptionVec_3),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_exceptionVec_12!=rhs_.io_enq_req_3_bits_exceptionVec_12) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_exceptionVec_12=0x%0h while the rhs_.io_enq_req_3_bits_exceptionVec_12=0x%0h",this.io_enq_req_3_bits_exceptionVec_12,rhs_.io_enq_req_3_bits_exceptionVec_12),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_exceptionVec_20!=rhs_.io_enq_req_3_bits_exceptionVec_20) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_exceptionVec_20=0x%0h while the rhs_.io_enq_req_3_bits_exceptionVec_20=0x%0h",this.io_enq_req_3_bits_exceptionVec_20,rhs_.io_enq_req_3_bits_exceptionVec_20),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_exceptionVec_22!=rhs_.io_enq_req_3_bits_exceptionVec_22) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_exceptionVec_22=0x%0h while the rhs_.io_enq_req_3_bits_exceptionVec_22=0x%0h",this.io_enq_req_3_bits_exceptionVec_22,rhs_.io_enq_req_3_bits_exceptionVec_22),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_isFetchMalAddr!=rhs_.io_enq_req_3_bits_isFetchMalAddr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_isFetchMalAddr=0x%0h while the rhs_.io_enq_req_3_bits_isFetchMalAddr=0x%0h",this.io_enq_req_3_bits_isFetchMalAddr,rhs_.io_enq_req_3_bits_isFetchMalAddr),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_hasException!=rhs_.io_enq_req_3_bits_hasException) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_hasException=0x%0h while the rhs_.io_enq_req_3_bits_hasException=0x%0h",this.io_enq_req_3_bits_hasException,rhs_.io_enq_req_3_bits_hasException),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_trigger!=rhs_.io_enq_req_3_bits_trigger) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_trigger=0x%0h while the rhs_.io_enq_req_3_bits_trigger=0x%0h",this.io_enq_req_3_bits_trigger,rhs_.io_enq_req_3_bits_trigger),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_preDecodeInfo_isRVC!=rhs_.io_enq_req_3_bits_preDecodeInfo_isRVC) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_preDecodeInfo_isRVC=0x%0h while the rhs_.io_enq_req_3_bits_preDecodeInfo_isRVC=0x%0h",this.io_enq_req_3_bits_preDecodeInfo_isRVC,rhs_.io_enq_req_3_bits_preDecodeInfo_isRVC),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_crossPageIPFFix!=rhs_.io_enq_req_3_bits_crossPageIPFFix) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_crossPageIPFFix=0x%0h while the rhs_.io_enq_req_3_bits_crossPageIPFFix=0x%0h",this.io_enq_req_3_bits_crossPageIPFFix,rhs_.io_enq_req_3_bits_crossPageIPFFix),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_ftqPtr_flag!=rhs_.io_enq_req_3_bits_ftqPtr_flag) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_ftqPtr_flag=0x%0h while the rhs_.io_enq_req_3_bits_ftqPtr_flag=0x%0h",this.io_enq_req_3_bits_ftqPtr_flag,rhs_.io_enq_req_3_bits_ftqPtr_flag),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_ftqPtr_value!=rhs_.io_enq_req_3_bits_ftqPtr_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_ftqPtr_value=0x%0h while the rhs_.io_enq_req_3_bits_ftqPtr_value=0x%0h",this.io_enq_req_3_bits_ftqPtr_value,rhs_.io_enq_req_3_bits_ftqPtr_value),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_ftqOffset!=rhs_.io_enq_req_3_bits_ftqOffset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_ftqOffset=0x%0h while the rhs_.io_enq_req_3_bits_ftqOffset=0x%0h",this.io_enq_req_3_bits_ftqOffset,rhs_.io_enq_req_3_bits_ftqOffset),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_ldest!=rhs_.io_enq_req_3_bits_ldest) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_ldest=0x%0h while the rhs_.io_enq_req_3_bits_ldest=0x%0h",this.io_enq_req_3_bits_ldest,rhs_.io_enq_req_3_bits_ldest),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_fuType!=rhs_.io_enq_req_3_bits_fuType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_fuType=0x%0h while the rhs_.io_enq_req_3_bits_fuType=0x%0h",this.io_enq_req_3_bits_fuType,rhs_.io_enq_req_3_bits_fuType),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_fuOpType!=rhs_.io_enq_req_3_bits_fuOpType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_fuOpType=0x%0h while the rhs_.io_enq_req_3_bits_fuOpType=0x%0h",this.io_enq_req_3_bits_fuOpType,rhs_.io_enq_req_3_bits_fuOpType),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_rfWen!=rhs_.io_enq_req_3_bits_rfWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_rfWen=0x%0h while the rhs_.io_enq_req_3_bits_rfWen=0x%0h",this.io_enq_req_3_bits_rfWen,rhs_.io_enq_req_3_bits_rfWen),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_fpWen!=rhs_.io_enq_req_3_bits_fpWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_fpWen=0x%0h while the rhs_.io_enq_req_3_bits_fpWen=0x%0h",this.io_enq_req_3_bits_fpWen,rhs_.io_enq_req_3_bits_fpWen),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vecWen!=rhs_.io_enq_req_3_bits_vecWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vecWen=0x%0h while the rhs_.io_enq_req_3_bits_vecWen=0x%0h",this.io_enq_req_3_bits_vecWen,rhs_.io_enq_req_3_bits_vecWen),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_v0Wen!=rhs_.io_enq_req_3_bits_v0Wen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_v0Wen=0x%0h while the rhs_.io_enq_req_3_bits_v0Wen=0x%0h",this.io_enq_req_3_bits_v0Wen,rhs_.io_enq_req_3_bits_v0Wen),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vlWen!=rhs_.io_enq_req_3_bits_vlWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vlWen=0x%0h while the rhs_.io_enq_req_3_bits_vlWen=0x%0h",this.io_enq_req_3_bits_vlWen,rhs_.io_enq_req_3_bits_vlWen),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_isXSTrap!=rhs_.io_enq_req_3_bits_isXSTrap) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_isXSTrap=0x%0h while the rhs_.io_enq_req_3_bits_isXSTrap=0x%0h",this.io_enq_req_3_bits_isXSTrap,rhs_.io_enq_req_3_bits_isXSTrap),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_waitForward!=rhs_.io_enq_req_3_bits_waitForward) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_waitForward=0x%0h while the rhs_.io_enq_req_3_bits_waitForward=0x%0h",this.io_enq_req_3_bits_waitForward,rhs_.io_enq_req_3_bits_waitForward),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_blockBackward!=rhs_.io_enq_req_3_bits_blockBackward) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_blockBackward=0x%0h while the rhs_.io_enq_req_3_bits_blockBackward=0x%0h",this.io_enq_req_3_bits_blockBackward,rhs_.io_enq_req_3_bits_blockBackward),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_flushPipe!=rhs_.io_enq_req_3_bits_flushPipe) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_flushPipe=0x%0h while the rhs_.io_enq_req_3_bits_flushPipe=0x%0h",this.io_enq_req_3_bits_flushPipe,rhs_.io_enq_req_3_bits_flushPipe),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vpu_vill!=rhs_.io_enq_req_3_bits_vpu_vill) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vpu_vill=0x%0h while the rhs_.io_enq_req_3_bits_vpu_vill=0x%0h",this.io_enq_req_3_bits_vpu_vill,rhs_.io_enq_req_3_bits_vpu_vill),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vpu_vma!=rhs_.io_enq_req_3_bits_vpu_vma) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vpu_vma=0x%0h while the rhs_.io_enq_req_3_bits_vpu_vma=0x%0h",this.io_enq_req_3_bits_vpu_vma,rhs_.io_enq_req_3_bits_vpu_vma),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vpu_vta!=rhs_.io_enq_req_3_bits_vpu_vta) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vpu_vta=0x%0h while the rhs_.io_enq_req_3_bits_vpu_vta=0x%0h",this.io_enq_req_3_bits_vpu_vta,rhs_.io_enq_req_3_bits_vpu_vta),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vpu_vsew!=rhs_.io_enq_req_3_bits_vpu_vsew) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vpu_vsew=0x%0h while the rhs_.io_enq_req_3_bits_vpu_vsew=0x%0h",this.io_enq_req_3_bits_vpu_vsew,rhs_.io_enq_req_3_bits_vpu_vsew),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vpu_vlmul!=rhs_.io_enq_req_3_bits_vpu_vlmul) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vpu_vlmul=0x%0h while the rhs_.io_enq_req_3_bits_vpu_vlmul=0x%0h",this.io_enq_req_3_bits_vpu_vlmul,rhs_.io_enq_req_3_bits_vpu_vlmul),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vpu_specVill!=rhs_.io_enq_req_3_bits_vpu_specVill) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vpu_specVill=0x%0h while the rhs_.io_enq_req_3_bits_vpu_specVill=0x%0h",this.io_enq_req_3_bits_vpu_specVill,rhs_.io_enq_req_3_bits_vpu_specVill),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vpu_specVma!=rhs_.io_enq_req_3_bits_vpu_specVma) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vpu_specVma=0x%0h while the rhs_.io_enq_req_3_bits_vpu_specVma=0x%0h",this.io_enq_req_3_bits_vpu_specVma,rhs_.io_enq_req_3_bits_vpu_specVma),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vpu_specVta!=rhs_.io_enq_req_3_bits_vpu_specVta) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vpu_specVta=0x%0h while the rhs_.io_enq_req_3_bits_vpu_specVta=0x%0h",this.io_enq_req_3_bits_vpu_specVta,rhs_.io_enq_req_3_bits_vpu_specVta),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vpu_specVsew!=rhs_.io_enq_req_3_bits_vpu_specVsew) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vpu_specVsew=0x%0h while the rhs_.io_enq_req_3_bits_vpu_specVsew=0x%0h",this.io_enq_req_3_bits_vpu_specVsew,rhs_.io_enq_req_3_bits_vpu_specVsew),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vpu_specVlmul!=rhs_.io_enq_req_3_bits_vpu_specVlmul) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vpu_specVlmul=0x%0h while the rhs_.io_enq_req_3_bits_vpu_specVlmul=0x%0h",this.io_enq_req_3_bits_vpu_specVlmul,rhs_.io_enq_req_3_bits_vpu_specVlmul),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_vlsInstr!=rhs_.io_enq_req_3_bits_vlsInstr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_vlsInstr=0x%0h while the rhs_.io_enq_req_3_bits_vlsInstr=0x%0h",this.io_enq_req_3_bits_vlsInstr,rhs_.io_enq_req_3_bits_vlsInstr),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_wfflags!=rhs_.io_enq_req_3_bits_wfflags) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_wfflags=0x%0h while the rhs_.io_enq_req_3_bits_wfflags=0x%0h",this.io_enq_req_3_bits_wfflags,rhs_.io_enq_req_3_bits_wfflags),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_isMove!=rhs_.io_enq_req_3_bits_isMove) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_isMove=0x%0h while the rhs_.io_enq_req_3_bits_isMove=0x%0h",this.io_enq_req_3_bits_isMove,rhs_.io_enq_req_3_bits_isMove),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_isVset!=rhs_.io_enq_req_3_bits_isVset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_isVset=0x%0h while the rhs_.io_enq_req_3_bits_isVset=0x%0h",this.io_enq_req_3_bits_isVset,rhs_.io_enq_req_3_bits_isVset),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_firstUop!=rhs_.io_enq_req_3_bits_firstUop) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_firstUop=0x%0h while the rhs_.io_enq_req_3_bits_firstUop=0x%0h",this.io_enq_req_3_bits_firstUop,rhs_.io_enq_req_3_bits_firstUop),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_lastUop!=rhs_.io_enq_req_3_bits_lastUop) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_lastUop=0x%0h while the rhs_.io_enq_req_3_bits_lastUop=0x%0h",this.io_enq_req_3_bits_lastUop,rhs_.io_enq_req_3_bits_lastUop),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_numWB!=rhs_.io_enq_req_3_bits_numWB) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_numWB=0x%0h while the rhs_.io_enq_req_3_bits_numWB=0x%0h",this.io_enq_req_3_bits_numWB,rhs_.io_enq_req_3_bits_numWB),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_commitType!=rhs_.io_enq_req_3_bits_commitType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_commitType=0x%0h while the rhs_.io_enq_req_3_bits_commitType=0x%0h",this.io_enq_req_3_bits_commitType,rhs_.io_enq_req_3_bits_commitType),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_pdest!=rhs_.io_enq_req_3_bits_pdest) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_pdest=0x%0h while the rhs_.io_enq_req_3_bits_pdest=0x%0h",this.io_enq_req_3_bits_pdest,rhs_.io_enq_req_3_bits_pdest),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_robIdx_flag!=rhs_.io_enq_req_3_bits_robIdx_flag) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_robIdx_flag=0x%0h while the rhs_.io_enq_req_3_bits_robIdx_flag=0x%0h",this.io_enq_req_3_bits_robIdx_flag,rhs_.io_enq_req_3_bits_robIdx_flag),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_robIdx_value!=rhs_.io_enq_req_3_bits_robIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_robIdx_value=0x%0h while the rhs_.io_enq_req_3_bits_robIdx_value=0x%0h",this.io_enq_req_3_bits_robIdx_value,rhs_.io_enq_req_3_bits_robIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_instrSize!=rhs_.io_enq_req_3_bits_instrSize) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_instrSize=0x%0h while the rhs_.io_enq_req_3_bits_instrSize=0x%0h",this.io_enq_req_3_bits_instrSize,rhs_.io_enq_req_3_bits_instrSize),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_dirtyFs!=rhs_.io_enq_req_3_bits_dirtyFs) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_dirtyFs=0x%0h while the rhs_.io_enq_req_3_bits_dirtyFs=0x%0h",this.io_enq_req_3_bits_dirtyFs,rhs_.io_enq_req_3_bits_dirtyFs),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_dirtyVs!=rhs_.io_enq_req_3_bits_dirtyVs) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_dirtyVs=0x%0h while the rhs_.io_enq_req_3_bits_dirtyVs=0x%0h",this.io_enq_req_3_bits_dirtyVs,rhs_.io_enq_req_3_bits_dirtyVs),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_traceBlockInPipe_itype!=rhs_.io_enq_req_3_bits_traceBlockInPipe_itype) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_traceBlockInPipe_itype=0x%0h while the rhs_.io_enq_req_3_bits_traceBlockInPipe_itype=0x%0h",this.io_enq_req_3_bits_traceBlockInPipe_itype,rhs_.io_enq_req_3_bits_traceBlockInPipe_itype),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_traceBlockInPipe_iretire!=rhs_.io_enq_req_3_bits_traceBlockInPipe_iretire) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_traceBlockInPipe_iretire=0x%0h while the rhs_.io_enq_req_3_bits_traceBlockInPipe_iretire=0x%0h",this.io_enq_req_3_bits_traceBlockInPipe_iretire,rhs_.io_enq_req_3_bits_traceBlockInPipe_iretire),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_traceBlockInPipe_ilastsize!=rhs_.io_enq_req_3_bits_traceBlockInPipe_ilastsize) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_traceBlockInPipe_ilastsize=0x%0h while the rhs_.io_enq_req_3_bits_traceBlockInPipe_ilastsize=0x%0h",this.io_enq_req_3_bits_traceBlockInPipe_ilastsize,rhs_.io_enq_req_3_bits_traceBlockInPipe_ilastsize),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_eliminatedMove!=rhs_.io_enq_req_3_bits_eliminatedMove) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_eliminatedMove=0x%0h while the rhs_.io_enq_req_3_bits_eliminatedMove=0x%0h",this.io_enq_req_3_bits_eliminatedMove,rhs_.io_enq_req_3_bits_eliminatedMove),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_snapshot!=rhs_.io_enq_req_3_bits_snapshot) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_snapshot=0x%0h while the rhs_.io_enq_req_3_bits_snapshot=0x%0h",this.io_enq_req_3_bits_snapshot,rhs_.io_enq_req_3_bits_snapshot),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_lqIdx_value!=rhs_.io_enq_req_3_bits_lqIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_lqIdx_value=0x%0h while the rhs_.io_enq_req_3_bits_lqIdx_value=0x%0h",this.io_enq_req_3_bits_lqIdx_value,rhs_.io_enq_req_3_bits_lqIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_sqIdx_value!=rhs_.io_enq_req_3_bits_sqIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_sqIdx_value=0x%0h while the rhs_.io_enq_req_3_bits_sqIdx_value=0x%0h",this.io_enq_req_3_bits_sqIdx_value,rhs_.io_enq_req_3_bits_sqIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_singleStep!=rhs_.io_enq_req_3_bits_singleStep) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_singleStep=0x%0h while the rhs_.io_enq_req_3_bits_singleStep=0x%0h",this.io_enq_req_3_bits_singleStep,rhs_.io_enq_req_3_bits_singleStep),UVM_NONE)
        end

        if(this.io_enq_req_3_bits_debug_sim_trig!=rhs_.io_enq_req_3_bits_debug_sim_trig) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_3_bits_debug_sim_trig=0x%0h while the rhs_.io_enq_req_3_bits_debug_sim_trig=0x%0h",this.io_enq_req_3_bits_debug_sim_trig,rhs_.io_enq_req_3_bits_debug_sim_trig),UVM_NONE)
        end

        if(this.io_enq_req_4_valid!=rhs_.io_enq_req_4_valid) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_valid=0x%0h while the rhs_.io_enq_req_4_valid=0x%0h",this.io_enq_req_4_valid,rhs_.io_enq_req_4_valid),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_instr!=rhs_.io_enq_req_4_bits_instr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_instr=0x%0h while the rhs_.io_enq_req_4_bits_instr=0x%0h",this.io_enq_req_4_bits_instr,rhs_.io_enq_req_4_bits_instr),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_pc!=rhs_.io_enq_req_4_bits_pc) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_pc=0x%0h while the rhs_.io_enq_req_4_bits_pc=0x%0h",this.io_enq_req_4_bits_pc,rhs_.io_enq_req_4_bits_pc),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_exceptionVec_0!=rhs_.io_enq_req_4_bits_exceptionVec_0) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_exceptionVec_0=0x%0h while the rhs_.io_enq_req_4_bits_exceptionVec_0=0x%0h",this.io_enq_req_4_bits_exceptionVec_0,rhs_.io_enq_req_4_bits_exceptionVec_0),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_exceptionVec_1!=rhs_.io_enq_req_4_bits_exceptionVec_1) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_exceptionVec_1=0x%0h while the rhs_.io_enq_req_4_bits_exceptionVec_1=0x%0h",this.io_enq_req_4_bits_exceptionVec_1,rhs_.io_enq_req_4_bits_exceptionVec_1),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_exceptionVec_2!=rhs_.io_enq_req_4_bits_exceptionVec_2) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_exceptionVec_2=0x%0h while the rhs_.io_enq_req_4_bits_exceptionVec_2=0x%0h",this.io_enq_req_4_bits_exceptionVec_2,rhs_.io_enq_req_4_bits_exceptionVec_2),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_exceptionVec_3!=rhs_.io_enq_req_4_bits_exceptionVec_3) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_exceptionVec_3=0x%0h while the rhs_.io_enq_req_4_bits_exceptionVec_3=0x%0h",this.io_enq_req_4_bits_exceptionVec_3,rhs_.io_enq_req_4_bits_exceptionVec_3),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_exceptionVec_12!=rhs_.io_enq_req_4_bits_exceptionVec_12) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_exceptionVec_12=0x%0h while the rhs_.io_enq_req_4_bits_exceptionVec_12=0x%0h",this.io_enq_req_4_bits_exceptionVec_12,rhs_.io_enq_req_4_bits_exceptionVec_12),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_exceptionVec_20!=rhs_.io_enq_req_4_bits_exceptionVec_20) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_exceptionVec_20=0x%0h while the rhs_.io_enq_req_4_bits_exceptionVec_20=0x%0h",this.io_enq_req_4_bits_exceptionVec_20,rhs_.io_enq_req_4_bits_exceptionVec_20),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_exceptionVec_22!=rhs_.io_enq_req_4_bits_exceptionVec_22) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_exceptionVec_22=0x%0h while the rhs_.io_enq_req_4_bits_exceptionVec_22=0x%0h",this.io_enq_req_4_bits_exceptionVec_22,rhs_.io_enq_req_4_bits_exceptionVec_22),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_isFetchMalAddr!=rhs_.io_enq_req_4_bits_isFetchMalAddr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_isFetchMalAddr=0x%0h while the rhs_.io_enq_req_4_bits_isFetchMalAddr=0x%0h",this.io_enq_req_4_bits_isFetchMalAddr,rhs_.io_enq_req_4_bits_isFetchMalAddr),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_hasException!=rhs_.io_enq_req_4_bits_hasException) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_hasException=0x%0h while the rhs_.io_enq_req_4_bits_hasException=0x%0h",this.io_enq_req_4_bits_hasException,rhs_.io_enq_req_4_bits_hasException),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_trigger!=rhs_.io_enq_req_4_bits_trigger) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_trigger=0x%0h while the rhs_.io_enq_req_4_bits_trigger=0x%0h",this.io_enq_req_4_bits_trigger,rhs_.io_enq_req_4_bits_trigger),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_preDecodeInfo_isRVC!=rhs_.io_enq_req_4_bits_preDecodeInfo_isRVC) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_preDecodeInfo_isRVC=0x%0h while the rhs_.io_enq_req_4_bits_preDecodeInfo_isRVC=0x%0h",this.io_enq_req_4_bits_preDecodeInfo_isRVC,rhs_.io_enq_req_4_bits_preDecodeInfo_isRVC),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_crossPageIPFFix!=rhs_.io_enq_req_4_bits_crossPageIPFFix) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_crossPageIPFFix=0x%0h while the rhs_.io_enq_req_4_bits_crossPageIPFFix=0x%0h",this.io_enq_req_4_bits_crossPageIPFFix,rhs_.io_enq_req_4_bits_crossPageIPFFix),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_ftqPtr_flag!=rhs_.io_enq_req_4_bits_ftqPtr_flag) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_ftqPtr_flag=0x%0h while the rhs_.io_enq_req_4_bits_ftqPtr_flag=0x%0h",this.io_enq_req_4_bits_ftqPtr_flag,rhs_.io_enq_req_4_bits_ftqPtr_flag),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_ftqPtr_value!=rhs_.io_enq_req_4_bits_ftqPtr_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_ftqPtr_value=0x%0h while the rhs_.io_enq_req_4_bits_ftqPtr_value=0x%0h",this.io_enq_req_4_bits_ftqPtr_value,rhs_.io_enq_req_4_bits_ftqPtr_value),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_ftqOffset!=rhs_.io_enq_req_4_bits_ftqOffset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_ftqOffset=0x%0h while the rhs_.io_enq_req_4_bits_ftqOffset=0x%0h",this.io_enq_req_4_bits_ftqOffset,rhs_.io_enq_req_4_bits_ftqOffset),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_ldest!=rhs_.io_enq_req_4_bits_ldest) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_ldest=0x%0h while the rhs_.io_enq_req_4_bits_ldest=0x%0h",this.io_enq_req_4_bits_ldest,rhs_.io_enq_req_4_bits_ldest),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_fuType!=rhs_.io_enq_req_4_bits_fuType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_fuType=0x%0h while the rhs_.io_enq_req_4_bits_fuType=0x%0h",this.io_enq_req_4_bits_fuType,rhs_.io_enq_req_4_bits_fuType),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_fuOpType!=rhs_.io_enq_req_4_bits_fuOpType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_fuOpType=0x%0h while the rhs_.io_enq_req_4_bits_fuOpType=0x%0h",this.io_enq_req_4_bits_fuOpType,rhs_.io_enq_req_4_bits_fuOpType),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_rfWen!=rhs_.io_enq_req_4_bits_rfWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_rfWen=0x%0h while the rhs_.io_enq_req_4_bits_rfWen=0x%0h",this.io_enq_req_4_bits_rfWen,rhs_.io_enq_req_4_bits_rfWen),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_fpWen!=rhs_.io_enq_req_4_bits_fpWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_fpWen=0x%0h while the rhs_.io_enq_req_4_bits_fpWen=0x%0h",this.io_enq_req_4_bits_fpWen,rhs_.io_enq_req_4_bits_fpWen),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vecWen!=rhs_.io_enq_req_4_bits_vecWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vecWen=0x%0h while the rhs_.io_enq_req_4_bits_vecWen=0x%0h",this.io_enq_req_4_bits_vecWen,rhs_.io_enq_req_4_bits_vecWen),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_v0Wen!=rhs_.io_enq_req_4_bits_v0Wen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_v0Wen=0x%0h while the rhs_.io_enq_req_4_bits_v0Wen=0x%0h",this.io_enq_req_4_bits_v0Wen,rhs_.io_enq_req_4_bits_v0Wen),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vlWen!=rhs_.io_enq_req_4_bits_vlWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vlWen=0x%0h while the rhs_.io_enq_req_4_bits_vlWen=0x%0h",this.io_enq_req_4_bits_vlWen,rhs_.io_enq_req_4_bits_vlWen),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_isXSTrap!=rhs_.io_enq_req_4_bits_isXSTrap) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_isXSTrap=0x%0h while the rhs_.io_enq_req_4_bits_isXSTrap=0x%0h",this.io_enq_req_4_bits_isXSTrap,rhs_.io_enq_req_4_bits_isXSTrap),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_waitForward!=rhs_.io_enq_req_4_bits_waitForward) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_waitForward=0x%0h while the rhs_.io_enq_req_4_bits_waitForward=0x%0h",this.io_enq_req_4_bits_waitForward,rhs_.io_enq_req_4_bits_waitForward),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_blockBackward!=rhs_.io_enq_req_4_bits_blockBackward) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_blockBackward=0x%0h while the rhs_.io_enq_req_4_bits_blockBackward=0x%0h",this.io_enq_req_4_bits_blockBackward,rhs_.io_enq_req_4_bits_blockBackward),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_flushPipe!=rhs_.io_enq_req_4_bits_flushPipe) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_flushPipe=0x%0h while the rhs_.io_enq_req_4_bits_flushPipe=0x%0h",this.io_enq_req_4_bits_flushPipe,rhs_.io_enq_req_4_bits_flushPipe),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vpu_vill!=rhs_.io_enq_req_4_bits_vpu_vill) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vpu_vill=0x%0h while the rhs_.io_enq_req_4_bits_vpu_vill=0x%0h",this.io_enq_req_4_bits_vpu_vill,rhs_.io_enq_req_4_bits_vpu_vill),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vpu_vma!=rhs_.io_enq_req_4_bits_vpu_vma) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vpu_vma=0x%0h while the rhs_.io_enq_req_4_bits_vpu_vma=0x%0h",this.io_enq_req_4_bits_vpu_vma,rhs_.io_enq_req_4_bits_vpu_vma),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vpu_vta!=rhs_.io_enq_req_4_bits_vpu_vta) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vpu_vta=0x%0h while the rhs_.io_enq_req_4_bits_vpu_vta=0x%0h",this.io_enq_req_4_bits_vpu_vta,rhs_.io_enq_req_4_bits_vpu_vta),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vpu_vsew!=rhs_.io_enq_req_4_bits_vpu_vsew) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vpu_vsew=0x%0h while the rhs_.io_enq_req_4_bits_vpu_vsew=0x%0h",this.io_enq_req_4_bits_vpu_vsew,rhs_.io_enq_req_4_bits_vpu_vsew),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vpu_vlmul!=rhs_.io_enq_req_4_bits_vpu_vlmul) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vpu_vlmul=0x%0h while the rhs_.io_enq_req_4_bits_vpu_vlmul=0x%0h",this.io_enq_req_4_bits_vpu_vlmul,rhs_.io_enq_req_4_bits_vpu_vlmul),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vpu_specVill!=rhs_.io_enq_req_4_bits_vpu_specVill) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vpu_specVill=0x%0h while the rhs_.io_enq_req_4_bits_vpu_specVill=0x%0h",this.io_enq_req_4_bits_vpu_specVill,rhs_.io_enq_req_4_bits_vpu_specVill),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vpu_specVma!=rhs_.io_enq_req_4_bits_vpu_specVma) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vpu_specVma=0x%0h while the rhs_.io_enq_req_4_bits_vpu_specVma=0x%0h",this.io_enq_req_4_bits_vpu_specVma,rhs_.io_enq_req_4_bits_vpu_specVma),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vpu_specVta!=rhs_.io_enq_req_4_bits_vpu_specVta) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vpu_specVta=0x%0h while the rhs_.io_enq_req_4_bits_vpu_specVta=0x%0h",this.io_enq_req_4_bits_vpu_specVta,rhs_.io_enq_req_4_bits_vpu_specVta),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vpu_specVsew!=rhs_.io_enq_req_4_bits_vpu_specVsew) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vpu_specVsew=0x%0h while the rhs_.io_enq_req_4_bits_vpu_specVsew=0x%0h",this.io_enq_req_4_bits_vpu_specVsew,rhs_.io_enq_req_4_bits_vpu_specVsew),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vpu_specVlmul!=rhs_.io_enq_req_4_bits_vpu_specVlmul) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vpu_specVlmul=0x%0h while the rhs_.io_enq_req_4_bits_vpu_specVlmul=0x%0h",this.io_enq_req_4_bits_vpu_specVlmul,rhs_.io_enq_req_4_bits_vpu_specVlmul),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_vlsInstr!=rhs_.io_enq_req_4_bits_vlsInstr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_vlsInstr=0x%0h while the rhs_.io_enq_req_4_bits_vlsInstr=0x%0h",this.io_enq_req_4_bits_vlsInstr,rhs_.io_enq_req_4_bits_vlsInstr),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_wfflags!=rhs_.io_enq_req_4_bits_wfflags) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_wfflags=0x%0h while the rhs_.io_enq_req_4_bits_wfflags=0x%0h",this.io_enq_req_4_bits_wfflags,rhs_.io_enq_req_4_bits_wfflags),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_isMove!=rhs_.io_enq_req_4_bits_isMove) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_isMove=0x%0h while the rhs_.io_enq_req_4_bits_isMove=0x%0h",this.io_enq_req_4_bits_isMove,rhs_.io_enq_req_4_bits_isMove),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_isVset!=rhs_.io_enq_req_4_bits_isVset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_isVset=0x%0h while the rhs_.io_enq_req_4_bits_isVset=0x%0h",this.io_enq_req_4_bits_isVset,rhs_.io_enq_req_4_bits_isVset),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_firstUop!=rhs_.io_enq_req_4_bits_firstUop) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_firstUop=0x%0h while the rhs_.io_enq_req_4_bits_firstUop=0x%0h",this.io_enq_req_4_bits_firstUop,rhs_.io_enq_req_4_bits_firstUop),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_lastUop!=rhs_.io_enq_req_4_bits_lastUop) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_lastUop=0x%0h while the rhs_.io_enq_req_4_bits_lastUop=0x%0h",this.io_enq_req_4_bits_lastUop,rhs_.io_enq_req_4_bits_lastUop),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_numWB!=rhs_.io_enq_req_4_bits_numWB) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_numWB=0x%0h while the rhs_.io_enq_req_4_bits_numWB=0x%0h",this.io_enq_req_4_bits_numWB,rhs_.io_enq_req_4_bits_numWB),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_commitType!=rhs_.io_enq_req_4_bits_commitType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_commitType=0x%0h while the rhs_.io_enq_req_4_bits_commitType=0x%0h",this.io_enq_req_4_bits_commitType,rhs_.io_enq_req_4_bits_commitType),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_pdest!=rhs_.io_enq_req_4_bits_pdest) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_pdest=0x%0h while the rhs_.io_enq_req_4_bits_pdest=0x%0h",this.io_enq_req_4_bits_pdest,rhs_.io_enq_req_4_bits_pdest),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_robIdx_flag!=rhs_.io_enq_req_4_bits_robIdx_flag) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_robIdx_flag=0x%0h while the rhs_.io_enq_req_4_bits_robIdx_flag=0x%0h",this.io_enq_req_4_bits_robIdx_flag,rhs_.io_enq_req_4_bits_robIdx_flag),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_robIdx_value!=rhs_.io_enq_req_4_bits_robIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_robIdx_value=0x%0h while the rhs_.io_enq_req_4_bits_robIdx_value=0x%0h",this.io_enq_req_4_bits_robIdx_value,rhs_.io_enq_req_4_bits_robIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_instrSize!=rhs_.io_enq_req_4_bits_instrSize) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_instrSize=0x%0h while the rhs_.io_enq_req_4_bits_instrSize=0x%0h",this.io_enq_req_4_bits_instrSize,rhs_.io_enq_req_4_bits_instrSize),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_dirtyFs!=rhs_.io_enq_req_4_bits_dirtyFs) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_dirtyFs=0x%0h while the rhs_.io_enq_req_4_bits_dirtyFs=0x%0h",this.io_enq_req_4_bits_dirtyFs,rhs_.io_enq_req_4_bits_dirtyFs),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_dirtyVs!=rhs_.io_enq_req_4_bits_dirtyVs) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_dirtyVs=0x%0h while the rhs_.io_enq_req_4_bits_dirtyVs=0x%0h",this.io_enq_req_4_bits_dirtyVs,rhs_.io_enq_req_4_bits_dirtyVs),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_traceBlockInPipe_itype!=rhs_.io_enq_req_4_bits_traceBlockInPipe_itype) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_traceBlockInPipe_itype=0x%0h while the rhs_.io_enq_req_4_bits_traceBlockInPipe_itype=0x%0h",this.io_enq_req_4_bits_traceBlockInPipe_itype,rhs_.io_enq_req_4_bits_traceBlockInPipe_itype),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_traceBlockInPipe_iretire!=rhs_.io_enq_req_4_bits_traceBlockInPipe_iretire) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_traceBlockInPipe_iretire=0x%0h while the rhs_.io_enq_req_4_bits_traceBlockInPipe_iretire=0x%0h",this.io_enq_req_4_bits_traceBlockInPipe_iretire,rhs_.io_enq_req_4_bits_traceBlockInPipe_iretire),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_traceBlockInPipe_ilastsize!=rhs_.io_enq_req_4_bits_traceBlockInPipe_ilastsize) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_traceBlockInPipe_ilastsize=0x%0h while the rhs_.io_enq_req_4_bits_traceBlockInPipe_ilastsize=0x%0h",this.io_enq_req_4_bits_traceBlockInPipe_ilastsize,rhs_.io_enq_req_4_bits_traceBlockInPipe_ilastsize),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_eliminatedMove!=rhs_.io_enq_req_4_bits_eliminatedMove) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_eliminatedMove=0x%0h while the rhs_.io_enq_req_4_bits_eliminatedMove=0x%0h",this.io_enq_req_4_bits_eliminatedMove,rhs_.io_enq_req_4_bits_eliminatedMove),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_snapshot!=rhs_.io_enq_req_4_bits_snapshot) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_snapshot=0x%0h while the rhs_.io_enq_req_4_bits_snapshot=0x%0h",this.io_enq_req_4_bits_snapshot,rhs_.io_enq_req_4_bits_snapshot),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_lqIdx_value!=rhs_.io_enq_req_4_bits_lqIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_lqIdx_value=0x%0h while the rhs_.io_enq_req_4_bits_lqIdx_value=0x%0h",this.io_enq_req_4_bits_lqIdx_value,rhs_.io_enq_req_4_bits_lqIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_sqIdx_value!=rhs_.io_enq_req_4_bits_sqIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_sqIdx_value=0x%0h while the rhs_.io_enq_req_4_bits_sqIdx_value=0x%0h",this.io_enq_req_4_bits_sqIdx_value,rhs_.io_enq_req_4_bits_sqIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_singleStep!=rhs_.io_enq_req_4_bits_singleStep) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_singleStep=0x%0h while the rhs_.io_enq_req_4_bits_singleStep=0x%0h",this.io_enq_req_4_bits_singleStep,rhs_.io_enq_req_4_bits_singleStep),UVM_NONE)
        end

        if(this.io_enq_req_4_bits_debug_sim_trig!=rhs_.io_enq_req_4_bits_debug_sim_trig) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_4_bits_debug_sim_trig=0x%0h while the rhs_.io_enq_req_4_bits_debug_sim_trig=0x%0h",this.io_enq_req_4_bits_debug_sim_trig,rhs_.io_enq_req_4_bits_debug_sim_trig),UVM_NONE)
        end

        if(this.io_enq_req_5_valid!=rhs_.io_enq_req_5_valid) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_valid=0x%0h while the rhs_.io_enq_req_5_valid=0x%0h",this.io_enq_req_5_valid,rhs_.io_enq_req_5_valid),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_instr!=rhs_.io_enq_req_5_bits_instr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_instr=0x%0h while the rhs_.io_enq_req_5_bits_instr=0x%0h",this.io_enq_req_5_bits_instr,rhs_.io_enq_req_5_bits_instr),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_pc!=rhs_.io_enq_req_5_bits_pc) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_pc=0x%0h while the rhs_.io_enq_req_5_bits_pc=0x%0h",this.io_enq_req_5_bits_pc,rhs_.io_enq_req_5_bits_pc),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_exceptionVec_0!=rhs_.io_enq_req_5_bits_exceptionVec_0) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_exceptionVec_0=0x%0h while the rhs_.io_enq_req_5_bits_exceptionVec_0=0x%0h",this.io_enq_req_5_bits_exceptionVec_0,rhs_.io_enq_req_5_bits_exceptionVec_0),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_exceptionVec_1!=rhs_.io_enq_req_5_bits_exceptionVec_1) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_exceptionVec_1=0x%0h while the rhs_.io_enq_req_5_bits_exceptionVec_1=0x%0h",this.io_enq_req_5_bits_exceptionVec_1,rhs_.io_enq_req_5_bits_exceptionVec_1),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_exceptionVec_2!=rhs_.io_enq_req_5_bits_exceptionVec_2) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_exceptionVec_2=0x%0h while the rhs_.io_enq_req_5_bits_exceptionVec_2=0x%0h",this.io_enq_req_5_bits_exceptionVec_2,rhs_.io_enq_req_5_bits_exceptionVec_2),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_exceptionVec_3!=rhs_.io_enq_req_5_bits_exceptionVec_3) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_exceptionVec_3=0x%0h while the rhs_.io_enq_req_5_bits_exceptionVec_3=0x%0h",this.io_enq_req_5_bits_exceptionVec_3,rhs_.io_enq_req_5_bits_exceptionVec_3),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_exceptionVec_12!=rhs_.io_enq_req_5_bits_exceptionVec_12) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_exceptionVec_12=0x%0h while the rhs_.io_enq_req_5_bits_exceptionVec_12=0x%0h",this.io_enq_req_5_bits_exceptionVec_12,rhs_.io_enq_req_5_bits_exceptionVec_12),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_exceptionVec_20!=rhs_.io_enq_req_5_bits_exceptionVec_20) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_exceptionVec_20=0x%0h while the rhs_.io_enq_req_5_bits_exceptionVec_20=0x%0h",this.io_enq_req_5_bits_exceptionVec_20,rhs_.io_enq_req_5_bits_exceptionVec_20),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_exceptionVec_22!=rhs_.io_enq_req_5_bits_exceptionVec_22) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_exceptionVec_22=0x%0h while the rhs_.io_enq_req_5_bits_exceptionVec_22=0x%0h",this.io_enq_req_5_bits_exceptionVec_22,rhs_.io_enq_req_5_bits_exceptionVec_22),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_isFetchMalAddr!=rhs_.io_enq_req_5_bits_isFetchMalAddr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_isFetchMalAddr=0x%0h while the rhs_.io_enq_req_5_bits_isFetchMalAddr=0x%0h",this.io_enq_req_5_bits_isFetchMalAddr,rhs_.io_enq_req_5_bits_isFetchMalAddr),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_hasException!=rhs_.io_enq_req_5_bits_hasException) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_hasException=0x%0h while the rhs_.io_enq_req_5_bits_hasException=0x%0h",this.io_enq_req_5_bits_hasException,rhs_.io_enq_req_5_bits_hasException),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_trigger!=rhs_.io_enq_req_5_bits_trigger) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_trigger=0x%0h while the rhs_.io_enq_req_5_bits_trigger=0x%0h",this.io_enq_req_5_bits_trigger,rhs_.io_enq_req_5_bits_trigger),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_preDecodeInfo_isRVC!=rhs_.io_enq_req_5_bits_preDecodeInfo_isRVC) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_preDecodeInfo_isRVC=0x%0h while the rhs_.io_enq_req_5_bits_preDecodeInfo_isRVC=0x%0h",this.io_enq_req_5_bits_preDecodeInfo_isRVC,rhs_.io_enq_req_5_bits_preDecodeInfo_isRVC),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_crossPageIPFFix!=rhs_.io_enq_req_5_bits_crossPageIPFFix) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_crossPageIPFFix=0x%0h while the rhs_.io_enq_req_5_bits_crossPageIPFFix=0x%0h",this.io_enq_req_5_bits_crossPageIPFFix,rhs_.io_enq_req_5_bits_crossPageIPFFix),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_ftqPtr_flag!=rhs_.io_enq_req_5_bits_ftqPtr_flag) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_ftqPtr_flag=0x%0h while the rhs_.io_enq_req_5_bits_ftqPtr_flag=0x%0h",this.io_enq_req_5_bits_ftqPtr_flag,rhs_.io_enq_req_5_bits_ftqPtr_flag),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_ftqPtr_value!=rhs_.io_enq_req_5_bits_ftqPtr_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_ftqPtr_value=0x%0h while the rhs_.io_enq_req_5_bits_ftqPtr_value=0x%0h",this.io_enq_req_5_bits_ftqPtr_value,rhs_.io_enq_req_5_bits_ftqPtr_value),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_ftqOffset!=rhs_.io_enq_req_5_bits_ftqOffset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_ftqOffset=0x%0h while the rhs_.io_enq_req_5_bits_ftqOffset=0x%0h",this.io_enq_req_5_bits_ftqOffset,rhs_.io_enq_req_5_bits_ftqOffset),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_ldest!=rhs_.io_enq_req_5_bits_ldest) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_ldest=0x%0h while the rhs_.io_enq_req_5_bits_ldest=0x%0h",this.io_enq_req_5_bits_ldest,rhs_.io_enq_req_5_bits_ldest),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_fuType!=rhs_.io_enq_req_5_bits_fuType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_fuType=0x%0h while the rhs_.io_enq_req_5_bits_fuType=0x%0h",this.io_enq_req_5_bits_fuType,rhs_.io_enq_req_5_bits_fuType),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_fuOpType!=rhs_.io_enq_req_5_bits_fuOpType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_fuOpType=0x%0h while the rhs_.io_enq_req_5_bits_fuOpType=0x%0h",this.io_enq_req_5_bits_fuOpType,rhs_.io_enq_req_5_bits_fuOpType),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_rfWen!=rhs_.io_enq_req_5_bits_rfWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_rfWen=0x%0h while the rhs_.io_enq_req_5_bits_rfWen=0x%0h",this.io_enq_req_5_bits_rfWen,rhs_.io_enq_req_5_bits_rfWen),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_fpWen!=rhs_.io_enq_req_5_bits_fpWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_fpWen=0x%0h while the rhs_.io_enq_req_5_bits_fpWen=0x%0h",this.io_enq_req_5_bits_fpWen,rhs_.io_enq_req_5_bits_fpWen),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vecWen!=rhs_.io_enq_req_5_bits_vecWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vecWen=0x%0h while the rhs_.io_enq_req_5_bits_vecWen=0x%0h",this.io_enq_req_5_bits_vecWen,rhs_.io_enq_req_5_bits_vecWen),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_v0Wen!=rhs_.io_enq_req_5_bits_v0Wen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_v0Wen=0x%0h while the rhs_.io_enq_req_5_bits_v0Wen=0x%0h",this.io_enq_req_5_bits_v0Wen,rhs_.io_enq_req_5_bits_v0Wen),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vlWen!=rhs_.io_enq_req_5_bits_vlWen) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vlWen=0x%0h while the rhs_.io_enq_req_5_bits_vlWen=0x%0h",this.io_enq_req_5_bits_vlWen,rhs_.io_enq_req_5_bits_vlWen),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_isXSTrap!=rhs_.io_enq_req_5_bits_isXSTrap) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_isXSTrap=0x%0h while the rhs_.io_enq_req_5_bits_isXSTrap=0x%0h",this.io_enq_req_5_bits_isXSTrap,rhs_.io_enq_req_5_bits_isXSTrap),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_waitForward!=rhs_.io_enq_req_5_bits_waitForward) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_waitForward=0x%0h while the rhs_.io_enq_req_5_bits_waitForward=0x%0h",this.io_enq_req_5_bits_waitForward,rhs_.io_enq_req_5_bits_waitForward),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_blockBackward!=rhs_.io_enq_req_5_bits_blockBackward) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_blockBackward=0x%0h while the rhs_.io_enq_req_5_bits_blockBackward=0x%0h",this.io_enq_req_5_bits_blockBackward,rhs_.io_enq_req_5_bits_blockBackward),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_flushPipe!=rhs_.io_enq_req_5_bits_flushPipe) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_flushPipe=0x%0h while the rhs_.io_enq_req_5_bits_flushPipe=0x%0h",this.io_enq_req_5_bits_flushPipe,rhs_.io_enq_req_5_bits_flushPipe),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vpu_vill!=rhs_.io_enq_req_5_bits_vpu_vill) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vpu_vill=0x%0h while the rhs_.io_enq_req_5_bits_vpu_vill=0x%0h",this.io_enq_req_5_bits_vpu_vill,rhs_.io_enq_req_5_bits_vpu_vill),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vpu_vma!=rhs_.io_enq_req_5_bits_vpu_vma) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vpu_vma=0x%0h while the rhs_.io_enq_req_5_bits_vpu_vma=0x%0h",this.io_enq_req_5_bits_vpu_vma,rhs_.io_enq_req_5_bits_vpu_vma),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vpu_vta!=rhs_.io_enq_req_5_bits_vpu_vta) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vpu_vta=0x%0h while the rhs_.io_enq_req_5_bits_vpu_vta=0x%0h",this.io_enq_req_5_bits_vpu_vta,rhs_.io_enq_req_5_bits_vpu_vta),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vpu_vsew!=rhs_.io_enq_req_5_bits_vpu_vsew) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vpu_vsew=0x%0h while the rhs_.io_enq_req_5_bits_vpu_vsew=0x%0h",this.io_enq_req_5_bits_vpu_vsew,rhs_.io_enq_req_5_bits_vpu_vsew),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vpu_vlmul!=rhs_.io_enq_req_5_bits_vpu_vlmul) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vpu_vlmul=0x%0h while the rhs_.io_enq_req_5_bits_vpu_vlmul=0x%0h",this.io_enq_req_5_bits_vpu_vlmul,rhs_.io_enq_req_5_bits_vpu_vlmul),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vpu_specVill!=rhs_.io_enq_req_5_bits_vpu_specVill) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vpu_specVill=0x%0h while the rhs_.io_enq_req_5_bits_vpu_specVill=0x%0h",this.io_enq_req_5_bits_vpu_specVill,rhs_.io_enq_req_5_bits_vpu_specVill),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vpu_specVma!=rhs_.io_enq_req_5_bits_vpu_specVma) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vpu_specVma=0x%0h while the rhs_.io_enq_req_5_bits_vpu_specVma=0x%0h",this.io_enq_req_5_bits_vpu_specVma,rhs_.io_enq_req_5_bits_vpu_specVma),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vpu_specVta!=rhs_.io_enq_req_5_bits_vpu_specVta) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vpu_specVta=0x%0h while the rhs_.io_enq_req_5_bits_vpu_specVta=0x%0h",this.io_enq_req_5_bits_vpu_specVta,rhs_.io_enq_req_5_bits_vpu_specVta),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vpu_specVsew!=rhs_.io_enq_req_5_bits_vpu_specVsew) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vpu_specVsew=0x%0h while the rhs_.io_enq_req_5_bits_vpu_specVsew=0x%0h",this.io_enq_req_5_bits_vpu_specVsew,rhs_.io_enq_req_5_bits_vpu_specVsew),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vpu_specVlmul!=rhs_.io_enq_req_5_bits_vpu_specVlmul) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vpu_specVlmul=0x%0h while the rhs_.io_enq_req_5_bits_vpu_specVlmul=0x%0h",this.io_enq_req_5_bits_vpu_specVlmul,rhs_.io_enq_req_5_bits_vpu_specVlmul),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_vlsInstr!=rhs_.io_enq_req_5_bits_vlsInstr) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_vlsInstr=0x%0h while the rhs_.io_enq_req_5_bits_vlsInstr=0x%0h",this.io_enq_req_5_bits_vlsInstr,rhs_.io_enq_req_5_bits_vlsInstr),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_wfflags!=rhs_.io_enq_req_5_bits_wfflags) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_wfflags=0x%0h while the rhs_.io_enq_req_5_bits_wfflags=0x%0h",this.io_enq_req_5_bits_wfflags,rhs_.io_enq_req_5_bits_wfflags),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_isMove!=rhs_.io_enq_req_5_bits_isMove) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_isMove=0x%0h while the rhs_.io_enq_req_5_bits_isMove=0x%0h",this.io_enq_req_5_bits_isMove,rhs_.io_enq_req_5_bits_isMove),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_isVset!=rhs_.io_enq_req_5_bits_isVset) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_isVset=0x%0h while the rhs_.io_enq_req_5_bits_isVset=0x%0h",this.io_enq_req_5_bits_isVset,rhs_.io_enq_req_5_bits_isVset),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_firstUop!=rhs_.io_enq_req_5_bits_firstUop) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_firstUop=0x%0h while the rhs_.io_enq_req_5_bits_firstUop=0x%0h",this.io_enq_req_5_bits_firstUop,rhs_.io_enq_req_5_bits_firstUop),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_lastUop!=rhs_.io_enq_req_5_bits_lastUop) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_lastUop=0x%0h while the rhs_.io_enq_req_5_bits_lastUop=0x%0h",this.io_enq_req_5_bits_lastUop,rhs_.io_enq_req_5_bits_lastUop),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_numWB!=rhs_.io_enq_req_5_bits_numWB) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_numWB=0x%0h while the rhs_.io_enq_req_5_bits_numWB=0x%0h",this.io_enq_req_5_bits_numWB,rhs_.io_enq_req_5_bits_numWB),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_commitType!=rhs_.io_enq_req_5_bits_commitType) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_commitType=0x%0h while the rhs_.io_enq_req_5_bits_commitType=0x%0h",this.io_enq_req_5_bits_commitType,rhs_.io_enq_req_5_bits_commitType),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_pdest!=rhs_.io_enq_req_5_bits_pdest) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_pdest=0x%0h while the rhs_.io_enq_req_5_bits_pdest=0x%0h",this.io_enq_req_5_bits_pdest,rhs_.io_enq_req_5_bits_pdest),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_robIdx_flag!=rhs_.io_enq_req_5_bits_robIdx_flag) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_robIdx_flag=0x%0h while the rhs_.io_enq_req_5_bits_robIdx_flag=0x%0h",this.io_enq_req_5_bits_robIdx_flag,rhs_.io_enq_req_5_bits_robIdx_flag),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_robIdx_value!=rhs_.io_enq_req_5_bits_robIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_robIdx_value=0x%0h while the rhs_.io_enq_req_5_bits_robIdx_value=0x%0h",this.io_enq_req_5_bits_robIdx_value,rhs_.io_enq_req_5_bits_robIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_instrSize!=rhs_.io_enq_req_5_bits_instrSize) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_instrSize=0x%0h while the rhs_.io_enq_req_5_bits_instrSize=0x%0h",this.io_enq_req_5_bits_instrSize,rhs_.io_enq_req_5_bits_instrSize),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_dirtyFs!=rhs_.io_enq_req_5_bits_dirtyFs) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_dirtyFs=0x%0h while the rhs_.io_enq_req_5_bits_dirtyFs=0x%0h",this.io_enq_req_5_bits_dirtyFs,rhs_.io_enq_req_5_bits_dirtyFs),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_dirtyVs!=rhs_.io_enq_req_5_bits_dirtyVs) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_dirtyVs=0x%0h while the rhs_.io_enq_req_5_bits_dirtyVs=0x%0h",this.io_enq_req_5_bits_dirtyVs,rhs_.io_enq_req_5_bits_dirtyVs),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_traceBlockInPipe_itype!=rhs_.io_enq_req_5_bits_traceBlockInPipe_itype) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_traceBlockInPipe_itype=0x%0h while the rhs_.io_enq_req_5_bits_traceBlockInPipe_itype=0x%0h",this.io_enq_req_5_bits_traceBlockInPipe_itype,rhs_.io_enq_req_5_bits_traceBlockInPipe_itype),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_traceBlockInPipe_iretire!=rhs_.io_enq_req_5_bits_traceBlockInPipe_iretire) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_traceBlockInPipe_iretire=0x%0h while the rhs_.io_enq_req_5_bits_traceBlockInPipe_iretire=0x%0h",this.io_enq_req_5_bits_traceBlockInPipe_iretire,rhs_.io_enq_req_5_bits_traceBlockInPipe_iretire),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_traceBlockInPipe_ilastsize!=rhs_.io_enq_req_5_bits_traceBlockInPipe_ilastsize) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_traceBlockInPipe_ilastsize=0x%0h while the rhs_.io_enq_req_5_bits_traceBlockInPipe_ilastsize=0x%0h",this.io_enq_req_5_bits_traceBlockInPipe_ilastsize,rhs_.io_enq_req_5_bits_traceBlockInPipe_ilastsize),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_eliminatedMove!=rhs_.io_enq_req_5_bits_eliminatedMove) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_eliminatedMove=0x%0h while the rhs_.io_enq_req_5_bits_eliminatedMove=0x%0h",this.io_enq_req_5_bits_eliminatedMove,rhs_.io_enq_req_5_bits_eliminatedMove),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_snapshot!=rhs_.io_enq_req_5_bits_snapshot) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_snapshot=0x%0h while the rhs_.io_enq_req_5_bits_snapshot=0x%0h",this.io_enq_req_5_bits_snapshot,rhs_.io_enq_req_5_bits_snapshot),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_lqIdx_value!=rhs_.io_enq_req_5_bits_lqIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_lqIdx_value=0x%0h while the rhs_.io_enq_req_5_bits_lqIdx_value=0x%0h",this.io_enq_req_5_bits_lqIdx_value,rhs_.io_enq_req_5_bits_lqIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_sqIdx_value!=rhs_.io_enq_req_5_bits_sqIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_sqIdx_value=0x%0h while the rhs_.io_enq_req_5_bits_sqIdx_value=0x%0h",this.io_enq_req_5_bits_sqIdx_value,rhs_.io_enq_req_5_bits_sqIdx_value),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_singleStep!=rhs_.io_enq_req_5_bits_singleStep) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_singleStep=0x%0h while the rhs_.io_enq_req_5_bits_singleStep=0x%0h",this.io_enq_req_5_bits_singleStep,rhs_.io_enq_req_5_bits_singleStep),UVM_NONE)
        end

        if(this.io_enq_req_5_bits_debug_sim_trig!=rhs_.io_enq_req_5_bits_debug_sim_trig) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_enq_req_5_bits_debug_sim_trig=0x%0h while the rhs_.io_enq_req_5_bits_debug_sim_trig=0x%0h",this.io_enq_req_5_bits_debug_sim_trig,rhs_.io_enq_req_5_bits_debug_sim_trig),UVM_NONE)
        end

    end
    return super_result;
endfunction:compare

`endif

