module ALU (
    input wire [31:0] SrcA,
    input wire [31:0] SrcB,
    input wire [2:0]   S,
    output reg [31:0] ALUResult,
    output reg        zeroflag    
);

always @(*) begin
    if (ALUResult==0)
            zeroflag<=1;
    else    zeroflag<=0; 
end
always @(*) begin
    case (S)
3'b000 : ALUResult= SrcA & SrcB;
3'b001 : ALUResult= SrcA | SrcB;
3'b010 : ALUResult= SrcA + SrcB;
3'b100 : ALUResult= SrcA - SrcB;
3'b101 : ALUResult= SrcA * SrcB;
3'b110 : begin
        if (SrcA<SrcB)
            ALUResult=32'b1;
        else ALUResult=32'b0;
    end
default: ALUResult=32'b0;    
    endcase    
end
endmodule
