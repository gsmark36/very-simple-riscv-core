module top (input logic clk, reset,
	output logic [31:0] DataAdr, WriteData, Ins,
	output logic MemWrite); //define i/o for testing

logic [31:0] PC, ReadData;

version_1 version_1(clk, reset, Ins, ReadData, PC, DataAdr, WriteData, MemWrite);

imem im(PC, Ins);
dmem dm(clk, MemWrite, DataAdr, WriteData, ReadData);

endmodule
