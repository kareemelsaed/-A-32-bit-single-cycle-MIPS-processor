module control_unit (
    input wire [5:0]    opcode_cu,funct_cu,
    output wire         jump_cu,mem_write_cu,reg_write_cu,reg_dest_cu,alu_src_cu,memtoreg_cu,branch_cu,
    output wire [2:0]   alu_control_cu
);
wire [1:0]              alu_op_cu;
Main_decoder u0 (
    .op_code(opcode_cu),
    .alu_op(alu_op_cu),
    .jump(jump_cu),
    .mem_write(mem_write_cu),
    .reg_write(reg_write_cu),
    .reg_dest(reg_dest_cu),
    .alu_src(alu_src_cu),
    .memtoreg(memtoreg_cu),
    .branch(branch_cu)
);
ALU_decoder u1 (
    .alu_op(alu_op_cu),
    .funct(funct_cu),
    .alu_control(alu_control_cu)
);
    
endmodule