`ifndef CORE_RV32I_TEST_PKG__SV
`define CORE_RV32I_TEST_PKG__SV

  package core_rv32i_test_pkg;

    // Import UVM
    import uvm_pkg::*;
    import core_rv32i_seq_pkg::*;
    import core_rv32i_regs_pkg::*;
    import core_rv32i_agent_pkg::*;
    import core_rv32i_env_pkg::*;
    `include "uvm_macros.svh"

    // Import UVC
    `include "core_rv32i_base_test.sv"
    `include "core_rv32i_sanity_test.sv"

  endpackage

`endif

//End of core_rv32i_test_pkg
