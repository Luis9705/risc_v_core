`ifndef ALU_SB__SV
`define ALU_SB__SV

import alu_pkg::*;
import common_pkg::*;

  class alu_sb extends uvm_scoreboard;

    // Factory Registration
    `uvm_component_utils(alu_sb)

    // Analysis Fifo
    uvm_tlm_analysis_fifo #(alu_seq_item) sb_fifo;

    // Data Item
    alu_seq_item seq_item;

    // Tasks and Functions
    extern function new(string name = "alu_sb", uvm_component parent = null);
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    extern virtual task calculate_exp_txn(input alu_seq_item t, output alu_seq_item exp_txn);
  endclass

  function alu_sb::new(string name = "alu_sb", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void alu_sb::build_phase(uvm_phase phase);
    super.build_phase(phase);
    sb_fifo = new("sb_fifo", this);
  endfunction


  task alu_sb::calculate_exp_txn(input alu_seq_item t, output alu_seq_item exp_txn);

    int expected_result;
    bit expected_zero;

    exp_txn = alu_seq_item::type_id::create("exp_txn");

    case (t.alu_op)
        ALU_ADD  :  expected_result = t.a + t.b;                       //Addition
        ALU_SUB  :  expected_result = t.a - t.b;                       //Substraction 
        ALU_SLL  :  expected_result = t.a << t.b;                      //Shift left logical
        ALU_SLT  :  expected_result = t.a < t.b;                       //Set less than signed
        ALU_SLTU :  expected_result = $unsigned(t.a) < $unsigned(t.b); //Set less than unsigned
        ALU_XOR  :  expected_result = t.a ^ t.b;                       //Exclusive or
        ALU_SRL  :  expected_result = t.a >> t.b;                      //Shift right logical
        ALU_SRA  :  expected_result = t.a >>> t.b;                     //Shift right arithmetical
        ALU_OR   :  expected_result = t.a | t.b;                       //Or
        ALU_AND  :  expected_result = t.a & t.b;                       //And
        default :  expected_result = '0;                               //No Op
    endcase

    expected_zero = expected_result == '0;

    exp_txn.a = t.a;
    exp_txn.b = t.b;
    exp_txn.alu_op = t.alu_op;
    exp_txn.result = expected_result;
    exp_txn.zero = expected_zero;

  endtask

  task alu_sb::run_phase(uvm_phase phase);

    alu_seq_item exp_txn;

    forever begin
      sb_fifo.get(seq_item);
      `uvm_info(get_full_name(), "[ALU] Received new item in SB", UVM_LOW)
      `uvm_info(get_full_name(), $sformatf("\n[ALU] Packet Data:\n\ta: %0d,\n\tb: %0d,\n\talu_op: %s,\n\tresult: %0d,\n\tzero: %0d",
      seq_item.a, seq_item.b, seq_item.alu_op.name, seq_item.result, seq_item.zero), UVM_LOW)

      calculate_exp_txn(seq_item, exp_txn);

      `uvm_info(get_full_name(), $sformatf("\n[ALU] Expected Data:\n\ta: %0d,\n\tb: %0d,\n\talu_op: %s,\n\tresult: %0d,\n\tzero: %0d",
      exp_txn.a, exp_txn.b, exp_txn.alu_op.name, exp_txn.result, exp_txn.zero), UVM_LOW)

      if(!exp_txn.compare(seq_item)) begin
          `uvm_error(get_full_name(), "[ALU] Expected result doesn't match with actual result");
        end

    end
  endtask

`endif

//End of alu_sb
