`ifndef ALU_ENV_PKG__SV
`define ALU_ENV_PKG__SV

  package alu_env_pkg;

    // Import UVM
    import uvm_pkg::*;
    import alu_seq_pkg::*;
    import alu_regs_pkg::*;
    import alu_agent_pkg::*;
    `include "uvm_macros.svh"

    // Import UVM
    `include "alu_sb.sv"
    `include "alu_cov.sv"
    `include "alu_env.sv"
  endpackage

`endif

//End of alu_env_pkg
