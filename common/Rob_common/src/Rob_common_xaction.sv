//=========================================================
//File name    : Rob_common_xaction.sv
//Author       : nanyunhao
//Module name  : Rob_common_xaction
//Discribution : Rob_common_xaction : common transaction
//Date         : 2026-01-22
//=========================================================
`ifndef ROB_COMMON_XACTION__SV
`define ROB_COMMON_XACTION__SV

class Rob_common_xaction  extends tcnt_data_base;
    rename_in_agent_xaction rename_in_tr;
    WriteBack_in_agent_xaction WriteBack_in_tr;
    Redirect_in_agent_xaction Redirect_in_tr;
    CSR_in_agent_xaction CSR_in_tr;
    Mem_in_agent_xaction Mem_in_tr;
    Rob_output_agent_xaction Rob_output_tr;

    extern function new(string name="Rob_common_xaction");
    extern function void pack();
    extern function void unpack();
    extern function void pre_randomize();
    extern function void post_randomize();
    extern function void pack_rename_in(uvm_object tr);
    extern function void pack_WriteBack_in(uvm_object tr);
    extern function void pack_Redirect_in(uvm_object tr);
    extern function void pack_CSR_in(uvm_object tr);
    extern function void pack_Mem_in(uvm_object tr);
    extern function void pack_Rob_output(uvm_object tr);

    extern function string psdisplay(string prefix = "");
    extern function bit compare(uvm_object rhs, uvm_comparer comparer=null);

    `uvm_object_utils_begin(Rob_common_xaction)
        `uvm_field_object(rename_in_tr, UVM_ALL_ON);
        `uvm_field_object(WriteBack_in_tr, UVM_ALL_ON);
        `uvm_field_object(Redirect_in_tr, UVM_ALL_ON);
        `uvm_field_object(CSR_in_tr, UVM_ALL_ON);
        `uvm_field_object(Mem_in_tr, UVM_ALL_ON);
        `uvm_field_object(Rob_output_tr, UVM_ALL_ON);

    `uvm_object_utils_end

endclass:Rob_common_xaction

function Rob_common_xaction::new(string name = "Rob_common_xaction");
    super.new();
endfunction:new

function void Rob_common_xaction::pack();
    super.pack();
endfunction:pack
function void Rob_common_xaction::unpack();
    super.unpack();
endfunction:unpack
function void Rob_common_xaction::pre_randomize();
    super.pre_randomize();
endfunction:pre_randomize
function void Rob_common_xaction::post_randomize();
    super.post_randomize();
    //this.pack();
endfunction:post_randomize

function void Rob_common_xaction::pack_rename_in(uvm_object tr);
    rename_in_agent_xaction tr_;
    if(!$cast(tr_, tr)) begin
        `uvm_fatal(get_type_name(),$sformatf("tr is not a rename_in_agent_xaction or its extend"));
    end
    this.rename_in_tr = tr_;
endfunction:pack_rename_in

function void Rob_common_xaction::pack_WriteBack_in(uvm_object tr);
    WriteBack_in_agent_xaction tr_;
    if(!$cast(tr_, tr)) begin
        `uvm_fatal(get_type_name(),$sformatf("tr is not a WriteBack_in_agent_xaction or its extend"));
    end
    this.WriteBack_in_tr = tr_;
endfunction:pack_WriteBack_in

function void Rob_common_xaction::pack_Redirect_in(uvm_object tr);
    Redirect_in_agent_xaction tr_;
    if(!$cast(tr_, tr)) begin
        `uvm_fatal(get_type_name(),$sformatf("tr is not a Redirect_in_agent_xaction or its extend"));
    end
    this.Redirect_in_tr = tr_;
endfunction:pack_Redirect_in

function void Rob_common_xaction::pack_CSR_in(uvm_object tr);
    CSR_in_agent_xaction tr_;
    if(!$cast(tr_, tr)) begin
        `uvm_fatal(get_type_name(),$sformatf("tr is not a CSR_in_agent_xaction or its extend"));
    end
    this.CSR_in_tr = tr_;
endfunction:pack_CSR_in

function void Rob_common_xaction::pack_Mem_in(uvm_object tr);
    Mem_in_agent_xaction tr_;
    if(!$cast(tr_, tr)) begin
        `uvm_fatal(get_type_name(),$sformatf("tr is not a Mem_in_agent_xaction or its extend"));
    end
    this.Mem_in_tr = tr_;
endfunction:pack_Mem_in

function void Rob_common_xaction::pack_Rob_output(uvm_object tr);
    Rob_output_agent_xaction tr_;
    if(!$cast(tr_, tr)) begin
        `uvm_fatal(get_type_name(),$sformatf("tr is not a Rob_output_agent_xaction or its extend"));
    end
    this.Rob_output_tr = tr_;
endfunction:pack_Rob_output

function string Rob_common_xaction::psdisplay(string prefix = "");
    string pkt_str;
    pkt_str = $sformatf("%s for packet[%0d] >>>>",prefix,this.pkt_index);
    pkt_str = $sformatf("%schannel_id=%0d ",pkt_str,this.channel_id);
    pkt_str = $sformatf("%sstart=%0f finish=%0f >>>>\n",pkt_str,this.start,this.finish);
    //foreach(this.pload_q[i]) begin
    //    pkt_str = $sformatf("%spload_q[%0d]=0x%2h  ",pkt_str,i,this.pload_q[i]);
    //end
    if(channel_id == 0)begin
        pkt_str = $sformatf("%s%s",pkt_str,this.rename_in_tr.psdisplay(prefix));
    end
    if(channel_id == 1)begin
        pkt_str = $sformatf("%s%s",pkt_str,this.WriteBack_in_tr.psdisplay(prefix));
    end
    if(channel_id == 2)begin
        pkt_str = $sformatf("%s%s",pkt_str,this.Redirect_in_tr.psdisplay(prefix));
    end
    if(channel_id == 3)begin
        pkt_str = $sformatf("%s%s",pkt_str,this.CSR_in_tr.psdisplay(prefix));
    end
    if(channel_id == 4)begin
        pkt_str = $sformatf("%s%s",pkt_str,this.Mem_in_tr.psdisplay(prefix));
    end
    if(channel_id == 5)begin
        pkt_str = $sformatf("%s%s",pkt_str,this.Rob_output_tr.psdisplay(prefix));
    end

    return pkt_str;
endfunction:psdisplay

function bit Rob_common_xaction::compare(uvm_object rhs, uvm_comparer comparer=null);
    bit super_result;
    Rob_common_xaction  rhs_;
    if(!$cast(rhs_, rhs)) begin
        `uvm_fatal(get_type_name(),$sformatf("rhs is not a Rob_common_xaction or its extend"))
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
        if(channel_id == 0)begin
            super_result = this.rename_in_tr.compare(rhs_.rename_in_tr);
        end
        if(channel_id == 1)begin
            super_result = this.WriteBack_in_tr.compare(rhs_.WriteBack_in_tr);
        end
        if(channel_id == 2)begin
            super_result = this.Redirect_in_tr.compare(rhs_.Redirect_in_tr);
        end
        if(channel_id == 3)begin
            super_result = this.CSR_in_tr.compare(rhs_.CSR_in_tr);
        end
        if(channel_id == 4)begin
            super_result = this.Mem_in_tr.compare(rhs_.Mem_in_tr);
        end
        if(channel_id == 5)begin
            super_result = this.Rob_output_tr.compare(rhs_.Rob_output_tr);
        end

    end
    return super_result;
endfunction:compare

`endif

