`ifndef REG_FILE_BASE_TEST__SV
`define REG_FILE_BASE_TEST__SV

  class reg_file_base_test extends uvm_test;

    // Factory Registration
    `uvm_component_utils(reg_file_base_test)

    // Declare UVC
    reg_file_env envh;

    extern function new(string name = "reg_file_base_test", uvm_component parent=null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    extern virtual function void end_of_elaboration_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    extern virtual function void report_phase(uvm_phase phase);
  endclass

  function reg_file_base_test::new(string name = "reg_file_base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  function void reg_file_base_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
    envh = reg_file_env::type_id::create("envh", this);
  endfunction

  function void reg_file_base_test::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

  function void reg_file_base_test::end_of_elaboration_phase(uvm_phase phase);
    uvm_phase run_phase = phase.find_by_name("run", 0);
    run_phase.phase_done.set_drain_time(this, 40);
  endfunction

  task reg_file_base_test::run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    `uvm_info(get_full_name(), "[reg_file] Starting Base Test", UVM_NONE)
    phase.drop_objection(this);
  endtask

  function void reg_file_base_test::report_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction

`endif

//End of reg_file_base_test
