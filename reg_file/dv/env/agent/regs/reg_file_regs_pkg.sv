`ifndef REG_FILE_REGS_PKG__SV
`define REG_FILE_REGS_PKG__SV

  package reg_file_regs_pkg;

    // Import UVM
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // Include Reg Model UVCs

  class x_reg extends uvm_reg;
    `uvm_object_utils(x_reg)

    rand uvm_reg_field reg_field;

    function new(string name = "x_reg");
      super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
      reg_field = uvm_reg_field::type_id::create("reg_field"); 

      reg_field.configure(this,   //Parent
                          32,     //Size
                          0,      //LSB pos
                          "RW",   //Access: "RW", "RO", "WO"
                          0,      //Volatile: if bit is updated by hardware
                          32'b0,  //Reset value
                          0,      //has_reset. NOTE: RISC-V ISA doesn't define a default reset value, except for x0. Assuming reset value is undefined.
                          1,      //is_rand
                          1);     //individually accessible
    endfunction

  endclass

  class reg_field_block extends uvm_reg_block;
      `uvm_object_utils(reg_field_block)

      rand x_reg x0;
      rand x_reg x1;
      rand x_reg x2;
      rand x_reg x3;

      uvm_reg_map reg_map; // Block map

      function new(string name = "reg_field_block");
         super.new(name, UVM_NO_COVERAGE);
      endfunction

      virtual function void build();
        x0 = x_reg::type_id::create("x0");
        x0.configure(this, null, "");
        x0.build();

        x1 = x_reg::type_id::create("x1");
        x1.configure(this, null, "");
        x1.build();

        x2 = x_reg::type_id::create("x2");
        x2.configure(this, null, "");
        x2.build();

        x3 = x_reg::type_id::create("x3");
        x3.configure(this, null, "");
        x3.build();

        reg_map.add_reg(x0, 32'd0, "RW");
        reg_map.add_reg(x1, 32'd1, "RW");
        reg_map.add_reg(x2, 32'd2, "RW");
        reg_map.add_reg(x3, 32'd3, "RW");

        lock_model();

      endfunction

  endclass

  endpackage

`endif

//End of reg_file_regs_pkg
