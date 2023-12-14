`ifndef ALU_INTF__SV
`define ALU_INTF__SV

  interface alu_intf(input clk);

    // Signals
    logic we;
    logic [3:0] addr;
    logic [7:0] wdata;
    logic [7:0] rdata;

  endinterface

`endif

//End of alu_intf
