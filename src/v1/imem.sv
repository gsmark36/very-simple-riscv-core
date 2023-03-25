module imem #(parameter Size = 64) //64*4=256Bytes 2^8=256Bytes 8-bit addr needed
	(input logic [31:0] a,
	output logic [31:0] rd);

logic [31:0]RAM[Size-1:0];

initial
$readmemh("IM.txt", RAM);

assign rd = RAM[a[31:2]];

endmodule
