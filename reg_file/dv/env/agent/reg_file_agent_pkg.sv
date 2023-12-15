`ifndef REG_FILE_AGENT_PKG__SV
`define REG_FILE_AGENT_PKG__SV

  package reg_file_agent_pkg;

    // Import UVM
    import uvm_pkg::*;
    import reg_file_regs_pkg::*;
    import reg_file_seq_pkg::*;
    `include "uvm_macros.svh"

    // Include Agent UVCs
    // `include "reg_file_intf.sv"
    `include "reg_file_agent_cfg.sv"
    `include "reg_file_driver.sv"
    `include "reg_file_monitor.sv"
    `include "reg_file_sequencer.sv"
    `include "reg_file_agent.sv"
  endpackage

`endif

//End of reg_file_agent_pkg
