`ifndef CORE_RV32I_SANITY_TEST__SV
`define CORE_RV32I_SANITY_TEST__SV

  class core_rv32i_sanity_test extends core_rv32i_base_test;

    // Factory Registration
    `uvm_component_utils(core_rv32i_sanity_test)

    // Sequence to start
    core_rv32i_sanity_seq seqh;

    extern function new(string name = "core_rv32i_sanity_test", uvm_component parent=null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    extern virtual function void report_phase(uvm_phase phase);
  endclass

  function core_rv32i_sanity_test::new(string name = "core_rv32i_sanity_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void core_rv32i_sanity_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  function void core_rv32i_sanity_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

  task core_rv32i_sanity_test::run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    `uvm_info(get_full_name(), "[core_rv32i] Starting sanity Test", UVM_NONE)
    seqh = core_rv32i_sanity_seq::type_id::create("seqh");
    seqh.start(envh.agnth.seqrh);
    phase.drop_objection(this);
  endtask

  function void core_rv32i_sanity_test::report_phase(uvm_phase phase);
    super.report_phase(phase);
  endfunction

`endif

//End of core_rv32i_sanity_test
