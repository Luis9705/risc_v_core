`ifndef CORE_RV32I_MONITOR__SV
`define CORE_RV32I_MONITOR__SV

  class core_rv32i_monitor extends uvm_monitor;

    // Factory Registration
    `uvm_component_utils(core_rv32i_monitor)

    // Variables
    core_rv32i_seq_item core_rv32i_seq_item_h;

    // Interface
    virtual core_rv32i_intf vintf;

    // Analysis Port
    uvm_analysis_port #(core_rv32i_seq_item) mon_port;

    // Tasks and Functions

    extern function new(string name = "core_rv32i_monitor", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    // extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    extern virtual task mon_task();

  endclass

  function core_rv32i_monitor::new(string name = "core_rv32i_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void core_rv32i_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual core_rv32i_intf)::get(this, "", "vintf", vintf)) begin
      `uvm_fatal(get_type_name(), "[CORE_RV32I] Couldn't get vintf, did you set it?")
    end
    mon_port = new("mon_port", this);
  endfunction

  task core_rv32i_monitor::run_phase(uvm_phase phase);
    super.run_phase(phase);
    mon_task();
  endtask

  task core_rv32i_monitor::mon_task();
    core_rv32i_seq_item_h = core_rv32i_seq_item::type_id::create("core_rv32i_seq_item_h");
    forever begin
      @(posedge vintf.clk);
      core_rv32i_seq_item_h.we     = vintf.we;
      core_rv32i_seq_item_h.addr   = vintf.addr;
      core_rv32i_seq_item_h.wdata  = vintf.wdata;
      core_rv32i_seq_item_h.rdata  = vintf.rdata;
      mon_port.write(core_rv32i_seq_item_h);
      `uvm_info(get_full_name(), "[CORE_RV32I] Written Sequence Item from Monitor", UVM_LOW)
    end
  endtask

`endif

//End of core_rv32i_monitor
