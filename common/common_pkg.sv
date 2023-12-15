`ifndef COMMON_PKG_SV
`define COMMON_PKG_SV

package common_pkg;

    `define DATA_WIDTH 32
    `define NUM_REGS 32
    `define MAX_VALUE  2**(`DATA_WIDTH-1) - 1
    `define MIN_VALUE  -(2**(`DATA_WIDTH-1))

    typedef logic [`DATA_WIDTH-1:0]         data_t;
    typedef logic [$clog2(`NUM_REGS)-1:0]   reg_addr_t;
    
endpackage

`endif

//End of common_pkg