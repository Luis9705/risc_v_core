`ifndef REG_FILE_TEST_PKG__SV
`define REG_FILE_TEST_PKG__SV

  package reg_file_test_pkg;

    // Import UVM
    import uvm_pkg::*;
    import reg_file_seq_pkg::*;
    import reg_file_regs_pkg::*;
    import reg_file_agent_pkg::*;
    import reg_file_env_pkg::*;
    `include "uvm_macros.svh"

    // Import UVC
    `include "reg_file_base_test.sv"
    `include "reg_file_sanity_test.sv"

  endpackage

`endif

//End of reg_file_test_pkg
