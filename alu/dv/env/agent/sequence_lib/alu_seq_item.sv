`ifndef ALU_SEQ_ITEM__SV
`define ALU_SEQ_ITEM__SV

import alu_pkg::*;
import common_pkg::*;

  class alu_seq_item extends uvm_sequence_item;

    // Factory Registration
    `uvm_object_utils(alu_seq_item)

    // Randomization Variables
    rand data_t   a;
    rand data_t   b;
    rand alu_op_e alu_op;
    data_t        result;
    logic         zero;

    //TODO: Add constraints for data and operations
    constraint shift_c {
      if(alu_op inside {ALU_SLL, ALU_SRL, ALU_SRA}){
        b dist {[0:`DATA_WIDTH / 2] :/ 90, [`DATA_WIDTH / 2 + 1 : `DATA_WIDTH + 1] :/ 10};
      }
      }

    extern function new(string name = "alu_seq_item");

  endclass

  function alu_seq_item::new(string name = "alu_seq_item");
    super.new(name);
  endfunction

`endif

//End of alu_seq_item
