module controller (input logic [6:0] op, funct7,
	input logic [2:0] funct3,
	output logic RegWrite, ALUSrc, Branch, Jump, MemWrite, Mem2Reg, PC2Reg,
	output logic [2:0] ALUControl);

logic [16:0] sin;
logic [9:0] sout;

assign sin = {op, funct3, funct7};
assign {RegWrite, ALUSrc, ALUControl, Branch, Jump, MemWrite, Mem2Reg, PC2Reg} = sout;

always_comb
casez(sin)
17'b0000011_010_???????: sout <= 10'b11_010_00010; //lw
17'b0100011_010_???????: sout <= 10'b01_010_001xx; //sw
17'b0110011_000_0000000: sout <= 10'b10_010_00000; //add
17'b0110011_000_0100000: sout <= 10'b10_110_00000; //sub
17'b0110011_111_0000000: sout <= 10'b10_000_00000; //and
17'b0110011_110_0000000: sout <= 10'b10_001_00000; //or
17'b0110011_010_0000000: sout <= 10'b10_111_00000; //slt
17'b1100011_000_???????: sout <= 10'b00_110_100xx; //beq
17'b0010011_000_???????: sout <= 10'b11_010_00000; //addi
17'b1101111_???_???????: sout <= 10'b1x_xxx_010x1; //jal
17'b0110111_???_???????: sout <= 10'b11_011_00000; //lui
default: sout <= 10'bxxxxxxxxxx;
endcase

endmodule
