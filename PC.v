module pc(
    input clk,
    input reset,
    input [31:0]pc_input,
    output reg [31:0] pc_output
    );

always@(posedge clk)
    begin
        if(~reset)
            begin
                pc_output <= 32'b0;
            end
        else
            begin
                pc_output <= pc_input;
            end             
    end
endmodule