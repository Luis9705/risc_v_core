`ifndef REG_FILE_SB__SV
`define REG_FILE_SB__SV

  class reg_file_sb extends uvm_scoreboard;

    // Factory Registration
    `uvm_component_utils(reg_file_sb)

    // Analysis Fifo
    uvm_tlm_analysis_fifo #(reg_file_seq_item) sb_fifo;

    // Data Item
    reg_file_seq_item seq_item;

    // Tasks and Functions
    extern function new(string name = "reg_file_sb", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
  endclass

  function reg_file_sb::new(string name = "reg_file_sb", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void reg_file_sb::build_phase(uvm_phase phase);
    super.build_phase(phase);
    sb_fifo = new("sb_fifo", this);
  endfunction

  task reg_file_sb::run_phase(uvm_phase phase);
    forever begin
      sb_fifo.get(seq_item);
      `uvm_info(get_full_name(), "[REG_FILE] Received new item in SB", UVM_LOW)
      `uvm_info(get_full_name(), $sformatf("\n[REG_FILE] Packet Data:\n\twe: %0d,\n\taddr: %0d,\n\twdata: %0d,\n\trdata: %0d",
      seq_item.we, seq_item.addr, seq_item.wdata, seq_item.rdata), UVM_LOW)
    end
  endtask

`endif

//End of reg_file_sb
