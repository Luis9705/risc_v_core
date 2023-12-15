`ifndef REG_FILE_AGENT_CFG__SV
`define REG_FILE_AGENT_CFG__SV

  class reg_file_agent_cfg extends uvm_object;

    // Factory Registration
    `uvm_object_utils(reg_file_agent_cfg)

    // UVM Agent Controls

    uvm_active_passive_enum is_active = UVM_ACTIVE;

    // Tasks and Functions

    extern function new(string name = "reg_file_agent_cfg");

  endclass

  function reg_file_agent_cfg::new(string name = "reg_file_agent_cfg");
    super.new(name);
  endfunction

`endif

//End of reg_file_agent_cfg
