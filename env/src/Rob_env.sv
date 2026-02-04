//=========================================================
//File name    : Rob_env.sv
//Author       : nanyunhao
//Module name  : Rob_env
//Discribution : Rob_env : environment top
//Date         : 2026-01-22
//=========================================================
`ifndef ROB_ENV__SV
`define ROB_ENV__SV

class Rob_env  extends tcnt_env_base;

    Rob_env_cfg cfg;

    rename_in_agent  u_rename_in_agent    ;
    uvm_tlm_analysis_fifo #(rename_in_agent_xaction) rename_in_mon2rm_fifo;

    WriteBack_in_agent  u_WriteBack_in_agent    ;
    uvm_tlm_analysis_fifo #(WriteBack_in_agent_xaction) WriteBack_in_mon2rm_fifo;

    Redirect_in_agent  u_Redirect_in_agent    ;
    uvm_tlm_analysis_fifo #(Redirect_in_agent_xaction) Redirect_in_mon2rm_fifo;

    CSR_in_agent  u_CSR_in_agent    ;
    uvm_tlm_analysis_fifo #(CSR_in_agent_xaction) CSR_in_mon2rm_fifo;

    Mem_in_agent  u_Mem_in_agent    ;
    uvm_tlm_analysis_fifo #(Mem_in_agent_xaction) Mem_in_mon2rm_fifo;

    Rob_output_agent  u_Rob_output_agent    ;
    uvm_tlm_analysis_fifo #(Rob_output_agent_xaction) Rob_output_mon2rm_fifo;

    uvm_tlm_analysis_fifo #(Rob_common_xaction) rm2scb_exp_fifo;
    uvm_tlm_analysis_fifo #(Rob_common_xaction) rm2scb_act_fifo;

    Rob_rm  rm;
    //aa_test_reg_model	reg_model;
    tcnt_scb_base #(Rob_common_xaction) scb;

    `uvm_component_utils(Rob_env)

    extern         function      new(string name , uvm_component parent);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
endclass

function Rob_env::new(string name , uvm_component parent);
    super.new(name, parent);
endfunction

function void Rob_env::build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db#(Rob_env_cfg)::get(this,"","cfg",this.cfg)) begin
        cfg = Rob_env_cfg::type_id::create("cfg",this);
        void'(this.cfg.randomize());
        `uvm_info(get_type_name(),$sformatf("build_phase: env cfg is not set, create and randomize by self!!!"),UVM_NONE);
    end else begin
        `uvm_info(get_type_name(),$sformatf("build_phase: get_cfg !!!"),UVM_DEBUG);
    end

    rename_in_mon2rm_fifo = new($sformatf("rename_in_mon2rm_fifo"),this) ;
    this.u_rename_in_agent = rename_in_agent::type_id::create("u_rename_in_agent",this);
    uvm_config_db#(rename_in_agent_cfg)::set(this,"u_rename_in_agent","cfg",this.cfg.u_rename_in_agent_cfg) ;

    WriteBack_in_mon2rm_fifo = new($sformatf("WriteBack_in_mon2rm_fifo"),this) ;
    this.u_WriteBack_in_agent = WriteBack_in_agent::type_id::create("u_WriteBack_in_agent",this);
    uvm_config_db#(WriteBack_in_agent_cfg)::set(this,"u_WriteBack_in_agent","cfg",this.cfg.u_WriteBack_in_agent_cfg) ;

    Redirect_in_mon2rm_fifo = new($sformatf("Redirect_in_mon2rm_fifo"),this) ;
    this.u_Redirect_in_agent = Redirect_in_agent::type_id::create("u_Redirect_in_agent",this);
    uvm_config_db#(Redirect_in_agent_cfg)::set(this,"u_Redirect_in_agent","cfg",this.cfg.u_Redirect_in_agent_cfg) ;

    CSR_in_mon2rm_fifo = new($sformatf("CSR_in_mon2rm_fifo"),this) ;
    this.u_CSR_in_agent = CSR_in_agent::type_id::create("u_CSR_in_agent",this);
    uvm_config_db#(CSR_in_agent_cfg)::set(this,"u_CSR_in_agent","cfg",this.cfg.u_CSR_in_agent_cfg) ;

    Mem_in_mon2rm_fifo = new($sformatf("Mem_in_mon2rm_fifo"),this) ;
    this.u_Mem_in_agent = Mem_in_agent::type_id::create("u_Mem_in_agent",this);
    uvm_config_db#(Mem_in_agent_cfg)::set(this,"u_Mem_in_agent","cfg",this.cfg.u_Mem_in_agent_cfg) ;

    Rob_output_mon2rm_fifo = new($sformatf("Rob_output_mon2rm_fifo"),this) ;
    this.u_Rob_output_agent = Rob_output_agent::type_id::create("u_Rob_output_agent",this);
    uvm_config_db#(Rob_output_agent_cfg)::set(this,"u_Rob_output_agent","cfg",this.cfg.u_Rob_output_agent_cfg) ;

    rm2scb_exp_fifo = new($sformatf("rm2scb_exp_fifo"),this) ;
    rm2scb_act_fifo = new($sformatf("rm2scb_act_fifo"),this) ;

    this.rm = Rob_rm::type_id::create("rm", this);
    uvm_config_db#(Rob_env_cfg)::set(this,"rm","cfg",this.cfg) ;
    this.scb = tcnt_scb_base#(Rob_common_xaction)::type_id::create("scb", this);

endfunction

function void Rob_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //rm.reg_model = this.reg_model;

    this.u_rename_in_agent.mon_item_port.connect(this.rename_in_mon2rm_fifo.analysis_export);
    this.rm.rename_in_mon_item_port.connect(this.rename_in_mon2rm_fifo.blocking_get_export);

    this.u_WriteBack_in_agent.mon_item_port.connect(this.WriteBack_in_mon2rm_fifo.analysis_export);
    this.rm.WriteBack_in_mon_item_port.connect(this.WriteBack_in_mon2rm_fifo.blocking_get_export);

    this.u_Redirect_in_agent.mon_item_port.connect(this.Redirect_in_mon2rm_fifo.analysis_export);
    this.rm.Redirect_in_mon_item_port.connect(this.Redirect_in_mon2rm_fifo.blocking_get_export);

    this.u_CSR_in_agent.mon_item_port.connect(this.CSR_in_mon2rm_fifo.analysis_export);
    this.rm.CSR_in_mon_item_port.connect(this.CSR_in_mon2rm_fifo.blocking_get_export);

    this.u_Mem_in_agent.mon_item_port.connect(this.Mem_in_mon2rm_fifo.analysis_export);
    this.rm.Mem_in_mon_item_port.connect(this.Mem_in_mon2rm_fifo.blocking_get_export);

    this.u_Rob_output_agent.mon_item_port.connect(this.Rob_output_mon2rm_fifo.analysis_export);
    this.rm.Rob_output_mon_item_port.connect(this.Rob_output_mon2rm_fifo.blocking_get_export);

    this.rm.rm_item_exp_port.connect(this.rm2scb_exp_fifo.analysis_export);
    this.scb.exp_port.connect(this.rm2scb_exp_fifo.blocking_get_export);
    this.rm.rm_item_act_port.connect(this.rm2scb_act_fifo.analysis_export);
    this.scb.act_port.connect(this.rm2scb_act_fifo.blocking_get_export);

endfunction

`endif

