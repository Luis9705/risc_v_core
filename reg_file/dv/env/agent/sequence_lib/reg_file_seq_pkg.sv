`ifndef REG_FILE_SEQ_PKG__SV
`define REG_FILE_SEQ_PKG__SV

  package reg_file_seq_pkg;

    // Import UVM Macros and Package
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // Include all sequence items and sequences
    `include "reg_file_seq_item.sv"
    `include "reg_file_base_seq.sv"
    `include "reg_file_sanity_seq.sv"

  endpackage

`endif

//End of reg_file_seq_pkg
