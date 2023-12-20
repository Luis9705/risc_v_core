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

    req = reg_file_seq_item::type_id::create("req"); 
    
    repeat(10) begin
      start_item(req);
      if(!req.randomize()) begin
        `uvm_error(get_full_name(), "[REG_FILE] Could not randomize request.")
      end
      finish_item(req);
    end

  endtask

`endif

//End of reg_file_sanity_seq
