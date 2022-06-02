module MUX#(
    parameter WIDTH  =32  
) ( 
    input wire [WIDTH-1:0] IN1,IN2,
    input wire             sel,
    output reg [WIDTH-1:0] out         
);
always @(*) begin
    if (~sel)
            out=IN1;
    else    out=IN2;
    
end
    
endmodule