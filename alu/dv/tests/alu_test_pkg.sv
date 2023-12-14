`ifndef ALU_TEST_PKG__SV
`define ALU_TEST_PKG__SV

  package alu_test_pkg;

    // Import UVM
    import uvm_pkg::*;
    import alu_seq_pkg::*;
    import alu_regs_pkg::*;
    import alu_agent_pkg::*;
    import alu_env_pkg::*;
    `include "uvm_macros.svh"

    // Import UVC
    `include "alu_base_test.sv"
    `include "alu_sanity_test.sv"

  endpackage

`endif

//End of alu_test_pkg
