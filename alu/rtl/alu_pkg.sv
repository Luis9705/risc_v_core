`ifndef ALU_PKG__SV
`define ALU_PKG__SV

package alu_pkg;

    typedef enum logic [3:0] {
        ALU_ADD, 
        ALU_SUB, 
        ALU_SLL,
        ALU_SLT,
        ALU_SLTU,
        ALU_XOR,
        ALU_SRL,
        ALU_SRA,
        ALU_OR ,
        ALU_AND,
        ALU_NOP
    } alu_op_e;
    
endpackage

`endif

//End of alu_pkg