`ifndef CORE_RV32I_AGENT__SV
`define CORE_RV32I_AGENT__SV

  class core_rv32i_agent extends uvm_agent;

    // Factory Registration
    `uvm_component_utils(core_rv32i_agent)

    // Agent config
    core_rv32i_agent_cfg agnt_cfg;

    // UVCs
    core_rv32i_driver     drvh;
    core_rv32i_monitor    monh;
    core_rv32i_sequencer  seqrh;

    // Tasks and Functions
    extern function new(string name = "core_rv32i_agent", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    // extern virtual task run_phase(uvm_phase);
  endclass

  function core_rv32i_agent::new(string name = "core_rv32i_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void core_rv32i_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_full_name(), "[CORE_RV32I] Starting Build Phase", UVM_LOW)

    // agnt_cfg = core_rv32i_agent_cfg::type_id::create("agnt_cfg");
    if(!uvm_config_db#(core_rv32i_agent_cfg)::get(this, "", "agnt_cfg", agnt_cfg)) begin
      `uvm_fatal(get_type_name(), "[CORE_RV32I] Couldn't get agnt_cfg, did you set it?")
    end

    // Build UVC
    monh = core_rv32i_monitor::type_id::create("monh", this);
    if(agnt_cfg.is_active == UVM_ACTIVE) begin
      drvh = core_rv32i_driver::type_id::create("drvh", this);
      seqrh = core_rv32i_sequencer::type_id::create("seqrh", this);
    end
    `uvm_info(get_full_name(), "[CORE_RV32I] Ending Build Phase", UVM_LOW)
  endfunction

  function void core_rv32i_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_full_name(), "[CORE_RV32I] Starting Connect Phase", UVM_LOW)
    if(agnt_cfg.is_active == UVM_ACTIVE) begin
      drvh.seq_item_port.connect(seqrh.seq_item_export);
    end
    `uvm_info(get_full_name(), "[CORE_RV32I] Ending Connect Phase", UVM_LOW)
  endfunction

`endif

//End of core_rv32i_agent
