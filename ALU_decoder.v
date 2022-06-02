module ALU_decoder (
    input wire [1:0] alu_op,
    input wire [5:0] funct,
    output reg [2:0] alu_control
);
always @(*) begin
    casex ({alu_op,funct})
        8'b00_xxxxxx: alu_control=3'b010;
        8'b01_xxxxxx: alu_control=3'b100;
        8'b10_100000: alu_control=3'b010;
        8'b10_100010: alu_control=3'b100;
        8'b10_101010: alu_control=3'b110;
        8'b10_011100: alu_control=3'b101;
            /*case (funct)
                6'b100000: alu_control=3'b010;
                6'b100010: alu_control=3'b100;
                6'b101010: alu_control=3'b110;
                6'b011100: alu_control=3'b101;
                default: alu_control=3'b010;
            endcase*/
        default: alu_control=3'b010; 
    endcase
    
end
    
endmodule