`ifndef CORE_RV32I_SANITY_SEQ__SV
`define CORE_RV32I_SANITY_SEQ__SV

  class core_rv32i_sanity_seq extends core_rv32i_base_seq;

    // Factory Registration
    `uvm_object_utils(core_rv32i_sanity_seq)

    // Variables

    // Tasks and Functions

    extern function new(string name = "core_rv32i_sanity_seq");
    extern virtual task body();
  endclass

  function core_rv32i_sanity_seq::new(string name = "core_rv32i_sanity_seq");
    super.new(name);
  endfunction

  task core_rv32i_sanity_seq::body();
    super.body();
    `uvm_info(get_full_name(), "[CORE_RV32I] Starting Sanity Sequence", UVM_LOW)
    repeat(17) begin
      `uvm_do_with(req, {we==1;})
    end
    // wait_for_item_done();
  endtask

`endif

//End of core_rv32i_sanity_seq
