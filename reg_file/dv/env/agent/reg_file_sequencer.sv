`ifndef REG_FILE_SEQUENCER__SV
`define REG_FILE_SEQUENCER__SV

  class reg_file_sequencer extends uvm_sequencer#(reg_file_seq_item);

    // Factory Registration
    `uvm_component_utils(reg_file_sequencer)

    // Tasks and Functions
    extern function new(string name = "reg_file_sequencer", uvm_component parent = null);
  endclass

  function reg_file_sequencer::new(string name = "reg_file_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction

`endif

//End of reg_file_sequencer
