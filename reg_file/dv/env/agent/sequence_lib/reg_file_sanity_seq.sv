`ifndef REG_FILE_SANITY_SEQ__SV
`define REG_FILE_SANITY_SEQ__SV

  class reg_file_sanity_seq extends reg_file_base_seq;

    // Factory Registration
    `uvm_object_utils(reg_file_sanity_seq)

    // Variables

    // Tasks and Functions

    extern function new(string name = "reg_file_sanity_seq");
    extern virtual task body();
  endclass

  function reg_file_sanity_seq::new(string name = "reg_file_sanity_seq");
    super.new(name);
  endfunction

  task reg_file_sanity_seq::body();
    super.body();
    `uvm_info(get_full_name(), "[REG_FILE] Starting Sanity Sequence", UVM_LOW)
    repeat(17) begin
      `uvm_do_with(req, {we==1;})
    end
    // wait_for_item_done();
  endtask

`endif

//End of reg_file_sanity_seq
