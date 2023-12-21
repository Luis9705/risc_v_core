`ifndef CORE_RV32I_ENV__SV
`define CORE_RV32I_ENV__SV

  class core_rv32i_env extends uvm_env;

    // Factory Registration
    `uvm_component_utils(core_rv32i_env)

    // Environment Variables
    bit is_scoreboard_enable = 1;
    bit is_coverage_enable = 1;

    // Declare UVC
    core_rv32i_agent_cfg agnt_cfg;
    core_rv32i_agent agnth;
    core_rv32i_sb sbh;
    core_rv32i_cov covh;

    extern function new (string name = "core_rv32i_env", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
  endclass

  function core_rv32i_env::new(string name = "core_rv32i_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void core_rv32i_env::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_full_name(), "[CORE_RV32I] Starting Build Phase", UVM_LOW)
    agnt_cfg = core_rv32i_agent_cfg::type_id::create("agnt_cfg");
    uvm_config_db #(core_rv32i_agent_cfg)::set(this, "*", "agnt_cfg", agnt_cfg);
    agnth = core_rv32i_agent::type_id::create("agnth", this);
    if(is_scoreboard_enable) begin
      sbh = core_rv32i_sb::type_id::create("sbh", this);
    end
    if(is_coverage_enable) begin
      covh = core_rv32i_cov::type_id::create("covh", this);
    end
    `uvm_info(get_full_name(), "[CORE_RV32I] Ending Build Phase", UVM_LOW)
  endfunction

  function void core_rv32i_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_full_name(), "[CORE_RV32I] Starting Connect Phase", UVM_LOW)
    if(is_scoreboard_enable) begin
      agnth.monh.mon_port.connect(sbh.sb_fifo.analysis_export);
    end
    if(is_coverage_enable) begin
      agnth.monh.mon_port.connect(covh.analysis_export);
    end
    `uvm_info(get_full_name(), "[CORE_RV32I] Ending Connect Phase", UVM_LOW)
  endfunction

`endif

//End of core_rv32i_env
