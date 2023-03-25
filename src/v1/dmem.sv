module dmem #(parameter Size = 64) //64*4=256Bytes 2^8=256Bytes 8-bit addr needed
	(input logic clk, we,
	input logic [31:0] a, wd,
	output logic [31:0] rd);

logic [31:0]RAM[Size-1:0];

assign rd = RAM[a[31:2]];

always_ff @(posedge clk)
if(we) RAM[a[31:2]] <= wd;

endmodule
