`timescale 1ns/1ps

module ssu_testbench;
logic [31:0] Ins1, Ins2;
logic [2:0] ALUControl;
logic RegWrite, InsSrc, PCInt;
logic [5:0] sout;

ssu ssu_dut(Ins1, Ins2, ALUControl, RegWrite, InsSrc, PCInt);

initial
begin
Ins1 = 32'b01000000100110010000001110110011; Ins2 = 32'b00000000100101000000001100110011;
#10; if(sout !== 6'b010_111) $display("add failed.");
Ins1 = 32'b00000000100101000000001100110011; Ins2 = 32'b01000000100110010000001110110011;
#10; if(sout !== 6'b110_111) $display("sub failed.");
Ins1 = 32'b00000010010000000000010000010011; Ins2 = 32'b00000001111101110111001010110011;
#10; if(sout !== 6'b000_111) $display("and failed.");
Ins1 = 32'b00000010010000000000010000010011; Ins2 = 32'b00000001111101110110001010110011;
#10; if(sout !== 6'b001_111) $display("or failed.");
Ins1 = 32'b00000000010100110110001110110011; Ins2 = 32'b00000001111101110010110000110011;
#10; if(sout !== 6'b111_111) $display("slt failed.");
Ins1 = 32'b00000001111101110010110000110011; Ins2 = 32'b00000001010100000111110000110011;
#10; if(sout !== 6'b010_000) $display("NA1 failed."); //rd
Ins1 = 32'b00000001111101110000110000010011; Ins2 = 32'b00000001010111000111000000110011;
#10; if(sout !== 6'b010_000) $display("NA2 failed."); //rs1
Ins1 = 32'b00000001111101110000110000010011; Ins2 = 32'b00000001100010101111000000110011;
#10; if(sout !== 6'b010_000) $display("NA3 failed."); //rs2
Ins1 = 32'b00000001111101110000110000010011; Ins2 = 32'b11110000100010100010000000100011;
#10; if(sout !== 6'b010_000) $display("NA4 failed."); //Ins2 NA
Ins2 = 32'b11110000100010100010000000100011; Ins1 = 32'b00000001111101110000110000010011;
#10; if(sout !== 6'b010_000) $display("NA5 failed."); //Ins1 NA
end

always_comb
sout = {ALUControl, RegWrite, InsSrc, PCInt};

initial
begin
$monitor("sout=%b", sout);
end
endmodule
