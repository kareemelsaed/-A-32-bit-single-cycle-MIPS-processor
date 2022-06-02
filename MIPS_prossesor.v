module MIPS_prossesor (
    input wire             clk_mips,reset_mips,
    input wire  [31:0]     instr_mips,read_data_mips,
    output wire [31:0]     pc,alu_out,write_data,
    output wire            mem_write
);
wire        jump,reg_write,reg_dest,alu_src,memtoreg,alu_control,zero,branch;
wire [2:0]  alu_control_mips;
Date_path m0 (
    .jump_dp(jump),
    .mem_write_dp(mem_write),
    .reg_write_dp(reg_write),
    .reg_dest_dp(reg_dest),
    .alu_src_dp(alu_src),
    .memtoreg_dp(memtoreg),
    .pcsrc_dp(zero&branch),
    .alu_control_dp(alu_control_mips),
    .clk_dp(clk_mips),
    .reset_dp(reset_mips),
    .instr_dp(instr_mips),
    .read_data_dp(read_data_mips),
    .pc_dp(pc),
    .alu_out_dp(alu_out),
    .write_data_dp(write_data),
    .zeroflag_dp(zero)
);
control_unit m1 (
    .opcode_cu(instr_mips[31:26]),
    .funct_cu(instr_mips[5:0]),
    .jump_cu(jump),
    .mem_write_cu(mem_write),
    .reg_write_cu(reg_write),
    .reg_dest_cu(reg_dest),
    .alu_src_cu(alu_src),
    .memtoreg_cu(memtoreg),
    .branch_cu(branch),
    .alu_control_cu(alu_control_mips)
);

endmodule