`ifndef CORE_RV32I_SEQ_PKG__SV
`define CORE_RV32I_SEQ_PKG__SV

  package core_rv32i_seq_pkg;

    // Import UVM Macros and Package
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // Include all sequence items and sequences
    `include "core_rv32i_seq_item.sv"
    `include "core_rv32i_base_seq.sv"
    `include "core_rv32i_sanity_seq.sv"

  endpackage

`endif

//End of core_rv32i_seq_pkg
