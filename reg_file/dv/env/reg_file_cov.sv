`ifndef REG_FILE_COV__SV
`define REG_FILE_COV__SV

  class reg_file_cov extends uvm_subscriber#(reg_file_seq_item);

    // Factory Registration
    `uvm_component_utils(reg_file_cov)

    extern function new(string name = "reg_file_cov", uvm_component parent = null);
    extern virtual function void write(reg_file_seq_item t);
  endclass

  function reg_file_cov::new(string name = "reg_file_cov", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void reg_file_cov::write(reg_file_seq_item t);
    `uvm_info(get_full_name(), "[REG_FILE] Received item in Subscriber", UVM_LOW)
    `uvm_info(get_full_name(), $sformatf("\n[REG_FILE] Packet Data:\n\twe: %0d,\n\taddr: %0d,\n\twdata: %0d,\n\trdata: %0d",
      t.we, t.addr, t.wdata, t.rdata), UVM_LOW)
  endfunction

`endif

//End of reg_file_cov
