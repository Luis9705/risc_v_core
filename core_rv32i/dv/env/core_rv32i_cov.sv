`ifndef CORE_RV32I_COV__SV
`define CORE_RV32I_COV__SV

  class core_rv32i_cov extends uvm_subscriber#(core_rv32i_seq_item);

    // Factory Registration
    `uvm_component_utils(core_rv32i_cov)

    extern function new(string name = "core_rv32i_cov", uvm_component parent = null);
    extern virtual function void write(core_rv32i_seq_item t);
  endclass

  function core_rv32i_cov::new(string name = "core_rv32i_cov", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void core_rv32i_cov::write(core_rv32i_seq_item t);
    `uvm_info(get_full_name(), "[CORE_RV32I] Received item in Subscriber", UVM_LOW)
    `uvm_info(get_full_name(), $sformatf("\n[CORE_RV32I] Packet Data:\n\twe: %0d,\n\taddr: %0d,\n\twdata: %0d,\n\trdata: %0d",
      t.we, t.addr, t.wdata, t.rdata), UVM_LOW)
  endfunction

`endif

//End of core_rv32i_cov
