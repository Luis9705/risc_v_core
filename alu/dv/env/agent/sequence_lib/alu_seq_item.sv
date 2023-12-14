`ifndef ALU_SEQ_ITEM__SV
`define ALU_SEQ_ITEM__SV

  class alu_seq_item extends uvm_sequence_item;

    // Factory Registration
    `uvm_object_utils(alu_seq_item)

    // Randomization Variables
    rand logic we;
    randc logic [3:0] addr;
    rand logic [7:0] wdata;
    logic [7:0] rdata;

    constraint dataRange {wdata inside{[0:15]};}

    extern function new(string name = "alu_seq_item");

  endclass

  function alu_seq_item::new(string name = "alu_seq_item");
    super.new(name);
  endfunction

`endif

//End of alu_seq_item
