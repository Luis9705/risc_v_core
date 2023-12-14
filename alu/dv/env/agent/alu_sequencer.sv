`ifndef ALU_SEQUENCER__SV
`define ALU_SEQUENCER__SV

  class alu_sequencer extends uvm_sequencer#(alu_seq_item);

    // Factory Registration
    `uvm_component_utils(alu_sequencer)

    // Tasks and Functions
    extern function new(string name = "alu_sequencer", uvm_component parent = null);
  endclass

  function alu_sequencer::new(string name = "alu_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction

`endif

//End of alu_sequencer
