module MIPS (
    input wire          clk,reset,
    output wire [15:0]  test_value
);
wire [31:0]             instr,read_data,pc_top,alu_out_top,write_data_top;
wire                    mem_write_top;
MIPS_prossesor u0 (
    .clk_mips(clk),
    .reset_mips(reset),
    .instr_mips(instr),
    .read_data_mips(read_data),
    .pc(pc_top),
    .alu_out(alu_out_top),
    .write_data(write_data_top),
    .mem_write(mem_write_top)
);
instr_mem u1 (
    .pc(pc_top),
    .instr(instr)
);
data_memory u2 (
    .clk_mem(clk),
    .wr(mem_write_top),
    .reset_mem(reset), 
    .A(alu_out_top),
    .WD(write_data_top),
    .RD(read_data),
    .T_V(test_value)
);

    
endmodule