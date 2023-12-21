`ifndef CORE_RV32I_DRIVER__SV
`define CORE_RV32I_DRIVER__SV

  class core_rv32i_driver extends uvm_driver #(core_rv32i_seq_item);

    // Factory Registeration
    `uvm_component_utils(core_rv32i_driver)

    // Virtual Interface
    virtual core_rv32i_intf vintf;

    // Tasks and Functions
    extern function new(string name = "core_rv32i_driver", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    // extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task reset_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    extern virtual task drive_task(core_rv32i_seq_item seq_item);
  endclass

  function core_rv32i_driver::new(string name = "core_rv32i_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void core_rv32i_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual core_rv32i_intf)::get(this, "", "vintf", vintf)) begin
      `uvm_fatal(get_type_name(),"[CORE_RV32I] Couldn't get vintf, did you set it?")
    end
  endfunction

  task core_rv32i_driver::drive_task(core_rv32i_seq_item seq_item);
    `uvm_info(get_full_name(), "[CORE_RV32I] Received Sequence Item in Driver", UVM_LOW)
    @(negedge vintf.clk);
    vintf.we <= seq_item.we;
    vintf.addr <= seq_item.addr;
    vintf.wdata <= seq_item.wdata;
  endtask

  task core_rv32i_driver::reset_phase(uvm_phase phase);
    super.reset_phase(phase);
    phase.raise_objection(this);
    `uvm_info(get_full_name(), "[CORE_RV32I] Resetting DUT from Driver", UVM_NONE)
    vintf.we     <= 'd0;
    vintf.addr   <= 'd0;
    vintf.wdata  <= 'd0;
    @(posedge vintf.clk);
    phase.drop_objection(this);
  endtask

  task core_rv32i_driver::run_phase(uvm_phase phase);
    // super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive_task(req);
      seq_item_port.item_done();
    end
  endtask

`endif

//End of core_rv32i_driver
