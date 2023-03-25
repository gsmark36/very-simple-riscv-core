module ssu (input logic [31:0] Ins1, Ins2,
	output logic [2:0] ALUControl,
	output logic RegWrite, InsSrc, PCInt);

logic enable;
logic [2:0] sout;
logic [5:0] funct;

assign enable = ((Ins1[6:0] === 7'b0110011)|(Ins1[6:0] === 7'b0010011))&(Ins2[6:0] === 7'b0110011)&((Ins1[11:7] !== Ins2[11:7])&(Ins1[11:7] !== Ins2[19:15])&(Ins1[11:7] !== Ins2[24:20]));

assign sout = (enable) ? 3'b111 : 3'b000;
assign {RegWrite, InsSrc, PCInt} = sout;

assign funct = {Ins2[14:12], Ins2[31:30], enable}; //funct3 + funct7 + enable
always_comb
casez(funct)
6'b000_00_1: ALUControl <= 3'b010; //add
6'b000_01_1: ALUControl <= 3'b110; //sub
6'b111_00_1: ALUControl <= 3'b000; //and
6'b110_00_1: ALUControl <= 3'b001; //or
6'b010_00_1: ALUControl <= 3'b111; //slt
6'b???_??_0: ALUControl <= 3'b010; //NA
default: ALUControl <= 3'b010;
endcase

endmodule
