`ifndef REG_FILE_REG_ACCESS_SEQ__SV
`define REG_FILE_REG_ACCESS_SEQ__SV

  class reg_file_reg_access_seq extends reg_file_base_seq;

    // Factory Registration
    `uvm_object_utils(reg_file_reg_access_seq)

    // Variables
    reg_file_model reg_model;

    // Tasks and Functions

    extern function new(string name = "reg_file_reg_access_seq");
    extern virtual task body();
  endclass

  function reg_file_reg_access_seq::new(string name = "reg_file_reg_access_seq");
    super.new(name);
  endfunction

  task reg_file_reg_access_seq::body();
    uvm_status_e   status;
    bit [31:0]     rdata;

    super.body();
    `uvm_info(get_full_name(), "[REG_FILE] Starting reg access Sequence", UVM_LOW)
    
    reg_model.x0.write(status, 32'h1234_1234);
    reg_model.x1.write(status, 32'hDEAD_BEEF);
    reg_model.x2.write(status, 32'hC001C0DE);
    reg_model.x3.write(status, 32'hBAADC0DE);

    reg_model.x0.read(status, rdata);
    reg_model.x1.read(status, rdata);
    reg_model.x2.read(status, rdata);
    reg_model.x3.read(status, rdata);

  endtask

`endif

//End of reg_file_reg_access_seq
