//=========================================================
//File name    : Redirect_in_agent_monitor.sv
//Author       : nanyunhao
//Module name  : Redirect_in_agent_monitor
//Discribution : Redirect_in_agent_monitor : monitor
//Date         : 2026-01-22
//=========================================================
`ifndef REDIRECT_IN_AGENT_MONITOR__SV
`define REDIRECT_IN_AGENT_MONITOR__SV

class Redirect_in_agent_monitor  extends tcnt_monitor_base#(virtual Redirect_in_agent_interface,Redirect_in_agent_cfg,Redirect_in_agent_xaction);

    `uvm_component_utils(Redirect_in_agent_monitor)

    extern function new(string name, uvm_component parent);
    extern virtual function void build_phase(uvm_phase phase);
    extern task run_phase(uvm_phase phase);
    extern task mon_data();
endclass:Redirect_in_agent_monitor

function Redirect_in_agent_monitor::new(string name, uvm_component parent);
    super.new(name,parent);
endfunction:new

function void Redirect_in_agent_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction:build_phase

task Redirect_in_agent_monitor::run_phase(uvm_phase phase);
    super.run_phase(phase);
    this.mon_data();
endtask:run_phase

task Redirect_in_agent_monitor::mon_data();

    logic         io_redirect_valid    ;
    logic         io_redirect_bits_robIdx_flag;
    logic [7:0]   io_redirect_bits_robIdx_value;
    logic         io_redirect_bits_level;

    Redirect_in_agent_xaction  mon_tr;
    while(1) begin
        @this.vif.mon_mp.mon_cb;
        io_redirect_valid = this.vif.mon_mp.mon_cb.io_redirect_valid;
        io_redirect_bits_robIdx_flag = this.vif.mon_mp.mon_cb.io_redirect_bits_robIdx_flag;
        io_redirect_bits_robIdx_value = this.vif.mon_mp.mon_cb.io_redirect_bits_robIdx_value;
        io_redirect_bits_level = this.vif.mon_mp.mon_cb.io_redirect_bits_level;

        if(this.cfg.xz_sw==tcnt_dec_base::ON & this.vif.rst_n==1'b1) begin
            `TCNT_CHECK_SIG_XZ(io_redirect_valid,io_redirect_valid,1);
            `TCNT_CHECK_SIG_XZ(io_redirect_bits_robIdx_flag,io_redirect_bits_robIdx_flag,1);
            `TCNT_CHECK_SIG_XZ(io_redirect_bits_robIdx_value,io_redirect_bits_robIdx_value,8);
            `TCNT_CHECK_SIG_XZ(io_redirect_bits_level,io_redirect_bits_level,1);

        end
        //if(xxxTODOxxx==1'b1) begin
        //    mon_tr = Redirect_in_agent_xaction::type_id::create("mon_tr");
        //    mon_tr.io_redirect_valid = io_redirect_valid;
        //    mon_tr.io_redirect_bits_robIdx_flag = io_redirect_bits_robIdx_flag;
        //    mon_tr.io_redirect_bits_robIdx_value = io_redirect_bits_robIdx_value;
        //    mon_tr.io_redirect_bits_level = io_redirect_bits_level;

        //    mon_tr.channel_id = this.cfg.channel_id;
        //    mon_tr.unpack();
        //    this.mon_item_port.write(mon_tr);
        //end
    end
endtask:mon_data

`endif

