`ifndef CORE_RV32I__SV
`define CORE_RV32I__SV

  module core_rv32i
  (
    input  logic clk,
    input  logic we,
    input  logic [3:0] addr,
    input  logic [7:0] wdata,
    output logic [7:0] rdata
  );

  logic [7:0] mem [16];
  logic [3:0] addr_reg;

  always_ff @(posedge clk) begin
    if(we) begin
      mem[addr] <= wdata;
    end
    addr_reg <= addr;
  end

  assign rdata = mem[addr_reg];

  endmodule : core_rv32i

`endif

//End of core_rv32i
