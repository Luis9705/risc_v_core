`ifndef ALU_MONITOR__SV
`define ALU_MONITOR__SV

  class alu_monitor extends uvm_monitor;

    // Factory Registration
    `uvm_component_utils(alu_monitor)

    // Variables
    alu_seq_item alu_seq_item_h;

    // Interface
    virtual alu_intf vintf;

    // Analysis Port
    uvm_analysis_port #(alu_seq_item) mon_port;

    // Tasks and Functions

    extern function new(string name = "alu_monitor", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    // extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    extern virtual task mon_task();

  endclass

  function alu_monitor::new(string name = "alu_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void alu_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual alu_intf)::get(this, "", "vintf", vintf)) begin
      `uvm_fatal(get_type_name(), "[ALU] Couldn't get vintf, did you set it?")
    end
    mon_port = new("mon_port", this);
  endfunction

  task alu_monitor::run_phase(uvm_phase phase);
    super.run_phase(phase);
    mon_task();
  endtask

  task alu_monitor::mon_task();
    alu_seq_item_h = alu_seq_item::type_id::create("alu_seq_item_h");
    forever begin
      @(posedge vintf.clk);
      alu_seq_item_h.a     = vintf.a;
      alu_seq_item_h.b   = vintf.b;
      alu_seq_item_h.alu_op  = vintf.alu_op;
      alu_seq_item_h.result  = vintf.result;
      alu_seq_item_h.zero  = vintf.zero;
      mon_port.write(alu_seq_item_h);
      `uvm_info(get_full_name(), "[ALU] Written Sequence Item from Monitor", UVM_LOW)
    end
  endtask

`endif

//End of alu_monitor
