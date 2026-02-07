package rob_python_agent_pkg;
    import uvm_pkg::*;
    import uvmc_pkg::*;
    import utils_pkg::*;
    import Mem_in_agent_pkg::*;
    import rename_in_agent_pkg::*;
    import WriteBack_in_agent_pkg::*;

    // Include the generated classes (monitors, drivers, agents)
    `include "src/rob_xagent_generated.sv"

    // Include custom implementations for each transaction
    `include "src/Mem_in_agent_python_driver.sv"
    `include "src/Mem_in_agent_python_monitor.sv"
    `include "src/rename_in_agent_python_driver.sv"
    `include "src/rename_in_agent_python_monitor.sv"
    `include "src/WriteBack_in_agent_python_driver.sv"
    `include "src/WriteBack_in_agent_python_monitor.sv"

endpackage : rob_python_agent_pkg
