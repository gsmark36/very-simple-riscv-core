module flopr #(parameter Width = 32)
	(input logic clk, reset,
	input logic [Width-1:0] d,
	output logic [Width-1:0] q);

always_ff @(posedge clk, posedge reset)
if(reset) q <= 0;
else q <= d;

endmodule
