`ifndef ALU_AGENT__SV
`define ALU_AGENT__SV

  class alu_agent extends uvm_agent;

    // Factory Registration
    `uvm_component_utils(alu_agent)

    // Agent config
    alu_agent_cfg agnt_cfg;

    // UVCs
    alu_driver     drvh;
    alu_monitor    monh;
    alu_sequencer  seqrh;

    // Tasks and Functions
    extern function new(string name = "alu_agent", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    // extern virtual task run_phase(uvm_phase);
  endclass

  function alu_agent::new(string name = "alu_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void alu_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_full_name(), "[ALU] Starting Build Phase", UVM_LOW)

    // agnt_cfg = alu_agent_cfg::type_id::create("agnt_cfg");
    if(!uvm_config_db#(alu_agent_cfg)::get(this, "", "agnt_cfg", agnt_cfg)) begin
      `uvm_fatal(get_type_name(), "[ALU] Couldn't get agnt_cfg, did you set it?")
    end

    // Build UVC
    monh = alu_monitor::type_id::create("monh", this);
    if(agnt_cfg.is_active == UVM_ACTIVE) begin
      drvh = alu_driver::type_id::create("drvh", this);
      seqrh = alu_sequencer::type_id::create("seqrh", this);
    end
    `uvm_info(get_full_name(), "[ALU] Ending Build Phase", UVM_LOW)
  endfunction

  function void alu_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_full_name(), "[ALU] Starting Connect Phase", UVM_LOW)
    if(agnt_cfg.is_active == UVM_ACTIVE) begin
      drvh.seq_item_port.connect(seqrh.seq_item_export);
    end
    `uvm_info(get_full_name(), "[ALU] Ending Connect Phase", UVM_LOW)
  endfunction

`endif

//End of alu_agent
