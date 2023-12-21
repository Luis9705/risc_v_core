`ifndef CORE_RV32I_ENV_PKG__SV
`define CORE_RV32I_ENV_PKG__SV

  package core_rv32i_env_pkg;

    // Import UVM
    import uvm_pkg::*;
    import core_rv32i_seq_pkg::*;
    import core_rv32i_regs_pkg::*;
    import core_rv32i_agent_pkg::*;
    `include "uvm_macros.svh"

    // Import UVM
    `include "core_rv32i_sb.sv"
    `include "core_rv32i_cov.sv"
    `include "core_rv32i_env.sv"
  endpackage

`endif

//End of core_rv32i_env_pkg
