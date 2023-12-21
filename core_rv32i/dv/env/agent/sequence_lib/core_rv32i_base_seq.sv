`ifndef CORE_RV32I_BASE_SEQ__SV
`define CORE_RV32I_BASE_SEQ__SV

  class core_rv32i_base_seq extends uvm_sequence#(core_rv32i_seq_item);

    // Factory Registration
    `uvm_object_utils(core_rv32i_base_seq)

    // Variables

    // Tasks and Functions
    extern function new(string name = "core_rv32i_base_seq");
    extern virtual task body();

  endclass

  function core_rv32i_base_seq::new(string name = "core_rv32i_base_seq");
    super.new(name);
  endfunction

  task core_rv32i_base_seq::body();

  endtask

`endif

//End of core_rv32i_base_seq
