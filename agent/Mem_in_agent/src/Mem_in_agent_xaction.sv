//=========================================================
//File name    : Mem_in_agent_xaction.sv
//Author       : nanyunhao
//Module name  : Mem_in_agent_xaction
//Discribution : Mem_in_agent_xaction : agent transaction
//Date         : 2026-01-22
//=========================================================
`ifndef MEM_IN_AGENT_XACTION__SV
`define MEM_IN_AGENT_XACTION__SV

class Mem_in_agent_xaction  extends tcnt_data_base;
    rand bit         io_lsq_mmio_0     ;
    rand bit         io_lsq_mmio_1     ;
    rand bit         io_lsq_mmio_2     ;
    rand bit [7:0]   io_lsq_uop_0_robIdx_value;
    rand bit [7:0]   io_lsq_uop_1_robIdx_value;
    rand bit [7:0]   io_lsq_uop_2_robIdx_value;

    extern constraint default_io_lsq_mmio_0_cons;
    extern constraint default_io_lsq_mmio_1_cons;
    extern constraint default_io_lsq_mmio_2_cons;
    extern constraint default_io_lsq_uop_0_robIdx_value_cons;
    extern constraint default_io_lsq_uop_1_robIdx_value_cons;
    extern constraint default_io_lsq_uop_2_robIdx_value_cons;

    extern function new(string name="Mem_in_agent_xaction");
    extern function void pack();
    extern function void unpack();
    extern function void pre_randomize();
    extern function void post_randomize();
    extern function string psdisplay(string prefix = "");
    extern function bit compare(uvm_object rhs, uvm_comparer comparer=null);

    `uvm_object_utils_begin(Mem_in_agent_xaction)
        `uvm_field_int(io_lsq_mmio_0, UVM_ALL_ON);
        `uvm_field_int(io_lsq_mmio_1, UVM_ALL_ON);
        `uvm_field_int(io_lsq_mmio_2, UVM_ALL_ON);
        `uvm_field_int(io_lsq_uop_0_robIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_lsq_uop_1_robIdx_value, UVM_ALL_ON);
        `uvm_field_int(io_lsq_uop_2_robIdx_value, UVM_ALL_ON);

    `uvm_object_utils_end

endclass:Mem_in_agent_xaction

constraint Mem_in_agent_xaction::default_io_lsq_mmio_0_cons{

}

constraint Mem_in_agent_xaction::default_io_lsq_mmio_1_cons{

}

constraint Mem_in_agent_xaction::default_io_lsq_mmio_2_cons{

}

constraint Mem_in_agent_xaction::default_io_lsq_uop_0_robIdx_value_cons{

}

constraint Mem_in_agent_xaction::default_io_lsq_uop_1_robIdx_value_cons{

}

constraint Mem_in_agent_xaction::default_io_lsq_uop_2_robIdx_value_cons{

}

function Mem_in_agent_xaction::new(string name = "Mem_in_agent_xaction");
    super.new();
endfunction:new

function void Mem_in_agent_xaction::pack();
    super.pack();
endfunction:pack
function void Mem_in_agent_xaction::unpack();
    super.unpack();
endfunction:unpack
function void Mem_in_agent_xaction::pre_randomize();
    super.pre_randomize();
endfunction:pre_randomize
function void Mem_in_agent_xaction::post_randomize();
    super.post_randomize();
    //this.pack();
endfunction:post_randomize

function string Mem_in_agent_xaction::psdisplay(string prefix = "");
    string pkt_str;
    pkt_str = $sformatf("%s for packet[%0d] >>>>",prefix,this.pkt_index);
    pkt_str = $sformatf("%schannel_id=%0d ",pkt_str,this.channel_id);
    pkt_str = $sformatf("%sstart=%0f finish=%0f >>>>\n",pkt_str,this.start,this.finish);
    //foreach(this.pload_q[i]) begin
    //    pkt_str = $sformatf("%spload_q[%0d]=0x%2h  ",pkt_str,i,this.pload_q[i]);
    //end
    pkt_str = $sformatf("%sio_lsq_mmio_0 = 0x%0h ",pkt_str,this.io_lsq_mmio_0);
    pkt_str = $sformatf("%sio_lsq_mmio_1 = 0x%0h ",pkt_str,this.io_lsq_mmio_1);
    pkt_str = $sformatf("%sio_lsq_mmio_2 = 0x%0h ",pkt_str,this.io_lsq_mmio_2);
    pkt_str = $sformatf("%sio_lsq_uop_0_robIdx_value = 0x%0h ",pkt_str,this.io_lsq_uop_0_robIdx_value);
    pkt_str = $sformatf("%sio_lsq_uop_1_robIdx_value = 0x%0h ",pkt_str,this.io_lsq_uop_1_robIdx_value);
    pkt_str = $sformatf("%sio_lsq_uop_2_robIdx_value = 0x%0h ",pkt_str,this.io_lsq_uop_2_robIdx_value);

    return pkt_str;
endfunction:psdisplay

function bit Mem_in_agent_xaction::compare(uvm_object rhs, uvm_comparer comparer=null);
    bit super_result;
    Mem_in_agent_xaction  rhs_;
    if(!$cast(rhs_, rhs)) begin
        `uvm_fatal(get_type_name(),$sformatf("rhs is not a Mem_in_agent_xaction or its extend"))
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

        if(this.io_lsq_mmio_0!=rhs_.io_lsq_mmio_0) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_lsq_mmio_0=0x%0h while the rhs_.io_lsq_mmio_0=0x%0h",this.io_lsq_mmio_0,rhs_.io_lsq_mmio_0),UVM_NONE)
        end

        if(this.io_lsq_mmio_1!=rhs_.io_lsq_mmio_1) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_lsq_mmio_1=0x%0h while the rhs_.io_lsq_mmio_1=0x%0h",this.io_lsq_mmio_1,rhs_.io_lsq_mmio_1),UVM_NONE)
        end

        if(this.io_lsq_mmio_2!=rhs_.io_lsq_mmio_2) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_lsq_mmio_2=0x%0h while the rhs_.io_lsq_mmio_2=0x%0h",this.io_lsq_mmio_2,rhs_.io_lsq_mmio_2),UVM_NONE)
        end

        if(this.io_lsq_uop_0_robIdx_value!=rhs_.io_lsq_uop_0_robIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_lsq_uop_0_robIdx_value=0x%0h while the rhs_.io_lsq_uop_0_robIdx_value=0x%0h",this.io_lsq_uop_0_robIdx_value,rhs_.io_lsq_uop_0_robIdx_value),UVM_NONE)
        end

        if(this.io_lsq_uop_1_robIdx_value!=rhs_.io_lsq_uop_1_robIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_lsq_uop_1_robIdx_value=0x%0h while the rhs_.io_lsq_uop_1_robIdx_value=0x%0h",this.io_lsq_uop_1_robIdx_value,rhs_.io_lsq_uop_1_robIdx_value),UVM_NONE)
        end

        if(this.io_lsq_uop_2_robIdx_value!=rhs_.io_lsq_uop_2_robIdx_value) begin
            super_result = 0;
            `uvm_info(get_type_name(),$sformatf("compare fail for this.io_lsq_uop_2_robIdx_value=0x%0h while the rhs_.io_lsq_uop_2_robIdx_value=0x%0h",this.io_lsq_uop_2_robIdx_value,rhs_.io_lsq_uop_2_robIdx_value),UVM_NONE)
        end

    end
    return super_result;
endfunction:compare

`endif

