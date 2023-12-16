`ifndef REG2PORTB_ADAPTER__SV
`define REG2PORTB_ADAPTER__SV

class reg2portb_adapter extends uvm_reg_adapter;

    `uvm_object_utils(reg2portb_adapter)

    function new(string name = "reg2portb_adapter");
        super.new(name);
        supports_byte_enable = 0;
        provides_responses = 0;
    endfunction

    virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
        reg_file_seq_item reg_file_txn = reg_file_seq_item::type_id::create("reg_file_txn");

        if(rw.kind == UVM_READ) begin
            reg_file_txn.raddr_a = 'b0;
            reg_file_txn.raddr_b = rw.addr;
            reg_file_txn.waddr   = 'b0;
            reg_file_txn.wdata   = rw.data;
            reg_file_txn.we      = 1'b0;
        end else begin
            reg_file_txn.raddr_a = 'b0;
            reg_file_txn.raddr_b = 'b0;
            reg_file_txn.waddr   = rw.addr;
            reg_file_txn.wdata   = rw.data;
            reg_file_txn.we      = 1'b1;
        end

        return reg_file_txn;

    endfunction: reg2bus

    virtual function void bus2reg(uvm_sequence_item bus_item,
                                ref uvm_reg_bus_op rw);
        reg_file_seq_item reg_file_txn;
        if (!$cast(reg_file_txn, bus_item)) begin
            `uvm_fatal("NOT_REG_FILE_TXN_TYPE","Provided bus_item is not of the correct type")
            return;
        end
        rw.kind = reg_file_txn.we ? UVM_WRITE : UVM_READ;
        if(rw.kind == UVM_READ) begin
            rw.addr = reg_file_txn.raddr_b;
            rw.data = reg_file_txn.rdata_b;
        end else begin
            rw.addr = reg_file_txn.waddr;
            rw.data = reg_file_txn.wdata;
        end

        rw.status = UVM_IS_OK;
    endfunction: bus2reg

endclass: reg2portb_adapter

`endif

//End of reg2portb_adapter