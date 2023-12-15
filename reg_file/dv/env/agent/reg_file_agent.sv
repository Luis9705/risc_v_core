`ifndef REG_FILE_AGENT__SV
`define REG_FILE_AGENT__SV

  class reg_file_agent extends uvm_agent;

    // Factory Registration
    `uvm_component_utils(reg_file_agent)

    // Agent config
    reg_file_agent_cfg agnt_cfg;

    // UVCs
    reg_file_driver     drvh;
    reg_file_monitor    monh;
    reg_file_sequencer  seqrh;

    // Tasks and Functions
    extern function new(string name = "reg_file_agent", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    // extern virtual task run_phase(uvm_phase);
  endclass

  function reg_file_agent::new(string name = "reg_file_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void reg_file_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_full_name(), "[REG_FILE] Starting Build Phase", UVM_LOW)

    // agnt_cfg = reg_file_agent_cfg::type_id::create("agnt_cfg");
    if(!uvm_config_db#(reg_file_agent_cfg)::get(this, "", "agnt_cfg", agnt_cfg)) begin
      `uvm_fatal(get_type_name(), "[REG_FILE] Couldn't get agnt_cfg, did you set it?")
    end

    // Build UVC
    monh = reg_file_monitor::type_id::create("monh", this);
    if(agnt_cfg.is_active == UVM_ACTIVE) begin
      drvh = reg_file_driver::type_id::create("drvh", this);
      seqrh = reg_file_sequencer::type_id::create("seqrh", this);
    end
    `uvm_info(get_full_name(), "[REG_FILE] Ending Build Phase", UVM_LOW)
  endfunction

  function void reg_file_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_full_name(), "[REG_FILE] Starting Connect Phase", UVM_LOW)
    if(agnt_cfg.is_active == UVM_ACTIVE) begin
      drvh.seq_item_port.connect(seqrh.seq_item_export);
    end
    `uvm_info(get_full_name(), "[REG_FILE] Ending Connect Phase", UVM_LOW)
  endfunction

`endif

//End of reg_file_agent
