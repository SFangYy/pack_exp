//=========================================================
//File name    : tc_sanity.sv
//Author       : nanyunhao
//Module name  : tc_sanity
//Discribution : tc_sanity : sanity
//Date         : 2026-01-22
//=========================================================
`ifndef TC_SANITY__SV
`define TC_SANITY__SV

`define TC_NAME tc_sanity

class `seq_rename_in(`TC_NAME) extends rename_in_agent_default_sequence;
    int start_send=1;
    function  new(string name= `"`seq_rename_in(`TC_NAME)`");
        super.new(name);
    endfunction

    virtual task body();
        //wait for start
        while(this.start_send==0) begin
            tcnt_realtime::delay_ns(100);
            void'(uvm_config_db#(int)::get(null, get_full_name(), "start_send", start_send));
        end
        repeat(10) begin
            `uvm_create(req)
            //vodi'(req.randomize() with {req.xxx inside {[xxx:xx]};
            //                             req.yyy == yyy;});
            void'(req.randomize());
            `uvm_send(req)
        end
        tcnt_realtime::delay_us(100);
    endtask

    `uvm_object_utils_begin(`seq_rename_in(`TC_NAME))
        `uvm_field_int(start_send,UVM_ALL_ON)
    `uvm_object_utils_end
endclass

class `seq_WriteBack_in(`TC_NAME) extends WriteBack_in_agent_default_sequence;
    int start_send=0;
    function  new(string name= `"`seq_WriteBack_in(`TC_NAME)`");
        super.new(name);
    endfunction

    virtual task body();
        //wait for start
        while(this.start_send==0) begin
            tcnt_realtime::delay_ns(100);
            void'(uvm_config_db#(int)::get(null, get_full_name(), "start_send", start_send));
        end
        repeat(10) begin
            `uvm_create(req)
            //vodi'(req.randomize() with {req.xxx inside {[xxx:xx]};
            //                             req.yyy == yyy;});
            void'(req.randomize());
            `uvm_send(req)
        end
        tcnt_realtime::delay_us(100);
    endtask

    `uvm_object_utils_begin(`seq_WriteBack_in(`TC_NAME))
        `uvm_field_int(start_send,UVM_ALL_ON)
    `uvm_object_utils_end
endclass

class `seq_Redirect_in(`TC_NAME) extends Redirect_in_agent_default_sequence;
    int start_send=0;
    function  new(string name= `"`seq_Redirect_in(`TC_NAME)`");
        super.new(name);
    endfunction

    virtual task body();
        //wait for start
        while(this.start_send==0) begin
            tcnt_realtime::delay_ns(100);
            void'(uvm_config_db#(int)::get(null, get_full_name(), "start_send", start_send));
        end
        repeat(10) begin
            `uvm_create(req)
            //vodi'(req.randomize() with {req.xxx inside {[xxx:xx]};
            //                             req.yyy == yyy;});
            void'(req.randomize());
            `uvm_send(req)
        end
        tcnt_realtime::delay_us(100);
    endtask

    `uvm_object_utils_begin(`seq_Redirect_in(`TC_NAME))
        `uvm_field_int(start_send,UVM_ALL_ON)
    `uvm_object_utils_end
endclass

class `seq_CSR_in(`TC_NAME) extends CSR_in_agent_default_sequence;
    int start_send=0;
    function  new(string name= `"`seq_CSR_in(`TC_NAME)`");
        super.new(name);
    endfunction

    virtual task body();
        //wait for start
        while(this.start_send==0) begin
            tcnt_realtime::delay_ns(100);
            void'(uvm_config_db#(int)::get(null, get_full_name(), "start_send", start_send));
        end
        repeat(10) begin
            `uvm_create(req)
            //vodi'(req.randomize() with {req.xxx inside {[xxx:xx]};
            //                             req.yyy == yyy;});
            void'(req.randomize());
            `uvm_send(req)
        end
        tcnt_realtime::delay_us(100);
    endtask

    `uvm_object_utils_begin(`seq_CSR_in(`TC_NAME))
        `uvm_field_int(start_send,UVM_ALL_ON)
    `uvm_object_utils_end
endclass

class `seq_Mem_in(`TC_NAME) extends Mem_in_agent_default_sequence;
    int start_send=0;
    function  new(string name= `"`seq_Mem_in(`TC_NAME)`");
        super.new(name);
    endfunction

    virtual task body();
        //wait for start
        while(this.start_send==0) begin
            tcnt_realtime::delay_ns(100);
            void'(uvm_config_db#(int)::get(null, get_full_name(), "start_send", start_send));
        end
        repeat(10) begin
            `uvm_create(req)
            //vodi'(req.randomize() with {req.xxx inside {[xxx:xx]};
            //                             req.yyy == yyy;});
            void'(req.randomize());
            `uvm_send(req)
        end
        tcnt_realtime::delay_us(100);
    endtask

    `uvm_object_utils_begin(`seq_Mem_in(`TC_NAME))
        `uvm_field_int(start_send,UVM_ALL_ON)
    `uvm_object_utils_end
endclass

class `seq_Rob_output(`TC_NAME) extends Rob_output_agent_default_sequence;
    int start_send=0;
    function  new(string name= `"`seq_Rob_output(`TC_NAME)`");
        super.new(name);
    endfunction

    virtual task body();
        //wait for start
        while(this.start_send==0) begin
            tcnt_realtime::delay_ns(100);
            void'(uvm_config_db#(int)::get(null, get_full_name(), "start_send", start_send));
        end
        repeat(10) begin
            `uvm_create(req)
            //vodi'(req.randomize() with {req.xxx inside {[xxx:xx]};
            //                             req.yyy == yyy;});
            void'(req.randomize());
            `uvm_send(req)
        end
        tcnt_realtime::delay_us(100);
    endtask

    `uvm_object_utils_begin(`seq_Rob_output(`TC_NAME))
        `uvm_field_int(start_send,UVM_ALL_ON)
    `uvm_object_utils_end
endclass

class `TC_NAME extends tc_base;

    function new(string name = "`TC_NAME", uvm_component parent = null);
        super.new(name,parent);
    endfunction
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void end_of_elaboration_phase(uvm_phase phase);
    extern virtual task reset_phase(uvm_phase phase);
    extern virtual task configure_phase(uvm_phase phase);
    extern virtual task main_phase(uvm_phase phase);
    extern virtual task shutdown_phase(uvm_phase phase);
    `uvm_component_utils(`TC_NAME)
endclass

function void `TC_NAME::build_phase(uvm_phase phase);
    super.build_phase(phase);
    //default_sequence set & override 2mux1
    //>>>>
    //default_sequence override
    set_type_override_by_type(rename_in_agent_default_sequence::get_type(), `seq_rename_in(`TC_NAME)::get_type());
    //set_type_override_by_type(WriteBack_in_agent_default_sequence::get_type(), `seq_WriteBack_in(`TC_NAME)::get_type());
    //set_type_override_by_type(Redirect_in_agent_default_sequence::get_type(), `seq_Redirect_in(`TC_NAME)::get_type());
    //set_type_override_by_type(CSR_in_agent_default_sequence::get_type(), `seq_CSR_in(`TC_NAME)::get_type());
    //set_type_override_by_type(Mem_in_agent_default_sequence::get_type(), `seq_Mem_in(`TC_NAME)::get_type());
    //set_type_override_by_type(Rob_output_agent_default_sequence::get_type(), `seq_Rob_output(`TC_NAME)::get_type());

    //set default_sequence
    uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_rename_in_agent.sqr.main_phase"  , "default_sequence", `seq_rename_in(`TC_NAME)::type_id::get());
    //uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_WriteBack_in_agent.sqr.main_phase"  , "default_sequence", `seq_WriteBack_in(`TC_NAME)::type_id::get());
    //uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_Redirect_in_agent.sqr.main_phase"  , "default_sequence", `seq_Redirect_in(`TC_NAME)::type_id::get());
    //uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_CSR_in_agent.sqr.main_phase"  , "default_sequence", `seq_CSR_in(`TC_NAME)::type_id::get());
    //uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_Mem_in_agent.sqr.main_phase"  , "default_sequence", `seq_Mem_in(`TC_NAME)::type_id::get());
    //uvm_config_db#(uvm_object_wrapper)::set(this, "env.u_Rob_output_agent.sqr.main_phase"  , "default_sequence", `seq_Rob_output(`TC_NAME)::type_id::get());

endfunction

function void `TC_NAME::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
endfunction

task `TC_NAME::reset_phase(uvm_phase phase);
    super.reset_phase(phase);
    phase.raise_objection(this);
    tcnt_realtime::delay_us(100);
    phase.drop_objection(this);
endtask

task `TC_NAME::configure_phase(uvm_phase phase);
    super.configure_phase(phase);
    phase.raise_objection(this);
    tcnt_realtime::delay_us(100);
    phase.drop_objection(this);
endtask

task `TC_NAME::main_phase(uvm_phase phase);
    super.main_phase(phase);
    phase.raise_objection(this);
    tcnt_realtime::delay_us(100);
    uvm_config_db#(int)::set(this, "env.u_rename_in_agent.sqr.*"  , "start_send", 1);
    //uvm_config_db#(int)::set(this, "env.u_WriteBack_in_agent.sqr.*"  , "start_send", 1);
    //uvm_config_db#(int)::set(this, "env.u_Redirect_in_agent.sqr.*"  , "start_send", 1);
    //uvm_config_db#(int)::set(this, "env.u_CSR_in_agent.sqr.*"  , "start_send", 1);
    //uvm_config_db#(int)::set(this, "env.u_Mem_in_agent.sqr.*"  , "start_send", 1);
    //uvm_config_db#(int)::set(this, "env.u_Rob_output_agent.sqr.*"  , "start_send", 1);

    tcnt_realtime::delay_ms(1);
    phase.drop_objection(this);
endtask

task `TC_NAME::shutdown_phase(uvm_phase phase);
    super.shutdown_phase(phase);
    phase.raise_objection(this);
    tcnt_realtime::delay_us(100);
    phase.drop_objection(this);
endtask

`undef TC_NAME

`endif

