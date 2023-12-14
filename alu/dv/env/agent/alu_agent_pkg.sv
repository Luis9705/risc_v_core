`ifndef ALU_AGENT_PKG__SV
`define ALU_AGENT_PKG__SV

  package alu_agent_pkg;

    // Import UVM
    import uvm_pkg::*;
    import alu_regs_pkg::*;
    import alu_seq_pkg::*;
    `include "uvm_macros.svh"

    // Include Agent UVCs
    // `include "alu_intf.sv"
    `include "alu_agent_cfg.sv"
    `include "alu_driver.sv"
    `include "alu_monitor.sv"
    `include "alu_sequencer.sv"
    `include "alu_agent.sv"
  endpackage

`endif

//End of alu_agent_pkg
