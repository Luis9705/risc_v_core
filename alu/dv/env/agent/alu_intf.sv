`ifndef ALU_INTF__SV
`define ALU_INTF__SV

import alu_pkg::*;
import common_pkg::*;

  interface alu_intf(input clk);

    // Signals
    data_t   a;
    data_t   b;
    alu_op_e alu_op;
    data_t   result;
    logic    zero;

  endinterface

`endif

//End of alu_intf
