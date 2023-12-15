`ifndef ALU_SEQ_ITEM__SV
`define ALU_SEQ_ITEM__SV

import alu_pkg::*;
import common_pkg::*;

  class alu_seq_item extends uvm_sequence_item;

    // Factory Registration
    `uvm_object_utils(alu_seq_item)

    // Randomization Variables
    rand int      a;
    rand int      b;
    rand alu_op_e alu_op;
    int           result;
    logic         zero;
    localparam int Range = 10000;

    constraint operand_a_c {

      //Constraint to have numbers between a certain range, but also excercise middle values and corner values
      a dist {[`MIN_VALUE : `MIN_VALUE + Range]    :/ 10,
              [`MIN_VALUE + Range + 1 : -Range]    :/ 25,
              [-Range + 1 : Range]                 :/ 30, 
              [Range + 1 : `MAX_VALUE - Range]     :/ 25, 
              [`MAX_VALUE - Range + 1: `MAX_VALUE] :/ 10};

    }

    constraint operand_b_c {

      //If opcode is shift operation, constraint operand b to be inside the data width. 
      //If we provide large values, result will always be 0 as shitf overflows.
      if(alu_op inside {ALU_SLL, ALU_SRL, ALU_SRA}){
        b dist {[0:`DATA_WIDTH / 2] :/ 90, [`DATA_WIDTH / 2 + 1 : `DATA_WIDTH + 1] :/ 10};
      } else {
        b dist {[`MIN_VALUE : `MIN_VALUE + Range]    :/ 10,
                [`MIN_VALUE + Range + 1 : -Range]    :/ 25,
                [-Range + 1 : Range]                 :/ 30, 
                [Range + 1 : `MAX_VALUE - Range]     :/ 25, 
                [`MAX_VALUE - Range + 1: `MAX_VALUE] :/ 10};
      }
    }

    extern function new(string name = "alu_seq_item");

  endclass

  function alu_seq_item::new(string name = "alu_seq_item");
    super.new(name);
  endfunction

`endif

//End of alu_seq_item
