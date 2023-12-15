`ifndef REG_FILE_BASE_SEQ__SV
`define REG_FILE_BASE_SEQ__SV

  class reg_file_base_seq extends uvm_sequence#(reg_file_seq_item);

    // Factory Registration
    `uvm_object_utils(reg_file_base_seq)

    // Variables

    // Tasks and Functions
    extern function new(string name = "reg_file_base_seq");
    extern virtual task body();

  endclass

  function reg_file_base_seq::new(string name = "reg_file_base_seq");
    super.new(name);
  endfunction

  task reg_file_base_seq::body();

  endtask

`endif

//End of reg_file_base_seq
