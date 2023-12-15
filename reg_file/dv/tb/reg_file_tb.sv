`ifndef REG_FILE_TB__SV
`define REG_FILE_TB__SV

  // Generated by tbengy. Created by Prasad Pandit.

  `timescale 1ns/1ps
  `include "uvm_macros.svh"

  module reg_file_tb;
    import reg_file_test_pkg::*;
    import uvm_pkg::*;

    logic clk;

    reg_file_intf intf(.clk(clk));

    reg_file DUT (
      .clk(clk),
      .we(intf.we),
      .addr(intf.addr),
      .wdata(intf.wdata),
      .rdata(intf.rdata)
    );

    initial begin
      clk = 0;
      forever begin
        #10 clk = ~clk;
      end
    end

    initial begin
      uvm_config_db #(virtual reg_file_intf)::set(null, "*", "vintf", intf);
      run_test();
    end
  endmodule

`endif

//End of reg_file_tb
