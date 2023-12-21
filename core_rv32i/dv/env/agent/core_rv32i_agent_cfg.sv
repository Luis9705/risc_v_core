`ifndef CORE_RV32I_AGENT_CFG__SV
`define CORE_RV32I_AGENT_CFG__SV

  class core_rv32i_agent_cfg extends uvm_object;

    // Factory Registration
    `uvm_object_utils(core_rv32i_agent_cfg)

    // UVM Agent Controls

    uvm_active_passive_enum is_active = UVM_ACTIVE;

    // Tasks and Functions

    extern function new(string name = "core_rv32i_agent_cfg");

  endclass

  function core_rv32i_agent_cfg::new(string name = "core_rv32i_agent_cfg");
    super.new(name);
  endfunction

`endif

//End of core_rv32i_agent_cfg
