module shift_left_twice #(
    parameter bit_size = 32
) (
    input wire [bit_size-1:0]   in,
    output reg [bit_size-1:0]   out
);
always @(*) begin
    out=in<<2;
    
end
    
endmodule