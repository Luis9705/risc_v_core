`ifndef REG_FILE_REG_ACCESS_TEST__SV
`define REG_FILE_REG_ACCESS_TEST__SV

  class reg_file_reg_access_test extends reg_file_base_test;

    // Factory Registration
    `uvm_component_utils(reg_file_reg_access_test)

    // Sequence to start
    reg_file_reg_access_seq seqh;

    extern function new(string name = "reg_file_reg_access_test", uvm_component parent=null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    extern virtual function void report_phase(uvm_phase phase);
  endclass

  function reg_file_reg_access_test::new(string name = "reg_file_reg_access_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void reg_file_reg_access_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  function void reg_file_reg_access_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

  task reg_file_reg_access_test::run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    `uvm_info(get_full_name(), "[reg_file] Starting reg access Test", UVM_NONE)
    seqh = reg_file_reg_access_seq::type_id::create("seqh");
    seqh.reg_model = envh.reg_model;
    seqh.start(envh.agnth.seqrh);
    phase.drop_objection(this);
  endtask

  function void reg_file_reg_access_test::report_phase(uvm_phase phase);
    super.report_phase(phase);
  endfunction

`endif

//End of reg_file_reg_access_test
