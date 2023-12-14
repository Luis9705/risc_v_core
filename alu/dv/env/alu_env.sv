`ifndef ALU_ENV__SV
`define ALU_ENV__SV

  class alu_env extends uvm_env;

    // Factory Registration
    `uvm_component_utils(alu_env)

    // Environment Variables
    bit is_scoreboard_enable = 1;
    bit is_coverage_enable = 1;

    // Declare UVC
    alu_agent_cfg agnt_cfg;
    alu_agent agnth;
    alu_sb sbh;
    alu_cov covh;

    extern function new (string name = "alu_env", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
  endclass

  function alu_env::new(string name = "alu_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void alu_env::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_full_name(), "[ALU] Starting Build Phase", UVM_LOW)
    agnt_cfg = alu_agent_cfg::type_id::create("agnt_cfg");
    uvm_config_db #(alu_agent_cfg)::set(this, "*", "agnt_cfg", agnt_cfg);
    agnth = alu_agent::type_id::create("agnth", this);
    if(is_scoreboard_enable) begin
      sbh = alu_sb::type_id::create("sbh", this);
    end
    if(is_coverage_enable) begin
      covh = alu_cov::type_id::create("covh", this);
    end
    `uvm_info(get_full_name(), "[ALU] Ending Build Phase", UVM_LOW)
  endfunction

  function void alu_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_full_name(), "[ALU] Starting Connect Phase", UVM_LOW)
    if(is_scoreboard_enable) begin
      agnth.monh.mon_port.connect(sbh.sb_fifo.analysis_export);
    end
    if(is_coverage_enable) begin
      agnth.monh.mon_port.connect(covh.analysis_export);
    end
    `uvm_info(get_full_name(), "[ALU] Ending Connect Phase", UVM_LOW)
  endfunction

`endif

//End of alu_env
