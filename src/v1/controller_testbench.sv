`timescale 1ns/1ps

module controller_testbench;
logic [6:0] op, funct7;
logic [2:0] funct3, ALUControl;
logic RegWrite, ALUSrc, Branch, Jump, MemWrite, Mem2Reg, PC2Reg;
logic [9:0] sout;

controller controller_dut(op, funct7, funct3, RegWrite, ALUSrc, Branch, Jump, MemWrite, Mem2Reg, PC2Reg, ALUControl);

initial
begin
op = 7'b0000011; funct3 = 3'b010; funct7 = 7'b1110111;
#10; if(sout !== 10'b11_010_00010) $display("lw failed.");
op = 7'b0100011; funct3 = 3'b010; funct7 = 7'b1010101;
#10; if(sout !== 10'b01_010_001xx) $display("sw failed.");
op = 7'b0110011; funct3 = 3'b000; funct7 = 7'b0000000;
#10; if(sout !== 10'b10_010_00000) $display("add failed.");
op = 7'b0110011; funct3 = 3'b000; funct7 = 7'b0100000;
#10; if(sout !== 10'b10_110_00000) $display("sub failed.");
op = 7'b0110011; funct3 = 3'b111; funct7 = 7'b0000000;
#10; if(sout !== 10'b10_000_00000) $display("and failed.");
op = 7'b0110011; funct3 = 3'b110; funct7 = 7'b0000000;
#10; if(sout !== 10'b10_001_00000) $display("or failed.");
op = 7'b0110011; funct3 = 3'b010; funct7 = 7'b0000000;
#10; if(sout !== 10'b10_111_00000) $display("slt failed.");
op = 7'b1100011; funct3 = 3'b000; funct7 = 7'b1101101;
#10; if(sout !== 10'b00_110_100xx) $display("beq failed.");
op = 7'b0010011; funct3 = 3'b000; funct7 = 7'b1111000;
#10; if(sout !== 10'b11_010_00000) $display("addi failed.");
op = 7'b1101111; funct3 = 3'b111; funct7 = 7'b1100011;
#10; if(sout !== 10'b1x_xxx_010x1) $display("jal failed.");
op = 7'b1100011; funct3 = 3'b111; funct7 = 7'b1011101;
#10; if(sout !== 10'bxxxxxxxxxx) $display("default failed.");
end

always_comb
sout = {RegWrite, ALUSrc, ALUControl, Branch, Jump, MemWrite, Mem2Reg, PC2Reg};

initial
begin
$monitor("sout=%b", sout);
end
endmodule
