`ifndef ALU__SV
`define ALU__SV

`include "alu_pkg.sv"
`include "common_pkg.sv"
import alu_pkg::*;
import common_pkg::*;

module alu(
    input  data_t   a_i,
    input  data_t   b_i,
    input  alu_op_e alu_op_i,
    output data_t   result_o,
    output logic    zero_o
    );
    
    assign zero_o = result_o == '0;
    
    always_comb begin
        case (alu_op_i)
            ALU_ADD  :  result_o = a_i + b_i;                      //Addition
            ALU_SUB  :  result_o = a_i - b_i;                      //Substraction 
            ALU_SLL  :  result_o = a_i << b_i;                     //Shift left logical
            ALU_SLT  :  result_o = ($signed(a_i) < $signed(b_i));  //Set less than signed
            ALU_SLTU :  result_o = (a_i < b_i);                    //Set less than unsigned
            ALU_XOR  :  result_o = a_i ^ b_i;                      //Exclusive or
            ALU_SRL  :  result_o = a_i >> b_i;                     //Shift right logical
            ALU_SRA  :  result_o = $signed(a_i) >>> b_i;           //Shift right arithmetical
            ALU_OR   :  result_o = a_i | b_i;                      //Or
            ALU_AND  :  result_o = a_i & b_i;                      //And
            default :  result_o = '0;                              //No Op
        endcase
    end
  endmodule : alu

`endif

//End of alu
