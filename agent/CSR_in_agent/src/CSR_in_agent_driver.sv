//=========================================================
//File name    : CSR_in_agent_driver.sv
//Author       : nanyunhao
//Module name  : CSR_in_agent_driver
//Discribution : CSR_in_agent_driver : driver
//Date         : 2026-01-22
//=========================================================
`ifndef CSR_IN_AGENT_DRIVER__SV
`define CSR_IN_AGENT_DRIVER__SV

class CSR_in_agent_driver  extends tcnt_driver_base#(virtual CSR_in_agent_interface,CSR_in_agent_cfg,CSR_in_agent_xaction);

    `uvm_component_utils(CSR_in_agent_driver)

    extern function new(string name, uvm_component parent);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual task reset_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);
    extern task send_pkt(CSR_in_agent_xaction tr);
    extern task drive_idle(tcnt_dec_base::drv_mode_e drv_mode);
endclass:CSR_in_agent_driver

function CSR_in_agent_driver::new(string name, uvm_component parent);
    super.new(name,parent);
endfunction:new

function void CSR_in_agent_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction:build_phase

task CSR_in_agent_driver::reset_phase(uvm_phase phase);

    super.reset_phase(phase);
    phase.raise_objection(this);

    repeat(2) begin
        @this.vif.drv_mp.drv_cb;
        this.drive_idle(this.cfg.drv_mode);
    end
    wait(vif.rst_n == 1'b1);
    repeat(20) begin
        @this.vif.drv_mp.drv_cb;
        this.drive_idle(this.cfg.drv_mode);
    end

    phase.drop_objection(this);
endtask:reset_phase

task CSR_in_agent_driver::main_phase(uvm_phase phase);
    super.main_phase(phase);
    //while(1) begin
    if(this.cfg.sqr_sw==tcnt_dec_base::ON && this.cfg.drv_sw==tcnt_dec_base::ON) begin
        while(1) begin
            seq_item_port.try_next_item(req);
            if(req!=null) begin
                repeat(req.pre_pkt_gap) begin
                    @this.vif.drv_mp.drv_cb;
                    this.drive_idle(this.cfg.drv_mode);
                end
                @this.vif.drv_mp.drv_cb;
                this.send_pkt(req);
                repeat(req.post_pkt_gap) begin
                    @this.vif.drv_mp.drv_cb;
                    this.drive_idle(this.cfg.drv_mode);
                end
                seq_item_port.item_done();
            end
            else begin
                @this.vif.drv_mp.drv_cb;
                this.drive_idle(this.cfg.drv_mode);
            end
        end
    end
    else if (this.cfg.drv_sw==tcnt_dec_base::ON) begin
        while(1) begin
            @this.vif.drv_mp.drv_cb;
            `uvm_fatal(get_type_name(), $sformatf("sqr_sw==OFF & drv_sw==ON, please give a driver send task!"))
            //send task
        end
    end
endtask:main_phase

task CSR_in_agent_driver::send_pkt(CSR_in_agent_xaction tr);
    vif.drv_mp.drv_cb.io_csr_intrBitSet <= tr.io_csr_intrBitSet; 
    vif.drv_mp.drv_cb.io_csr_wfiEvent <= tr.io_csr_wfiEvent; 
    vif.drv_mp.drv_cb.io_csr_criticalErrorState <= tr.io_csr_criticalErrorState; 
    vif.drv_mp.drv_cb.io_snpt_snptDeq <= tr.io_snpt_snptDeq; 
    vif.drv_mp.drv_cb.io_snpt_useSnpt <= tr.io_snpt_useSnpt; 
    vif.drv_mp.drv_cb.io_snpt_snptSelect <= tr.io_snpt_snptSelect; 
    vif.drv_mp.drv_cb.io_snpt_flushVec_0 <= tr.io_snpt_flushVec_0; 
    vif.drv_mp.drv_cb.io_snpt_flushVec_1 <= tr.io_snpt_flushVec_1; 
    vif.drv_mp.drv_cb.io_snpt_flushVec_2 <= tr.io_snpt_flushVec_2; 
    vif.drv_mp.drv_cb.io_snpt_flushVec_3 <= tr.io_snpt_flushVec_3; 
    vif.drv_mp.drv_cb.io_wfi_safeFromMem <= tr.io_wfi_safeFromMem; 
    vif.drv_mp.drv_cb.io_wfi_safeFromFrontend <= tr.io_wfi_safeFromFrontend; 
    vif.drv_mp.drv_cb.io_wfi_enable <= tr.io_wfi_enable; 
    vif.drv_mp.drv_cb.io_fromVecExcpMod_busy <= tr.io_fromVecExcpMod_busy; 
    vif.drv_mp.drv_cb.io_readGPAMemData_gpaddr <= tr.io_readGPAMemData_gpaddr; 
    vif.drv_mp.drv_cb.io_readGPAMemData_isForVSnonLeafPTE <= tr.io_readGPAMemData_isForVSnonLeafPTE; 
    vif.drv_mp.drv_cb.io_vstartIsZero <= tr.io_vstartIsZero; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_canAccept <= tr.io_debugEnqLsq_canAccept; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_0 <= tr.io_debugEnqLsq_needAlloc_0; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_1 <= tr.io_debugEnqLsq_needAlloc_1; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_2 <= tr.io_debugEnqLsq_needAlloc_2; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_3 <= tr.io_debugEnqLsq_needAlloc_3; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_4 <= tr.io_debugEnqLsq_needAlloc_4; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_5 <= tr.io_debugEnqLsq_needAlloc_5; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_valid <= tr.io_debugEnqLsq_req_0_valid; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_bits_robIdx_value <= tr.io_debugEnqLsq_req_0_bits_robIdx_value; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_bits_lqIdx_value <= tr.io_debugEnqLsq_req_0_bits_lqIdx_value; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_valid <= tr.io_debugEnqLsq_req_1_valid; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_bits_robIdx_value <= tr.io_debugEnqLsq_req_1_bits_robIdx_value; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_bits_lqIdx_value <= tr.io_debugEnqLsq_req_1_bits_lqIdx_value; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_valid <= tr.io_debugEnqLsq_req_2_valid; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_bits_robIdx_value <= tr.io_debugEnqLsq_req_2_bits_robIdx_value; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_bits_lqIdx_value <= tr.io_debugEnqLsq_req_2_bits_lqIdx_value; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_valid <= tr.io_debugEnqLsq_req_3_valid; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_bits_robIdx_value <= tr.io_debugEnqLsq_req_3_bits_robIdx_value; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_bits_lqIdx_value <= tr.io_debugEnqLsq_req_3_bits_lqIdx_value; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_valid <= tr.io_debugEnqLsq_req_4_valid; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_bits_robIdx_value <= tr.io_debugEnqLsq_req_4_bits_robIdx_value; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_bits_lqIdx_value <= tr.io_debugEnqLsq_req_4_bits_lqIdx_value; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_valid <= tr.io_debugEnqLsq_req_5_valid; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_bits_robIdx_value <= tr.io_debugEnqLsq_req_5_bits_robIdx_value; 
    vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_bits_lqIdx_value <= tr.io_debugEnqLsq_req_5_bits_lqIdx_value; 
    vif.drv_mp.drv_cb.io_debugInstrAddrTransType_bare <= tr.io_debugInstrAddrTransType_bare; 
    vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv39 <= tr.io_debugInstrAddrTransType_sv39; 
    vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv39x4 <= tr.io_debugInstrAddrTransType_sv39x4; 
    vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv48 <= tr.io_debugInstrAddrTransType_sv48; 
    vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv48x4 <= tr.io_debugInstrAddrTransType_sv48x4; 
    vif.drv_mp.drv_cb.io_storeDebugInfo_0_robidx_value <= tr.io_storeDebugInfo_0_robidx_value; 
    vif.drv_mp.drv_cb.io_storeDebugInfo_1_robidx_value <= tr.io_storeDebugInfo_1_robidx_value; 

endtask:send_pkt

task CSR_in_agent_driver::drive_idle(tcnt_dec_base::drv_mode_e drv_mode);

    if(drv_mode==tcnt_dec_base::DRV_0) begin
        vif.drv_mp.drv_cb.io_csr_intrBitSet <= '0;
        vif.drv_mp.drv_cb.io_csr_wfiEvent <= '0;
        vif.drv_mp.drv_cb.io_csr_criticalErrorState <= '0;
        vif.drv_mp.drv_cb.io_snpt_snptDeq <= '0;
        vif.drv_mp.drv_cb.io_snpt_useSnpt <= '0;
        vif.drv_mp.drv_cb.io_snpt_snptSelect <= '0;
        vif.drv_mp.drv_cb.io_snpt_flushVec_0 <= '0;
        vif.drv_mp.drv_cb.io_snpt_flushVec_1 <= '0;
        vif.drv_mp.drv_cb.io_snpt_flushVec_2 <= '0;
        vif.drv_mp.drv_cb.io_snpt_flushVec_3 <= '0;
        vif.drv_mp.drv_cb.io_wfi_safeFromMem <= '0;
        vif.drv_mp.drv_cb.io_wfi_safeFromFrontend <= '0;
        vif.drv_mp.drv_cb.io_wfi_enable <= '0;
        vif.drv_mp.drv_cb.io_fromVecExcpMod_busy <= '0;
        vif.drv_mp.drv_cb.io_readGPAMemData_gpaddr <= '0;
        vif.drv_mp.drv_cb.io_readGPAMemData_isForVSnonLeafPTE <= '0;
        vif.drv_mp.drv_cb.io_vstartIsZero <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_canAccept <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_0 <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_1 <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_2 <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_3 <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_4 <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_5 <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_valid <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_bits_robIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_bits_lqIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_valid <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_bits_robIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_bits_lqIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_valid <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_bits_robIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_bits_lqIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_valid <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_bits_robIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_bits_lqIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_valid <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_bits_robIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_bits_lqIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_valid <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_bits_robIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_bits_lqIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_bare <= '0;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv39 <= '0;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv39x4 <= '0;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv48 <= '0;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv48x4 <= '0;
        vif.drv_mp.drv_cb.io_storeDebugInfo_0_robidx_value <= '0;
        vif.drv_mp.drv_cb.io_storeDebugInfo_1_robidx_value <= '0;

    end
    else if(drv_mode==tcnt_dec_base::DRV_1) begin
        vif.drv_mp.drv_cb.io_csr_intrBitSet <= '1;
        vif.drv_mp.drv_cb.io_csr_wfiEvent <= '1;
        vif.drv_mp.drv_cb.io_csr_criticalErrorState <= '1;
        vif.drv_mp.drv_cb.io_snpt_snptDeq <= '1;
        vif.drv_mp.drv_cb.io_snpt_useSnpt <= '1;
        vif.drv_mp.drv_cb.io_snpt_snptSelect <= '1;
        vif.drv_mp.drv_cb.io_snpt_flushVec_0 <= '1;
        vif.drv_mp.drv_cb.io_snpt_flushVec_1 <= '1;
        vif.drv_mp.drv_cb.io_snpt_flushVec_2 <= '1;
        vif.drv_mp.drv_cb.io_snpt_flushVec_3 <= '1;
        vif.drv_mp.drv_cb.io_wfi_safeFromMem <= '1;
        vif.drv_mp.drv_cb.io_wfi_safeFromFrontend <= '1;
        vif.drv_mp.drv_cb.io_wfi_enable <= '1;
        vif.drv_mp.drv_cb.io_fromVecExcpMod_busy <= '1;
        vif.drv_mp.drv_cb.io_readGPAMemData_gpaddr <= '1;
        vif.drv_mp.drv_cb.io_readGPAMemData_isForVSnonLeafPTE <= '1;
        vif.drv_mp.drv_cb.io_vstartIsZero <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_canAccept <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_0 <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_1 <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_2 <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_3 <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_4 <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_5 <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_valid <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_bits_robIdx_value <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_bits_lqIdx_value <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_valid <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_bits_robIdx_value <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_bits_lqIdx_value <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_valid <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_bits_robIdx_value <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_bits_lqIdx_value <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_valid <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_bits_robIdx_value <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_bits_lqIdx_value <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_valid <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_bits_robIdx_value <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_bits_lqIdx_value <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_valid <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_bits_robIdx_value <= '1;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_bits_lqIdx_value <= '1;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_bare <= '1;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv39 <= '1;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv39x4 <= '1;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv48 <= '1;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv48x4 <= '1;
        vif.drv_mp.drv_cb.io_storeDebugInfo_0_robidx_value <= '1;
        vif.drv_mp.drv_cb.io_storeDebugInfo_1_robidx_value <= '1;

    end
    else if(drv_mode==tcnt_dec_base::DRV_X) begin
        vif.drv_mp.drv_cb.io_csr_intrBitSet <= 'x;
        vif.drv_mp.drv_cb.io_csr_wfiEvent <= 'x;
        vif.drv_mp.drv_cb.io_csr_criticalErrorState <= 'x;
        vif.drv_mp.drv_cb.io_snpt_snptDeq <= 'x;
        vif.drv_mp.drv_cb.io_snpt_useSnpt <= 'x;
        vif.drv_mp.drv_cb.io_snpt_snptSelect <= 'x;
        vif.drv_mp.drv_cb.io_snpt_flushVec_0 <= 'x;
        vif.drv_mp.drv_cb.io_snpt_flushVec_1 <= 'x;
        vif.drv_mp.drv_cb.io_snpt_flushVec_2 <= 'x;
        vif.drv_mp.drv_cb.io_snpt_flushVec_3 <= 'x;
        vif.drv_mp.drv_cb.io_wfi_safeFromMem <= 'x;
        vif.drv_mp.drv_cb.io_wfi_safeFromFrontend <= 'x;
        vif.drv_mp.drv_cb.io_wfi_enable <= 'x;
        vif.drv_mp.drv_cb.io_fromVecExcpMod_busy <= 'x;
        vif.drv_mp.drv_cb.io_readGPAMemData_gpaddr <= 'x;
        vif.drv_mp.drv_cb.io_readGPAMemData_isForVSnonLeafPTE <= 'x;
        vif.drv_mp.drv_cb.io_vstartIsZero <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_canAccept <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_0 <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_1 <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_2 <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_3 <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_4 <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_5 <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_valid <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_bits_robIdx_value <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_bits_lqIdx_value <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_valid <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_bits_robIdx_value <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_bits_lqIdx_value <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_valid <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_bits_robIdx_value <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_bits_lqIdx_value <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_valid <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_bits_robIdx_value <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_bits_lqIdx_value <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_valid <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_bits_robIdx_value <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_bits_lqIdx_value <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_valid <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_bits_robIdx_value <= 'x;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_bits_lqIdx_value <= 'x;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_bare <= 'x;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv39 <= 'x;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv39x4 <= 'x;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv48 <= 'x;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv48x4 <= 'x;
        vif.drv_mp.drv_cb.io_storeDebugInfo_0_robidx_value <= 'x;
        vif.drv_mp.drv_cb.io_storeDebugInfo_1_robidx_value <= 'x;

    end
    else if(drv_mode==tcnt_dec_base::DRV_RAND) begin
        vif.drv_mp.drv_cb.io_csr_intrBitSet <= $urandom;
        vif.drv_mp.drv_cb.io_csr_wfiEvent <= $urandom;
        vif.drv_mp.drv_cb.io_csr_criticalErrorState <= $urandom;
        vif.drv_mp.drv_cb.io_snpt_snptDeq <= $urandom;
        vif.drv_mp.drv_cb.io_snpt_useSnpt <= $urandom;
        vif.drv_mp.drv_cb.io_snpt_snptSelect <= $urandom;
        vif.drv_mp.drv_cb.io_snpt_flushVec_0 <= $urandom;
        vif.drv_mp.drv_cb.io_snpt_flushVec_1 <= $urandom;
        vif.drv_mp.drv_cb.io_snpt_flushVec_2 <= $urandom;
        vif.drv_mp.drv_cb.io_snpt_flushVec_3 <= $urandom;
        vif.drv_mp.drv_cb.io_wfi_safeFromMem <= $urandom;
        vif.drv_mp.drv_cb.io_wfi_safeFromFrontend <= $urandom;
        vif.drv_mp.drv_cb.io_wfi_enable <= $urandom;
        vif.drv_mp.drv_cb.io_fromVecExcpMod_busy <= $urandom;
        vif.drv_mp.drv_cb.io_readGPAMemData_gpaddr <= $urandom;
        vif.drv_mp.drv_cb.io_readGPAMemData_isForVSnonLeafPTE <= $urandom;
        vif.drv_mp.drv_cb.io_vstartIsZero <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_canAccept <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_0 <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_1 <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_2 <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_3 <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_4 <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_5 <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_valid <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_bits_robIdx_value <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_bits_lqIdx_value <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_valid <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_bits_robIdx_value <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_bits_lqIdx_value <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_valid <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_bits_robIdx_value <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_bits_lqIdx_value <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_valid <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_bits_robIdx_value <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_bits_lqIdx_value <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_valid <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_bits_robIdx_value <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_bits_lqIdx_value <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_valid <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_bits_robIdx_value <= $urandom;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_bits_lqIdx_value <= $urandom;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_bare <= $urandom;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv39 <= $urandom;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv39x4 <= $urandom;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv48 <= $urandom;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv48x4 <= $urandom;
        vif.drv_mp.drv_cb.io_storeDebugInfo_0_robidx_value <= $urandom;
        vif.drv_mp.drv_cb.io_storeDebugInfo_1_robidx_value <= $urandom;

    end
    else if(drv_mode==tcnt_dec_base::DRV_LST) begin
        vif.drv_mp.drv_cb.io_csr_intrBitSet <= '0;
        vif.drv_mp.drv_cb.io_csr_wfiEvent <= '0;
        vif.drv_mp.drv_cb.io_csr_criticalErrorState <= '0;
        vif.drv_mp.drv_cb.io_snpt_snptDeq <= '0;
        vif.drv_mp.drv_cb.io_snpt_useSnpt <= '0;
        vif.drv_mp.drv_cb.io_snpt_snptSelect <= '0;
        vif.drv_mp.drv_cb.io_snpt_flushVec_0 <= '0;
        vif.drv_mp.drv_cb.io_snpt_flushVec_1 <= '0;
        vif.drv_mp.drv_cb.io_snpt_flushVec_2 <= '0;
        vif.drv_mp.drv_cb.io_snpt_flushVec_3 <= '0;
        vif.drv_mp.drv_cb.io_wfi_safeFromMem <= '0;
        vif.drv_mp.drv_cb.io_wfi_safeFromFrontend <= '0;
        vif.drv_mp.drv_cb.io_wfi_enable <= '0;
        vif.drv_mp.drv_cb.io_fromVecExcpMod_busy <= '0;
        vif.drv_mp.drv_cb.io_readGPAMemData_gpaddr <= '0;
        vif.drv_mp.drv_cb.io_readGPAMemData_isForVSnonLeafPTE <= '0;
        vif.drv_mp.drv_cb.io_vstartIsZero <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_canAccept <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_0 <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_1 <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_2 <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_3 <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_4 <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_needAlloc_5 <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_valid <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_bits_robIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_0_bits_lqIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_valid <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_bits_robIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_1_bits_lqIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_valid <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_bits_robIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_2_bits_lqIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_valid <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_bits_robIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_3_bits_lqIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_valid <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_bits_robIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_4_bits_lqIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_valid <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_bits_robIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugEnqLsq_req_5_bits_lqIdx_value <= '0;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_bare <= '0;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv39 <= '0;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv39x4 <= '0;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv48 <= '0;
        vif.drv_mp.drv_cb.io_debugInstrAddrTransType_sv48x4 <= '0;
        vif.drv_mp.drv_cb.io_storeDebugInfo_0_robidx_value <= '0;
        vif.drv_mp.drv_cb.io_storeDebugInfo_1_robidx_value <= '0;

    end

endtask:drive_idle

`endif

