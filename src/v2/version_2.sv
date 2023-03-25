module version_2 (input logic clk, reset,
	input logic [31:0] Ins1, Ins2, ReadData,
	output logic [31:0] PC, ALUResult1, WriteData,
	output logic MemWrite);

logic RegWrite1, ALUSrc, Branch, Jump, Mem2Reg, PC2Reg;
logic [2:0] ALUControl1;

controller controller(Ins1[6:0], Ins1[31:25], Ins1[14:12], RegWrite1, ALUSrc, Branch, Jump, MemWrite, Mem2Reg, PC2Reg, ALUControl1);

datapath datapath(clk, reset, RegWrite1, ALUSrc, Branch, Jump, Mem2Reg, PC2Reg, ALUControl1, Ins1, Ins2, ReadData, PC, ALUResult1, WriteData);

endmodule
