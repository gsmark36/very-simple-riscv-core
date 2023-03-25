module imem #(parameter Size = 64) //64*4=256Bytes 2^8=256Bytes 8-bit addr needed
	(input logic [31:0] a,
	output logic [31:0] rd1, rd2);

logic [31:0]RAM[Size-1:0];

initial
$readmemh("Test2.txt", RAM);

assign rd1 = RAM[a[31:2]];
assign rd2 = RAM[a[31:2] + 30'b1];

endmodule
