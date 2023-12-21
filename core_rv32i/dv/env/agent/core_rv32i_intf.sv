`ifndef CORE_RV32I_INTF__SV
`define CORE_RV32I_INTF__SV

  interface core_rv32i_intf(input clk);

    // Signals
    logic we;
    logic [3:0] addr;
    logic [7:0] wdata;
    logic [7:0] rdata;

  endinterface

`endif

//End of core_rv32i_intf
