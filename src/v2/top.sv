module top (input logic clk, reset,
	output logic [31:0] DataAdr, WriteData, Ins1, Ins2,
	output logic MemWrite, dmclk); //define i/o for testing

logic [31:0] PC, ReadData;

version_2 version_2(clk, reset, Ins1, Ins2, ReadData, PC, DataAdr, WriteData, MemWrite);

imem im(PC, Ins1, Ins2);

mux2 #(1) dmclkmux(1'b1, clk, MemWrite, dmclk);
dmem dm(dmclk, MemWrite, DataAdr, WriteData, ReadData);

endmodule
