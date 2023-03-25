module adder #(parameter Width = 32)
	(input logic [Width-1:0] a, b,
	output logic [Width-1:0] y);

assign y = a + b;

endmodule
