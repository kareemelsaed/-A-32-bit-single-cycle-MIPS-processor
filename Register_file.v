module Register_file (
    input wire [4:0] A1,
    input wire [4:0] A2,
    input wire [4:0] A3,
    input wire [31:0] WD3,
    input wire        clk,reset,WE3,
    output wire [31:0] RD1,
    output wire [31:0] RD2
);
 reg     [31:0]     reg_array [0:31];  
 integer i;
      always @ (posedge clk or negedge reset) begin  
           if(~reset) begin  
             for (i=0 ; i<32 ; i=i+1)
              reg_array [i] <=32'b0;
           end  
           else if  (WE3)  
                     reg_array[A3] <= WD3;  
                  
             
      end  
      assign RD1 = reg_array[A1];  
      assign RD2 = reg_array[A2];  
    
endmodule