module Adder (
    input wire [31:0] A,B,
    output reg [31:0] C
);
always @(*) begin
    C=A+B;
    
end
    
endmodule