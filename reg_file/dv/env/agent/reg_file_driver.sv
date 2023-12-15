`ifndef REG_FILE_DRIVER__SV
`define REG_FILE_DRIVER__SV

  class reg_file_driver extends uvm_driver #(reg_file_seq_item);

    // Factory Registeration
    `uvm_component_utils(reg_file_driver)

    // Virtual Interface
    virtual reg_file_intf vintf;

    // Tasks and Functions
    extern function new(string name = "reg_file_driver", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    // extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task reset_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    extern virtual task drive_task(reg_file_seq_item seq_item);
  endclass

  function reg_file_driver::new(string name = "reg_file_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void reg_file_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual reg_file_intf)::get(this, "", "vintf", vintf)) begin
      `uvm_fatal(get_type_name(),"[REG_FILE] Couldn't get vintf, did you set it?")
    end
  endfunction

  task reg_file_driver::drive_task(reg_file_seq_item seq_item);
    `uvm_info(get_full_name(), "[REG_FILE] Received Sequence Item in Driver", UVM_LOW)
    @(negedge vintf.clk);
    vintf.raddr_a <= seq_item.raddr_a;
    vintf.raddr_b <= seq_item.raddr_b;
    vintf.waddr   <= seq_item.waddr;
    vintf.wdata   <= seq_item.wdata;
    vintf.we      <= seq_item.we;
  endtask

  task reg_file_driver::reset_phase(uvm_phase phase);
    super.reset_phase(phase);
    phase.raise_objection(this);
    `uvm_info(get_full_name(), "[REG_FILE] Resetting DUT from Driver", UVM_NONE)
    vintf.raddr_a <= 'd0;
    vintf.raddr_b <= 'd0;
    vintf.waddr   <= 'd0;
    vintf.wdata   <= 'd0;
    vintf.we      <= 'd0;
    @(posedge vintf.clk);
    phase.drop_objection(this);
  endtask

  task reg_file_driver::run_phase(uvm_phase phase);
    // super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive_task(req);
      seq_item_port.item_done();
    end
  endtask

`endif

//End of reg_file_driver
