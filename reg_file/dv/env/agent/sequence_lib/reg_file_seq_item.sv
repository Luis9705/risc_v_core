`ifndef REG_FILE_SEQ_ITEM__SV
`define REG_FILE_SEQ_ITEM__SV

`include "common_pkg.sv"
import common_pkg::*;

  class reg_file_seq_item extends uvm_sequence_item;

    // Factory Registration
    `uvm_object_utils(reg_file_seq_item)

    // Randomization Variables
    rand reg_addr_t   raddr_a;
    rand reg_addr_t   raddr_b;
    rand reg_addr_t   waddr;
    rand data_t       wdata;
    rand logic        we;
    data_t            rdata_a;
    data_t            rdata_b;

    //TODO: Add constraints for reg_file
    // constraint dataRange {wdata inside{[0:15]};}

    extern function new(string name = "reg_file_seq_item");

  endclass

  function reg_file_seq_item::new(string name = "reg_file_seq_item");
    super.new(name);
  endfunction

`endif

//End of reg_file_seq_item
