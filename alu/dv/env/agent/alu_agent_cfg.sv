`ifndef ALU_AGENT_CFG__SV
`define ALU_AGENT_CFG__SV

  class alu_agent_cfg extends uvm_object;

    // Factory Registration
    `uvm_object_utils(alu_agent_cfg)

    // UVM Agent Controls

    uvm_active_passive_enum is_active = UVM_ACTIVE;

    // Tasks and Functions

    extern function new(string name = "alu_agent_cfg");

  endclass

  function alu_agent_cfg::new(string name = "alu_agent_cfg");
    super.new(name);
  endfunction

`endif

//End of alu_agent_cfg
