//=========================================================
//File name    : tcnt_report_server_base_override.sv
//Description  : Override tcnt_report_server_base to fix compilation
//              This file provides a simplified version that works with UVM 1.2
//=========================================================
`ifndef TCNT_REPORT_SERVER_BASE__SV
`define TCNT_REPORT_SERVER_BASE__SV

// Simplified version that doesn't use uvm_default_report_server
// Use uvm_report_server instead which is always available
class tcnt_report_server_base extends uvm_report_server;

    function new();
        super.new();
        set_name("tcnt_report_server_base");
        $timeformat(-9,3,"ns",10);
    endfunction:new

    // Add basic implementation if needed
    virtual function string compose_message(
        uvm_severity severity,
        string name,
        string id,
        string message,
        string filename,
        int line);
        return super.compose_message(severity, name, id, message, filename, line);
    endfunction

endclass
`endif