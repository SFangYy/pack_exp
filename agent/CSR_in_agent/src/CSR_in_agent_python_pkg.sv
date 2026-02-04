//------------------------------------------------------------------------------
// File       : CSR_in_agent_python_pkg.sv
// Author     : Python-UVM Integration Package
// Date       : 2026-02-03
// Description: Package wrapper for Python integration UVM components
//------------------------------------------------------------------------------

package CSR_in_agent_python_pkg;
  import utils_pkg::*;
  import uvm_pkg::*;
  import uvmc_pkg::*;
  import CSR_in_agent_pkg::*;
  
  `include "CSR_in_agent_python_xagent.sv"
endpackage