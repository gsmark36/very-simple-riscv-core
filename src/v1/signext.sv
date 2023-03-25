module signext (input logic [24:0] DataIn,
	input logic [4:0] Op,
	output logic [31:0] SignImm);


always_comb
casez(Op)
5'b00?00: SignImm <= {{20{DataIn[24]}}, DataIn[24:13]}; //I
5'b01000: SignImm <= {{20{DataIn[24]}}, DataIn[24:18], DataIn[4:0]}; //S
5'b11000: SignImm <= {{20{DataIn[24]}}, DataIn[0], DataIn[23:18], DataIn[4:1], 1'b0}; //B
5'b11011: SignImm <= {{12{DataIn[24]}}, DataIn[12:5], DataIn[13], DataIn[23:14], 1'b0}; //J
default: SignImm <= 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
endcase

endmodule
