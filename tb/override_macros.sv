//=========================================================
//File name    : override_macros.sv
//Description  : Override UVM_REPORT_SERVER macro to fix compilation
//=========================================================
// Redefine UVM_REPORT_SERVER to use uvm_report_server instead of uvm_default_report_server
// This fixes the compilation error with UVM 1.2
`undef UVM_REPORT_SERVER
`define UVM_REPORT_SERVER uvm_report_server