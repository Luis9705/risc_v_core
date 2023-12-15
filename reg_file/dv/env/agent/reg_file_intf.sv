`ifndef REG_FILE_INTF__SV
`define REG_FILE_INTF__SV

  interface reg_file_intf(input clk);

    // Signals
    logic we;
    logic [3:0] addr;
    logic [7:0] wdata;
    logic [7:0] rdata;

  endinterface

`endif

//End of reg_file_intf
