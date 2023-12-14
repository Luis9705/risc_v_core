`ifndef ALU_SANITY_TEST__SV
`define ALU_SANITY_TEST__SV

  class alu_sanity_test extends alu_base_test;

    // Factory Registration
    `uvm_component_utils(alu_sanity_test)

    // Sequence to start
    alu_sanity_seq seqh;

    extern function new(string name = "alu_sanity_test", uvm_component parent=null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    extern virtual function void report_phase(uvm_phase phase);
  endclass

  function alu_sanity_test::new(string name = "alu_sanity_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void alu_sanity_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  function void alu_sanity_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

  task alu_sanity_test::run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    `uvm_info(get_full_name(), "[alu] Starting sanity Test", UVM_NONE)
    seqh = alu_sanity_seq::type_id::create("seqh");
    seqh.start(envh.agnth.seqrh);
    phase.drop_objection(this);
  endtask

  function void alu_sanity_test::report_phase(uvm_phase phase);
    super.report_phase(phase);
  endfunction

`endif

//End of alu_sanity_test
