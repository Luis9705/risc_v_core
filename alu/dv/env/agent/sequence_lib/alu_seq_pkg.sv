`ifndef ALU_SEQ_PKG__SV
`define ALU_SEQ_PKG__SV

  package alu_seq_pkg;

    // Import UVM Macros and Package
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // Include all sequence items and sequences
    `include "alu_seq_item.sv"
    `include "alu_base_seq.sv"
    `include "alu_sanity_seq.sv"

  endpackage

`endif

//End of alu_seq_pkg
