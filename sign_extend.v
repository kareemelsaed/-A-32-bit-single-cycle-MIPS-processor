module sign_extend (
    input wire [15:0] instr,
    output reg [31:0] signlmm
);
    always @(*) begin
        signlmm[15:0]=instr[15:0];
        signlmm[31:16]={16{instr[15]}};
        
    end
endmodule