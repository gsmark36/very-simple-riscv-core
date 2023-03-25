module datapath (input logic clk, reset,
	input logic RegWrite, ALUSrc, Branch, Jump, Mem2Reg, PC2Reg,
	input logic [2:0] ALUControl,
	input logic [31:0] Ins, ReadData,
	output logic [31:0] PC, ALUResult, WriteData);

logic [31:0] PCNext, PC4, PCBranchJump;
logic [31:0] SignImm, Result, WD3;
logic [31:0] SrcA, SrcB;
logic PCSrc, Zero;

//next pc logic
flopr pcreg(clk, reset, PCNext, PC);
adder pcadder_1(PC, 32'b100, PC4);
adder pcadder_2(PC, SignImm, PCBranchJump);
mux2 pcmux(PC4, PCBranchJump, PCSrc, PCNext);

//register file logic
regfile rf(clk, RegWrite, Ins[19:15], Ins[24:20], Ins[11:7], WD3, SrcA, WriteData);
mux2 wd3mux(Result, PC4, PC2Reg, WD3);
mux2 resultmux(ALUResult, ReadData, Mem2Reg, Result);

//sign extension unit
signext sext(Ins[31:7], Ins[6:2], SignImm);

//alu logic
alu alu(SrcA, SrcB, ALUControl, ALUResult, Zero);
mux2 srcbmux(WriteData, SignImm, ALUSrc, SrcB);
assign PCSrc = Jump | (Branch & Zero);

endmodule
