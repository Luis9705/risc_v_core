`ifndef REG_FILE_ENV__SV
`define REG_FILE_ENV__SV

  class reg_file_env extends uvm_env;

    // Factory Registration
    `uvm_component_utils(reg_file_env)

    // Environment Variables
    bit is_scoreboard_enable = 1;
    bit is_coverage_enable = 1;

    // Declare UVC
    reg_file_agent_cfg agnt_cfg;
    reg_file_agent agnth;
    reg_file_sb sbh;
    reg_file_cov covh;

    reg_file_model  reg_model;
    reg2porta_adapter porta_adapter;
    reg2portb_adapter portb_adapter;

    extern function new (string name = "reg_file_env", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
  endclass

  function reg_file_env::new(string name = "reg_file_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void reg_file_env::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_full_name(), "[REG_FILE] Starting Build Phase", UVM_LOW)
    agnt_cfg = reg_file_agent_cfg::type_id::create("agnt_cfg");
    uvm_config_db #(reg_file_agent_cfg)::set(this, "*", "agnt_cfg", agnt_cfg);
    agnth = reg_file_agent::type_id::create("agnth", this);
    if(is_scoreboard_enable) begin
      sbh = reg_file_sb::type_id::create("sbh", this);
    end
    if(is_coverage_enable) begin
      covh = reg_file_cov::type_id::create("covh", this);
    end

    reg_model = reg_file_model::type_id::create("reg_model", this);
    reg_model.build();
    porta_adapter = reg2porta_adapter::type_id::create("porta_adapter", this);
    portb_adapter = reg2portb_adapter::type_id::create("portb_adapter", this);

    `uvm_info(get_full_name(), "[REG_FILE] Ending Build Phase", UVM_LOW)
  endfunction

  function void reg_file_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_full_name(), "[REG_FILE] Starting Connect Phase", UVM_LOW)
    if(is_scoreboard_enable) begin
      agnth.monh.mon_port.connect(sbh.sb_fifo.analysis_export);
    end
    if(is_coverage_enable) begin
      agnth.monh.mon_port.connect(covh.analysis_export);
    end

    reg_model.default_map.set_sequencer( .sequencer(agnth.seqrh), .adapter(porta_adapter) );

    `uvm_info(get_full_name(), "[REG_FILE] Ending Connect Phase", UVM_LOW)
  endfunction

`endif

//End of reg_file_env
