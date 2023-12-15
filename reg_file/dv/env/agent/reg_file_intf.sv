`ifndef REG_FILE_INTF__SV
`define REG_FILE_INTF__SV

  interface reg_file_intf(input clk);

    // Signals
    reg_addr_t   raddr_a;
    data_t       rdata_a;
    reg_addr_t   raddr_b;
    data_t       rdata_b;
    reg_addr_t   waddr;
    data_t       wdata;
    logic        we;

  endinterface

`endif

//End of reg_file_intf
