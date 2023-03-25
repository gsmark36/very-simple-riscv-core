module version_1 (input logic clk, reset,
	input logic [31:0] Ins, ReadData,
	output logic [31:0] PC, ALUResult, WriteData,
	output logic MemWrite);

logic RegWrite, ALUSrc, Branch, Jump, Mem2Reg, PC2Reg;
logic [2:0] ALUControl;

controller controller(Ins[6:0], Ins[31:25], Ins[14:12], RegWrite, ALUSrc, Branch, Jump, MemWrite, Mem2Reg, PC2Reg, ALUControl);

datapath datapath(clk, reset, RegWrite, ALUSrc, Branch, Jump, Mem2Reg, PC2Reg, ALUControl, Ins, ReadData, PC, ALUResult, WriteData);

endmodule
