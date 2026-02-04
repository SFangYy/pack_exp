//=========================================================
//File name    : Mem_in_agent_monitor.sv
//Author       : nanyunhao
//Module name  : Mem_in_agent_monitor
//Discribution : Mem_in_agent_monitor : monitor
//Date         : 2026-01-22
//=========================================================
`ifndef MEM_IN_AGENT_MONITOR__SV
`define MEM_IN_AGENT_MONITOR__SV

class Mem_in_agent_monitor  extends tcnt_monitor_base#(virtual Mem_in_agent_interface,Mem_in_agent_cfg,Mem_in_agent_xaction);

    `uvm_component_utils(Mem_in_agent_monitor)

    extern function new(string name, uvm_component parent);
    extern virtual function void build_phase(uvm_phase phase);
    extern task run_phase(uvm_phase phase);
    extern task mon_data();
endclass:Mem_in_agent_monitor

function Mem_in_agent_monitor::new(string name, uvm_component parent);
    super.new(name,parent);
endfunction:new

function void Mem_in_agent_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction:build_phase

task Mem_in_agent_monitor::run_phase(uvm_phase phase);
    super.run_phase(phase);
    this.mon_data();
endtask:run_phase

task Mem_in_agent_monitor::mon_data();

    logic         io_lsq_mmio_0        ;
    logic         io_lsq_mmio_1        ;
    logic         io_lsq_mmio_2        ;
    logic [7:0]   io_lsq_uop_0_robIdx_value;
    logic [7:0]   io_lsq_uop_1_robIdx_value;
    logic [7:0]   io_lsq_uop_2_robIdx_value;

    Mem_in_agent_xaction  mon_tr;
    while(1) begin
        @this.vif.mon_mp.mon_cb;
        io_lsq_mmio_0 = this.vif.mon_mp.mon_cb.io_lsq_mmio_0;
        io_lsq_mmio_1 = this.vif.mon_mp.mon_cb.io_lsq_mmio_1;
        io_lsq_mmio_2 = this.vif.mon_mp.mon_cb.io_lsq_mmio_2;
        io_lsq_uop_0_robIdx_value = this.vif.mon_mp.mon_cb.io_lsq_uop_0_robIdx_value;
        io_lsq_uop_1_robIdx_value = this.vif.mon_mp.mon_cb.io_lsq_uop_1_robIdx_value;
        io_lsq_uop_2_robIdx_value = this.vif.mon_mp.mon_cb.io_lsq_uop_2_robIdx_value;

        if(this.cfg.xz_sw==tcnt_dec_base::ON & this.vif.rst_n==1'b1) begin
            `TCNT_CHECK_SIG_XZ(io_lsq_mmio_0,io_lsq_mmio_0,1);
            `TCNT_CHECK_SIG_XZ(io_lsq_mmio_1,io_lsq_mmio_1,1);
            `TCNT_CHECK_SIG_XZ(io_lsq_mmio_2,io_lsq_mmio_2,1);
            `TCNT_CHECK_SIG_XZ(io_lsq_uop_0_robIdx_value,io_lsq_uop_0_robIdx_value,8);
            `TCNT_CHECK_SIG_XZ(io_lsq_uop_1_robIdx_value,io_lsq_uop_1_robIdx_value,8);
            `TCNT_CHECK_SIG_XZ(io_lsq_uop_2_robIdx_value,io_lsq_uop_2_robIdx_value,8);

        end
        //if(xxxTODOxxx==1'b1) begin
        //    mon_tr = Mem_in_agent_xaction::type_id::create("mon_tr");
        //    mon_tr.io_lsq_mmio_0 = io_lsq_mmio_0;
        //    mon_tr.io_lsq_mmio_1 = io_lsq_mmio_1;
        //    mon_tr.io_lsq_mmio_2 = io_lsq_mmio_2;
        //    mon_tr.io_lsq_uop_0_robIdx_value = io_lsq_uop_0_robIdx_value;
        //    mon_tr.io_lsq_uop_1_robIdx_value = io_lsq_uop_1_robIdx_value;
        //    mon_tr.io_lsq_uop_2_robIdx_value = io_lsq_uop_2_robIdx_value;

        //    mon_tr.channel_id = this.cfg.channel_id;
        //    mon_tr.unpack();
        //    this.mon_item_port.write(mon_tr);
        //end
    end
endtask:mon_data

`endif

