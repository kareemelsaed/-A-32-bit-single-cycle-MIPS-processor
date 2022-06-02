module instr_mem (
    input wire  [31:0] pc,
    output wire [31:0] instr
);

reg   [31:0]   ROM   [0:99];

initial 
    begin
        $readmemh ("GCD_Machine Code.txt", ROM);
    end

assign instr = ROM[pc>>2];

endmodule 