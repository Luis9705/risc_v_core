`ifndef REG_FILE__SV
`define REG_FILE__SV

`include "common_pkg.sv"
import common_pkg::*;

module reg_file (
    input  logic        clk_i,

    input  reg_addr_t   raddr_a_i,
    output data_t       rdata_a_o,

    input  reg_addr_t   raddr_b_i,
    output data_t       rdata_b_o,

    input  reg_addr_t   waddr_i,
    input  data_t       wdata_i,
    input  logic        we_i
    );

    data_t mem [0: `NUM_REGS-1];
    //reg_file_t mem;
    
    //async read
    assign rdata_a_o = (raddr_a_i == '0) ? '0 : mem[raddr_a_i];
    assign rdata_b_o = (raddr_b_i == '0) ? '0 : mem[raddr_b_i];

    //sync write
    always_ff @( posedge clk_i ) begin : sync_write 
       if (we_i == 1'b1) begin
           mem[waddr_i] <= (waddr_i == '0) ? '0 : wdata_i;
       end 
    end : sync_write

    //Initializing memory to 0
    initial begin
        for (int i = 0; i< `NUM_REGS ; i = i + 1) begin
            mem[i] <= 0;
        end
    end

endmodule

`endif

//End of reg_file
