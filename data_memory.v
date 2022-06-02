module data_memory (
    input   wire   clk_mem, wr,reset_mem, 
    input   wire   [31:0]  A,
    input   wire   [31:0]  WD,
    output  reg    [31:0]  RD,
    output  reg   [15:0]  T_V
);


reg   [31:0]   ram    [0:99];
integer i=0;
/*initial 
    begin 
        $readmemh("mem_contents.txt", ram);
    end */

always @(posedge clk_mem or negedge reset_mem)
    begin
        if (~reset_mem)
             for (i=0 ; i<100 ; i=i+1)
              ram [i] <=32'b0;
        else if(wr)
            begin
                ram[A] <= WD;
            end
    end
always@(*) begin
 RD = ram[A];      
  end
  always @(*)
    begin
        T_V = ram[0] ;
    end
endmodule 