module datapath (input logic clk, reset,
	input logic RegWrite1, ALUSrc, Branch, Jump, Mem2Reg, PC2Reg,
	input logic [2:0] ALUControl1,
	input logic [31:0] Ins1, Ins2, ReadData,
	output logic [31:0] PC, ALUResult1, WriteData);

logic [31:0] PCNext, PC4, PCBranchJump, PCAdd;
logic [31:0] SignImm, Result, WD3, WD6, Ins2x;
logic [31:0] SrcA1, SrcB1, SrcA2, SrcB2;
logic [2:0] ALUControl2;
logic RegWrite2, InsSrc, PCInt;
logic PCSrc, Zero1, Zero2, rfclk;

//next pc logic
flopr pcreg(clk, reset, PCNext, PC);
mux2 pcmux_1(32'b100, 32'b1000, PCInt, PCAdd);
adder pcadder_1(PC, PCAdd, PC4);
adder pcadder_2(PC, SignImm, PCBranchJump);
mux2 pcmux_2(PC4, PCBranchJump, PCSrc, PCNext);

//register file logic
mux2 #(1) rfclkmux(1'b1, clk, RegWrite1, rfclk);
regfile rf(rfclk, RegWrite1, RegWrite2, Ins1[19:15], Ins1[24:20], Ins1[11:7], Ins2x[19:15], Ins2x[24:20], Ins2x[11:7], WD3, WD6, SrcA1, WriteData, SrcA2, SrcB2);
mux2 wd3mux(Result, PC4, PC2Reg, WD3);
mux2 resultmux(ALUResult1, ReadData, Mem2Reg, Result);

//sign extension unit
signext sext(Ins1[31:7], Ins1[6:2], SignImm);

//alu logic
alu alu_1(SrcA1, SrcB1, ALUControl1, ALUResult1, Zero1);
alu alu_2(SrcA2, SrcB2, ALUControl2, WD6, Zero2);
mux2 srcbmux(WriteData, SignImm, ALUSrc, SrcB1);
assign PCSrc = Jump | (Branch & Zero1);

//superscalar unit
ssu ssu(Ins1, Ins2, ALUControl2, RegWrite2, InsSrc, PCInt);
mux2 insmux(32'b00000000000000000000000000110011, Ins2, InsSrc, Ins2x);

endmodule
