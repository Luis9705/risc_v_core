`ifndef ALU_SANITY_SEQ__SV
`define ALU_SANITY_SEQ__SV

  class alu_sanity_seq extends alu_base_seq;

    // Factory Registration
    `uvm_object_utils(alu_sanity_seq)

    // Variables

    // Tasks and Functions

    extern function new(string name = "alu_sanity_seq");
    extern virtual task body();
  endclass

  function alu_sanity_seq::new(string name = "alu_sanity_seq");
    super.new(name);
  endfunction

  task alu_sanity_seq::body();
    super.body();
    `uvm_info(get_full_name(), "[ALU] Starting Sanity Sequence", UVM_LOW)
    repeat(1000) begin
      // `uvm_do_with(req, {we==1;})
      `uvm_do(req)
    end
    // wait_for_item_done();
  endtask

`endif

//End of alu_sanity_seq
