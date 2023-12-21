`ifndef CORE_RV32I_SB__SV
`define CORE_RV32I_SB__SV

  class core_rv32i_sb extends uvm_scoreboard;

    // Factory Registration
    `uvm_component_utils(core_rv32i_sb)

    // Analysis Fifo
    uvm_tlm_analysis_fifo #(core_rv32i_seq_item) sb_fifo;

    // Data Item
    core_rv32i_seq_item seq_item;

    // Tasks and Functions
    extern function new(string name = "core_rv32i_sb", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
  endclass

  function core_rv32i_sb::new(string name = "core_rv32i_sb", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void core_rv32i_sb::build_phase(uvm_phase phase);
    super.build_phase(phase);
    sb_fifo = new("sb_fifo", this);
  endfunction

  task core_rv32i_sb::run_phase(uvm_phase phase);
    forever begin
      sb_fifo.get(seq_item);
      `uvm_info(get_full_name(), "[CORE_RV32I] Received new item in SB", UVM_LOW)
      `uvm_info(get_full_name(), $sformatf("\n[CORE_RV32I] Packet Data:\n\twe: %0d,\n\taddr: %0d,\n\twdata: %0d,\n\trdata: %0d",
      seq_item.we, seq_item.addr, seq_item.wdata, seq_item.rdata), UVM_LOW)
    end
  endtask

`endif

//End of core_rv32i_sb
