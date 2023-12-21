`ifndef CORE_RV32I_SEQUENCER__SV
`define CORE_RV32I_SEQUENCER__SV

  class core_rv32i_sequencer extends uvm_sequencer#(core_rv32i_seq_item);

    // Factory Registration
    `uvm_component_utils(core_rv32i_sequencer)

    // Tasks and Functions
    extern function new(string name = "core_rv32i_sequencer", uvm_component parent = null);
  endclass

  function core_rv32i_sequencer::new(string name = "core_rv32i_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction

`endif

//End of core_rv32i_sequencer
