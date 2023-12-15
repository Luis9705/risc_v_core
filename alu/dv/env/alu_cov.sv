`ifndef ALU_COV__SV
`define ALU_COV__SV

  class alu_cov extends uvm_subscriber#(alu_seq_item);

    // Factory Registration
    `uvm_component_utils(alu_cov)

    extern function new(string name = "alu_cov", uvm_component parent = null);
    extern virtual function void write(alu_seq_item t);
  endclass

  function alu_cov::new(string name = "alu_cov", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void alu_cov::write(alu_seq_item t);
    `uvm_info(get_full_name(), "[ALU] Received item in Subscriber", UVM_LOW)
    `uvm_info(get_full_name(), $sformatf("\n[ALU] Packet Data:\n\ta: %0d,\n\tb: %0d,\n\talu_op: %s,\n\tresult: %0d,\n\tzero: %0d",
      t.a, t.b, t.alu_op.name, t.result, t.zero), UVM_LOW)
  endfunction

`endif

//End of alu_cov
