module Main_decoder (
    input wire [5:0] op_code,
    output reg [1:0] alu_op,
    output reg jump,mem_write,reg_write,reg_dest,alu_src,memtoreg,branch
);
always @(*) begin
           jump=1'b0;
           alu_op=2'b00;
           mem_write=1'b0;
           reg_write=1'b0;
           reg_dest=1'b0;
           alu_src=1'b0;
           memtoreg=1'b0;
           branch=1'b0;
    case (op_code)
        6'b100011:begin
           jump=1'b0;
           alu_op=2'b00;
           mem_write=1'b0;
           reg_write=1'b1;
           reg_dest=1'b0;
           alu_src=1'b1;
           memtoreg=1'b1;
           branch=1'b0;
        end 
        6'b101011:begin
           jump=1'b0;
           alu_op=2'b00;
           mem_write=1'b1;
           reg_write=1'b0;
           reg_dest=1'b0;
           alu_src=1'b1;
           memtoreg=1'b1;
           branch=1'b0;
        end 
         6'b000000:begin
           jump=1'b0;
           alu_op=2'b10;
           mem_write=1'b0;
           reg_write=1'b1;
           reg_dest=1'b1;
           alu_src=1'b0;
           memtoreg=1'b0;
           branch=1'b0;
        end 
         6'b001000:begin
           jump=1'b0;
           alu_op=2'b00;
           mem_write=1'b0;
           reg_write=1'b1;
           reg_dest=1'b0;
           alu_src=1'b1;
           memtoreg=1'b0;
           branch=1'b0;
        end 
         6'b000100:begin
           jump=1'b0;
           alu_op=2'b01;
           mem_write=1'b0;
           reg_write=1'b0;
           reg_dest=1'b0;
           alu_src=1'b0;
           memtoreg=1'b0;
           branch=1'b1;
        end 
         6'b000010:begin
           jump=1'b1;
           alu_op=2'b00;
           mem_write=1'b0;
           reg_write=1'b0;
           reg_dest=1'b0;
           alu_src=1'b0;
           memtoreg=1'b0;
           branch=1'b0;
        end 
        default: begin
           jump=1'b0;
           alu_op=2'b00;
           mem_write=1'b0;
           reg_write=1'b0;
           reg_dest=1'b0;
           alu_src=1'b0;
           memtoreg=1'b0;
           branch=1'b0;
        end 
    endcase
    
end
    
endmodule