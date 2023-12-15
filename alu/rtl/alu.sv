`ifndef ALU__SV
`define ALU__SV

import alu_pkg::*;
import common_pkg::*;

module alu(
    input  data_t   data_a,
    input  data_t   data_b,
    input  alu_op_e alu_op,
    output data_t   result,
    output logic    zero
    );
    
    assign zero = result == '0;
    
    always_comb begin
        case (alu_op)
            ALU_ADD  :  result = data_a + data_b;                      //Addition
            ALU_SUB  :  result = data_a - data_b;                      //Substraction 
            ALU_SLL  :  result = data_a << data_b;                     //Shift left logical
            ALU_SLT  :  result = ($signed(data_a) < $signed(data_b));  //Set less than signed
            ALU_SLTU :  result = (data_a < data_b);                    //Set less than unsigned
            ALU_XOR  :  result = data_a ^ data_b;                      //Exclusive or
            ALU_SRL  :  result = data_a >> data_b;                     //Shift right logical
            ALU_SRA  :  result = data_a >>> data_b;                    //Shift right arithmetical
            ALU_OR   :  result = data_a | data_b;                      //Or
            ALU_AND  :  result = data_a & data_b;                      //And
            default :  result = '0; 
        endcase
    end
  endmodule : alu

`endif

//End of alu
