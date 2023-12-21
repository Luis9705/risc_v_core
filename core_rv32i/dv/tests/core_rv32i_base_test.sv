`ifndef CORE_RV32I_BASE_TEST__SV
`define CORE_RV32I_BASE_TEST__SV

  class core_rv32i_base_test extends uvm_test;

    // Factory Registration
    `uvm_component_utils(core_rv32i_base_test)

    // Declare UVC
    core_rv32i_env envh;

    extern function new(string name = "core_rv32i_base_test", uvm_component parent=null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    extern virtual function void report_phase(uvm_phase phase);
  endclass

  function core_rv32i_base_test::new(string name = "core_rv32i_base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void core_rv32i_base_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
    envh = core_rv32i_env::type_id::create("envh", this);
  endfunction

  function void core_rv32i_base_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

  task core_rv32i_base_test::run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    `uvm_info(get_full_name(), "[core_rv32i] Starting Base Test", UVM_NONE)
    phase.drop_objection(this);
  endtask

  function void core_rv32i_base_test::report_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction

`endif

//End of core_rv32i_base_test
