`ifndef CORE_RV32I_AGENT_PKG__SV
`define CORE_RV32I_AGENT_PKG__SV

  package core_rv32i_agent_pkg;

    // Import UVM
    import uvm_pkg::*;
    import core_rv32i_regs_pkg::*;
    import core_rv32i_seq_pkg::*;
    `include "uvm_macros.svh"

    // Include Agent UVCs
    // `include "core_rv32i_intf.sv"
    `include "core_rv32i_agent_cfg.sv"
    `include "core_rv32i_driver.sv"
    `include "core_rv32i_monitor.sv"
    `include "core_rv32i_sequencer.sv"
    `include "core_rv32i_agent.sv"
  endpackage

`endif

//End of core_rv32i_agent_pkg
