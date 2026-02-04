//=========================================================
//File name    : Rob_rm.sv
//Author       : nanyunhao
//Module name  : Rob_rm
//Discribution : Rob_rm : reference model
//Date         : 2026-01-22
//=========================================================
`ifndef ROB_RM__SV
`define ROB_RM__SV

class Rob_rm  extends tcnt_rm_base #(.seq_item_t(Rob_common_xaction));

    //virtual tc_if vif;
    Rob_env_cfg cfg;

    //aa_test_reg_model		reg_model;

    uvm_blocking_get_port #(rename_in_agent_xaction) rename_in_mon_item_port;
    uvm_blocking_get_port #(WriteBack_in_agent_xaction) WriteBack_in_mon_item_port;
    uvm_blocking_get_port #(Redirect_in_agent_xaction) Redirect_in_mon_item_port;
    uvm_blocking_get_port #(CSR_in_agent_xaction) CSR_in_mon_item_port;
    uvm_blocking_get_port #(Mem_in_agent_xaction) Mem_in_mon_item_port;
    uvm_blocking_get_port #(Rob_output_agent_xaction) Rob_output_mon_item_port;

    `uvm_component_utils(Rob_rm)

    extern         function      new(string name , uvm_component parent);
    extern         function void build_phase(uvm_phase phase);
    extern virtual task main_phase(uvm_phase phase);
    extern virtual task main_process();
endclass

function Rob_rm::new(string name , uvm_component parent);
    super.new(name, parent);
endfunction

function void Rob_rm::build_phase(uvm_phase phase);
    super.build_phase(phase);
    //if(!uvm_config_db#(virtual tc_if)::get(this, "", "vif", vif)) begin
    //    `uvm_fatal(get_type_name(),$sformatf("virtual interface must be set for vif(tc_if)!!!"))
    //end
    if(!uvm_config_db#(Rob_env_cfg)::get(this,"","cfg",this.cfg)) begin
        `uvm_fatal(get_type_name(),$sformatf("build_phase: env cfg is not set!!!"));
    end else begin
        `uvm_info(get_type_name(),$sformatf("build_phase: get_cfg !!!"),UVM_DEBUG);
    end

    this.rename_in_mon_item_port = new($sformatf("rename_in_mon_item_port"), this);
    this.WriteBack_in_mon_item_port = new($sformatf("WriteBack_in_mon_item_port"), this);
    this.Redirect_in_mon_item_port = new($sformatf("Redirect_in_mon_item_port"), this);
    this.CSR_in_mon_item_port = new($sformatf("CSR_in_mon_item_port"), this);
    this.Mem_in_mon_item_port = new($sformatf("Mem_in_mon_item_port"), this);
    this.Rob_output_mon_item_port = new($sformatf("Rob_output_mon_item_port"), this);

endfunction

task Rob_rm::main_phase(uvm_phase phase);
    super.main_phase(phase);
    this.main_process();
endtask

task Rob_rm::main_process();

    rename_in_agent_xaction  rename_in_tr_in;
    Rob_common_xaction  rename_in_tr_out;

    WriteBack_in_agent_xaction  WriteBack_in_tr_in;
    Rob_common_xaction  WriteBack_in_tr_out;

    Redirect_in_agent_xaction  Redirect_in_tr_in;
    Rob_common_xaction  Redirect_in_tr_out;

    CSR_in_agent_xaction  CSR_in_tr_in;
    Rob_common_xaction  CSR_in_tr_out;

    Mem_in_agent_xaction  Mem_in_tr_in;
    Rob_common_xaction  Mem_in_tr_out;

    Rob_output_agent_xaction  Rob_output_tr_in;
    Rob_common_xaction  Rob_output_tr_out;

    fork

        while(1)begin
            this.rename_in_mon_item_port.get(rename_in_tr_in);
            `uvm_info(get_type_name(),$sformatf("rename_in_mon_item_port get as %s",rename_in_tr_in.psdisplay()),UVM_DEBUG)
            //if(!$cast(rename_in_tr_out, rename_in_tr_in)) begin
            //    `uvm_fatal(get_type_name(),$sformatf("rename_in_tr_in,is not a Rob_common_xaction or its extend"))
            //end
            rename_in_tr_out = Rob_common_xaction::type_id::create("rename_in_tr_out");
            rename_in_tr_out.channel_id = rename_in_tr_in.channel_id;
            rename_in_tr_out.pack_rename_in(rename_in_tr_in);

            this.rm_item_exp_port.write(rename_in_tr_out);
            //this.rm_item_act_port.write(rename_in_tr_out);
        end

        while(1)begin
            this.WriteBack_in_mon_item_port.get(WriteBack_in_tr_in);
            `uvm_info(get_type_name(),$sformatf("WriteBack_in_mon_item_port get as %s",WriteBack_in_tr_in.psdisplay()),UVM_DEBUG)
            //if(!$cast(WriteBack_in_tr_out, WriteBack_in_tr_in)) begin
            //    `uvm_fatal(get_type_name(),$sformatf("WriteBack_in_tr_in,is not a Rob_common_xaction or its extend"))
            //end
            WriteBack_in_tr_out = Rob_common_xaction::type_id::create("WriteBack_in_tr_out");
            WriteBack_in_tr_out.channel_id = WriteBack_in_tr_in.channel_id;
            WriteBack_in_tr_out.pack_WriteBack_in(WriteBack_in_tr_in);

            this.rm_item_exp_port.write(WriteBack_in_tr_out);
            //this.rm_item_act_port.write(WriteBack_in_tr_out);
        end

        while(1)begin
            this.Redirect_in_mon_item_port.get(Redirect_in_tr_in);
            `uvm_info(get_type_name(),$sformatf("Redirect_in_mon_item_port get as %s",Redirect_in_tr_in.psdisplay()),UVM_DEBUG)
            //if(!$cast(Redirect_in_tr_out, Redirect_in_tr_in)) begin
            //    `uvm_fatal(get_type_name(),$sformatf("Redirect_in_tr_in,is not a Rob_common_xaction or its extend"))
            //end
            Redirect_in_tr_out = Rob_common_xaction::type_id::create("Redirect_in_tr_out");
            Redirect_in_tr_out.channel_id = Redirect_in_tr_in.channel_id;
            Redirect_in_tr_out.pack_Redirect_in(Redirect_in_tr_in);

            this.rm_item_exp_port.write(Redirect_in_tr_out);
            //this.rm_item_act_port.write(Redirect_in_tr_out);
        end

        while(1)begin
            this.CSR_in_mon_item_port.get(CSR_in_tr_in);
            `uvm_info(get_type_name(),$sformatf("CSR_in_mon_item_port get as %s",CSR_in_tr_in.psdisplay()),UVM_DEBUG)
            //if(!$cast(CSR_in_tr_out, CSR_in_tr_in)) begin
            //    `uvm_fatal(get_type_name(),$sformatf("CSR_in_tr_in,is not a Rob_common_xaction or its extend"))
            //end
            CSR_in_tr_out = Rob_common_xaction::type_id::create("CSR_in_tr_out");
            CSR_in_tr_out.channel_id = CSR_in_tr_in.channel_id;
            CSR_in_tr_out.pack_CSR_in(CSR_in_tr_in);

            this.rm_item_exp_port.write(CSR_in_tr_out);
            //this.rm_item_act_port.write(CSR_in_tr_out);
        end

        while(1)begin
            this.Mem_in_mon_item_port.get(Mem_in_tr_in);
            `uvm_info(get_type_name(),$sformatf("Mem_in_mon_item_port get as %s",Mem_in_tr_in.psdisplay()),UVM_DEBUG)
            //if(!$cast(Mem_in_tr_out, Mem_in_tr_in)) begin
            //    `uvm_fatal(get_type_name(),$sformatf("Mem_in_tr_in,is not a Rob_common_xaction or its extend"))
            //end
            Mem_in_tr_out = Rob_common_xaction::type_id::create("Mem_in_tr_out");
            Mem_in_tr_out.channel_id = Mem_in_tr_in.channel_id;
            Mem_in_tr_out.pack_Mem_in(Mem_in_tr_in);

            this.rm_item_exp_port.write(Mem_in_tr_out);
            //this.rm_item_act_port.write(Mem_in_tr_out);
        end

        while(1)begin
            this.Rob_output_mon_item_port.get(Rob_output_tr_in);
            `uvm_info(get_type_name(),$sformatf("Rob_output_mon_item_port get as %s",Rob_output_tr_in.psdisplay()),UVM_DEBUG)
            //if(!$cast(Rob_output_tr_out, Rob_output_tr_in)) begin
            //    `uvm_fatal(get_type_name(),$sformatf("Rob_output_tr_in,is not a Rob_common_xaction or its extend"))
            //end
            Rob_output_tr_out = Rob_common_xaction::type_id::create("Rob_output_tr_out");
            Rob_output_tr_out.channel_id = Rob_output_tr_in.channel_id;
            Rob_output_tr_out.pack_Rob_output(Rob_output_tr_in);

            this.rm_item_exp_port.write(Rob_output_tr_out);
            //this.rm_item_act_port.write(Rob_output_tr_out);
        end

    join_none
endtask

`endif

