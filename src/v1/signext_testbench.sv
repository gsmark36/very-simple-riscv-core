`timescale 1ns/1ps

module signext_testbench;
logic [24:0] DataIn;
logic [4:0] Op;
logic [31:0] SignImm;

signext signext_dut(DataIn, Op, SignImm);

initial
begin
DataIn = 25'b000011011011_0000000000000; Op = 5'b00000;
#10; if(SignImm !== 32'b00000000000000000000_000011011011) $display("I-type failed.");
DataIn = 25'b1111001_0000000000000_11011; Op = 5'b01000;
#10; if(SignImm !== 32'b11111111111111111111_111100111011) $display("S-type failed.");
DataIn = 25'b0_000101_0000000000000_1111_1; Op = 5'b11000;
#10; if(SignImm !== 32'b0000000000000000000_010001011111_0) $display("B-type failed.");
DataIn = 25'b1_1100001010_0_10101111_00000; Op = 5'b11011;
#10; if(SignImm !== 32'b11111111111_11010111101100001010_0) $display("J-type failed.");
DataIn = 25'b1_1100001010_0_10101111_00000; Op = 5'b01100;
#10; if(SignImm !== 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) $display("invalid value failed.");
end

initial
begin
$monitor("SignImm=%b", SignImm);
end
endmodule
