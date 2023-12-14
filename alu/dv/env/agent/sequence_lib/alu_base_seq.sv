`ifndef ALU_BASE_SEQ__SV
`define ALU_BASE_SEQ__SV

  class alu_base_seq extends uvm_sequence#(alu_seq_item);

    // Factory Registration
    `uvm_object_utils(alu_base_seq)

    // Variables

    // Tasks and Functions
    extern function new(string name = "alu_base_seq");
    extern virtual task body();

  endclass

  function alu_base_seq::new(string name = "alu_base_seq");
    super.new(name);
  endfunction

  task alu_base_seq::body();

  endtask

`endif

//End of alu_base_seq
