`ifndef REG_FILE_MONITOR__SV
`define REG_FILE_MONITOR__SV

  class reg_file_monitor extends uvm_monitor;

    // Factory Registration
    `uvm_component_utils(reg_file_monitor)

    // Variables
    reg_file_seq_item reg_file_seq_item_h;

    // Interface
    virtual reg_file_intf vintf;

    // Analysis Port
    uvm_analysis_port #(reg_file_seq_item) mon_port;

    // Tasks and Functions

    extern function new(string name = "reg_file_monitor", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    // extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    extern virtual task mon_task();

  endclass

  function reg_file_monitor::new(string name = "reg_file_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void reg_file_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual reg_file_intf)::get(this, "", "vintf", vintf)) begin
      `uvm_fatal(get_type_name(), "[REG_FILE] Couldn't get vintf, did you set it?")
    end
    mon_port = new("mon_port", this);
  endfunction

  task reg_file_monitor::run_phase(uvm_phase phase);
    super.run_phase(phase);
    mon_task();
  endtask

  task reg_file_monitor::mon_task();
    reg_file_seq_item_h = reg_file_seq_item::type_id::create("reg_file_seq_item_h");
    forever begin
      @(posedge vintf.clk);
      reg_file_seq_item_h.raddr_a <= vintf.raddr_a;
      reg_file_seq_item_h.raddr_b <= vintf.raddr_b;
      reg_file_seq_item_h.waddr   <= vintf.waddr;
      reg_file_seq_item_h.wdata   <= vintf.wdata;
      reg_file_seq_item_h.we      <= vintf.we;
      mon_port.write(reg_file_seq_item_h);
      `uvm_info(get_full_name(), "[REG_FILE] Written Sequence Item from Monitor", UVM_LOW)
    end
  endtask

`endif

//End of reg_file_monitor
