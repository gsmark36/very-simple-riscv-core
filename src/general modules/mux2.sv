module mux2 #(parameter Width = 32)
	(input logic [Width-1:0] d0, d1,
	input logic select,
	output logic [Width-1:0] y);

assign y = select ? d1 : d0;

endmodule
