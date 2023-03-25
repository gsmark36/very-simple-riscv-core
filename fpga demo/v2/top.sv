module v_2 (input logic clk, reset, switch,
	output logic [7:0] LEDOutput); //define i/o

logic [31:0] PC, ReadData, DataAdr, WriteData, Ins1, Ins2;
logic MemWrite, dmclk;
logic [7:0] OutputA, OutputB;

//assign LEDOutput = DataAdr[7:0]; //ALU output data
assign OutputA = (MemWrite) ? WriteData[31:24] : OutputA;
assign OutputB = (MemWrite) ? WriteData[27:20] : OutputB;
assign LEDOutput = (switch) ? OutputA : OutputB;

version_2 version_2(clk, ~reset, Ins1, Ins2, ReadData, PC, DataAdr, WriteData, MemWrite);

imem im(PC, Ins1, Ins2);

mux2 #(1) dmclkmux(1'b1, clk, MemWrite, dmclk);
dmem dm(dmclk, MemWrite, DataAdr, WriteData, ReadData);

endmodule
