module v_1 (input logic clk, reset,
	output logic [7:0] LEDOutput); //define i/o

logic [31:0] PC, ReadData, DataAdr, WriteData, Ins;
logic MemWrite;

assign LEDOutput = DataAdr[7:0];

version_1 version_1(~clk, ~reset, Ins, ReadData, PC, DataAdr, WriteData, MemWrite);

imem im(PC, Ins);
dmem dm(clk, MemWrite, DataAdr, WriteData, ReadData);

endmodule
