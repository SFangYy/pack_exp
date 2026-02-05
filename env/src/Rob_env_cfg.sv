//=========================================================
//File name    : Rob_env_cfg.sv
//Author       : nanyunhao
//Module name  : Rob_env_cfg
//Discribution : Rob_env_cfg : environment configuration
//Date         : 2026-01-22
//=========================================================
`ifndef ROB_ENV_CFG__SV
`define ROB_ENV_CFG__SV

class Rob_env_cfg extends uvm_object;

    rand rename_in_agent_cfg       u_rename_in_agent_cfg;
    rand WriteBack_in_agent_cfg    u_WriteBack_in_agent_cfg;
    rand Redirect_in_agent_cfg     u_Redirect_in_agent_cfg;
    rand CSR_in_agent_cfg          u_CSR_in_agent_cfg;
    rand Mem_in_agent_cfg          u_Mem_in_agent_cfg;
    rand Rob_output_agent_cfg      u_Rob_output_agent_cfg;

    `uvm_object_utils_begin(Rob_env_cfg)
    `uvm_object_utils_end

    extern function new(string name="Rob_env_cfg");
    extern function void pre_randomize();
    extern function void post_randomize();

endclass:Rob_env_cfg

function Rob_env_cfg::new(string  name = "Rob_env_cfg");
    super.new(name);
    this.u_rename_in_agent_cfg     = rename_in_agent_cfg::type_id::create("u_rename_in_agent_cfg");
    this.u_WriteBack_in_agent_cfg  = WriteBack_in_agent_cfg::type_id::create("u_WriteBack_in_agent_cfg");
    this.u_Redirect_in_agent_cfg   = Redirect_in_agent_cfg::type_id::create("u_Redirect_in_agent_cfg");
    this.u_CSR_in_agent_cfg        = CSR_in_agent_cfg::type_id::create("u_CSR_in_agent_cfg");
    this.u_Mem_in_agent_cfg        = Mem_in_agent_cfg::type_id::create("u_Mem_in_agent_cfg");
    this.u_Rob_output_agent_cfg    = Rob_output_agent_cfg::type_id::create("u_Rob_output_agent_cfg");

endfunction:new

function void Rob_env_cfg::pre_randomize();
    super.pre_randomize();
endfunction:pre_randomize

function void Rob_env_cfg::post_randomize();
    super.post_randomize();

    this.u_rename_in_agent_cfg.sqr_sw = tcnt_dec_base::ON  ;
    this.u_rename_in_agent_cfg.drv_sw = tcnt_dec_base::ON  ;
    this.u_rename_in_agent_cfg.mon_sw = tcnt_dec_base::ON ;
    this.u_rename_in_agent_cfg.xz_sw = tcnt_dec_base::OFF ; // Disable XZ check for Python integration
    this.u_rename_in_agent_cfg.channel_id = 0;

    this.u_WriteBack_in_agent_cfg.sqr_sw = tcnt_dec_base::ON  ;
    this.u_WriteBack_in_agent_cfg.drv_sw = tcnt_dec_base::ON  ;
    this.u_WriteBack_in_agent_cfg.mon_sw = tcnt_dec_base::ON ;
    this.u_WriteBack_in_agent_cfg.xz_sw = tcnt_dec_base::OFF ; // Disable XZ check for Python integration
    this.u_WriteBack_in_agent_cfg.channel_id = 1;

    this.u_Redirect_in_agent_cfg.sqr_sw = tcnt_dec_base::ON  ;
    this.u_Redirect_in_agent_cfg.drv_sw = tcnt_dec_base::ON  ;
    this.u_Redirect_in_agent_cfg.mon_sw = tcnt_dec_base::ON ;
    this.u_Redirect_in_agent_cfg.xz_sw = tcnt_dec_base::OFF ; // Disable XZ check for Python integration
    this.u_Redirect_in_agent_cfg.channel_id = 2;

    this.u_CSR_in_agent_cfg.sqr_sw = tcnt_dec_base::ON  ;
    this.u_CSR_in_agent_cfg.drv_sw = tcnt_dec_base::ON  ;
    this.u_CSR_in_agent_cfg.mon_sw = tcnt_dec_base::ON ;
    this.u_CSR_in_agent_cfg.xz_sw = tcnt_dec_base::OFF ; // Disable XZ check for Python integration
    this.u_CSR_in_agent_cfg.channel_id = 3;

    this.u_Mem_in_agent_cfg.sqr_sw = tcnt_dec_base::ON  ;
    this.u_Mem_in_agent_cfg.drv_sw = tcnt_dec_base::ON  ;
    this.u_Mem_in_agent_cfg.mon_sw = tcnt_dec_base::ON ;
    this.u_Mem_in_agent_cfg.xz_sw = tcnt_dec_base::OFF ; // Disable XZ check for Python integration
    this.u_Mem_in_agent_cfg.channel_id = 4;

    this.u_Rob_output_agent_cfg.sqr_sw = tcnt_dec_base::ON  ;
    this.u_Rob_output_agent_cfg.drv_sw = tcnt_dec_base::ON  ;
    this.u_Rob_output_agent_cfg.mon_sw = tcnt_dec_base::ON ;
    this.u_Rob_output_agent_cfg.xz_sw = tcnt_dec_base::OFF ; // Disable XZ check for Python integration
    this.u_Rob_output_agent_cfg.channel_id = 5;

endfunction:post_randomize

`endif

