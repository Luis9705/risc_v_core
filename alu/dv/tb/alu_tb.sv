`ifndef ALU_TB__SV
`define ALU_TB__SV

  // Generated by tbengy. Created by Prasad Pandit.

  `timescale 1ns/1ps
  `include "uvm_macros.svh"

  module alu_tb;
    import alu_test_pkg::*;
    import uvm_pkg::*;
    import alu_pkg::*;
    import common_pkg::*;

    data_t   a;
    data_t   b;
    alu_op_e alu_op;
    data_t   result;
    logic    zero;
    logic    clk;

    alu_intf intf(.clk(clk));

    alu DUT (
      .a_i(a),
      .b_i(b),
      .alu_op_i(alu_op),
      .result_o(result),
      .zero_o(zero)
    );

    initial begin
      clk = 0;
      forever begin
        #10 clk = ~clk;
      end
    end

    initial begin
      uvm_config_db #(virtual alu_intf)::set(null, "*", "vintf", intf);
      run_test();
    end
  endmodule

`endif

//End of alu_tb
