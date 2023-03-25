`timescale 1ns/1ps

module adder_testbench;
logic [31:0] a, b;
logic [31:0] y;

adder adder_dut(a, b, y);

initial
begin
a = 32'b0; b = 32'b0;
#10; if(y !== 32'b0) $display("0+0=0 failed.");
a = 32'b10101001; b = 32'b10101;
#10; if(y !== 32'b10111110) $display("169+21=190 failed.");
a = 32'b1011; b = 21'b101010;
#10; if(y !== 32'b110101) $display("11+42=53 failed.");
a = 32'b1001; b = 32'b11111;
#10; if(y !== 32'b101000) $display("9+31=40 failed.");
a = 32'b111; b = 32'b10011100010;
#10; if(y !== 32'b10011101001) $display("7+1250=1257 failed.");
end

initial
begin
$monitor("a=%b b=%b y=%b", a, b, y);
end
endmodule
