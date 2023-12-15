`ifndef REG_FILE_ENV_PKG__SV
`define REG_FILE_ENV_PKG__SV

  package reg_file_env_pkg;

    // Import UVM
    import uvm_pkg::*;
    import reg_file_seq_pkg::*;
    import reg_file_regs_pkg::*;
    import reg_file_agent_pkg::*;
    `include "uvm_macros.svh"

    // Import UVM
    `include "reg_file_sb.sv"
    `include "reg_file_cov.sv"
    `include "reg_file_env.sv"
  endpackage

`endif

//End of reg_file_env_pkg
