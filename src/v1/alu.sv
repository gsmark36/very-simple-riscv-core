module alu (input logic [31:0] srca, srcb,
	input logic [2:0] alucontrol, 
	output logic [31:0] aluresult,
	output logic zero);

always_comb
case(alucontrol)
3'b010: aluresult = srca + srcb;
3'b110: aluresult = srca - srcb;
3'b000: aluresult = srca & srcb;
3'b001: aluresult = srca | srcb;
3'b111: aluresult = (srca < srcb);
default: aluresult = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
endcase

assign zero = (aluresult === 0);

endmodule
