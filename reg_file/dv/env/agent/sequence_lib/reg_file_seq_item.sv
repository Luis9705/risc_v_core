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
    extern function void do_print( uvm_printer printer );

  endclass

  function reg_file_seq_item::new(string name = "reg_file_seq_item");
    super.new(name);
  endfunction

  function void reg_file_seq_item::do_print( uvm_printer printer );
      super.do_print( printer );
      printer.print_string( "name",   get_name() );
      printer.print_field_int("raddr_a", raddr_a, $bits(raddr_a), UVM_HEX);
      printer.print_field_int("rdata_a", rdata_a, $bits(rdata_a), UVM_HEX);
      printer.print_field_int("raddr_b", raddr_b, $bits(raddr_b), UVM_HEX);
      printer.print_field_int("rdata_b", rdata_b, $bits(rdata_b), UVM_HEX);
      printer.print_field_int("waddr", waddr, $bits(waddr), UVM_HEX);
      printer.print_field_int("wdata", wdata, $bits(wdata), UVM_HEX);
      printer.print_field_int("we", we, $bits(we), UVM_HEX);
   endfunction: do_print

`endif

//End of reg_file_seq_item
