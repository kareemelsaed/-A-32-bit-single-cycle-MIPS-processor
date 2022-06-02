module Date_path (
    input wire          jump_dp,mem_write_dp,reg_write_dp,reg_dest_dp,alu_src_dp,memtoreg_dp,pcsrc_dp,
    input wire [2:0]    alu_control_dp,
    input wire          clk_dp,reset_dp,
    input wire [31:0]   instr_dp,read_data_dp,
    output wire [31:0]  pc_dp,alu_out_dp,write_data_dp,
    output wire         zeroflag_dp
);
wire [4:0]      write_reg;
wire [31:0]     result,srcAint,srcBint,pc_plus4,shift_out_int,pc_branch,signlmm_int,mux1_out;
wire [31:0]     pc_in_int;
wire [27:0]     pc_jump_before;
Register_file dp0 (
    .A1(instr_dp[25:21]),
    .A2(instr_dp[20:16]),
    .A3(write_reg),
    .WD3(result),
    .clk(clk_dp),
    .reset(reset_dp),
    .WE3(reg_write_dp),
    .RD1(srcAint),
    .RD2(write_data_dp)
);
ALU dp1 (
    .SrcA(srcAint),
    .SrcB(srcBint),
    .S(alu_control_dp),
    .ALUResult(alu_out_dp),
    .zeroflag(zeroflag_dp) 
);
Adder dp2 (                     //plus 4 for 32 bit instructions
    .A(pc_dp),
    .B(32'd4),
    .C(pc_plus4)
);
Adder dp3 (                     //adder for the branch
    .A(shift_out_int),
    .B(pc_plus4),
    .C(pc_branch)
);
pc dp4 (
    .clk(clk_dp),
    .reset(reset_dp),
    .pc_input(pc_in_int),
    .pc_output(pc_dp)
);    
sign_extend dp5 (
    .instr(instr_dp[15:0]),
    .signlmm(signlmm_int)
);
shift_left_twice #(.bit_size(32))dp6 ( //shift of branch
    .in(signlmm_int),
    .out(shift_out_int)
);
shift_left_twice #(.bit_size(28))dp7 ( //shift of pc
    .in({2'b00,instr_dp[25:0]}),
    .out(pc_jump_before)
);
MUX #(.WIDTH(32))mux1(             //1st mux before pc
    .IN1(pc_plus4),
    .IN2(pc_branch),
    .sel(pcsrc_dp),
    .out(mux1_out) 
);
MUX #(.WIDTH(32))mux2(             //2nd mux before pc
    .IN1(mux1_out),
    .IN2({pc_plus4[31:28],pc_jump_before}),
    .sel(jump_dp),
    .out(pc_in_int) 
);
MUX #(.WIDTH(32))mux3(             //3rd mux before alu
    .IN1(write_data_dp),
    .IN2(signlmm_int),
    .sel(alu_src_dp),
    .out(srcBint) 
);
MUX #(.WIDTH(5))mux4(             //4th mux between regfile and sign extend
    .IN1(instr_dp[20:16]),
    .IN2(instr_dp[15:11]),
    .sel(reg_dest_dp),
    .out(write_reg) 
);
MUX #(.WIDTH(32))mux5(             //5th mux after data memory
    .IN1(alu_out_dp),
    .IN2(read_data_dp),
    .sel(memtoreg_dp),
    .out(result) 
);
endmodule