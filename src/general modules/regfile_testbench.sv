`timescale 1ns/1ps

module regfile_testbench;
logic clk, we3;
logic [4:0] a1, a2, a3;
logic [31:0] rd1, rd2, wd3;

regfile regfile_dut(clk, we3, a1, a2, a3, wd3, rd1, rd2);

initial
begin
clk = 0; we3 = 1; a3 = 5'b00000; wd3 = 32'b0; a1 = 5'b00000; a2 = 5'b00001;
#10; clk = 1;
#10; clk = 0; a3 = 5'b00001; wd3 = 32'b1;
#10; clk = 1; 
#10; clk = 0; a3 = 5'b00010; wd3 = 32'b10;
#10; clk = 1; a1 = 5'b00010;
#10; clk = 0; a3 = 5'b00011; wd3 = 32'b11;
#10; clk = 1; a2 = 5'b00011;
#10; clk = 0; a3 = 5'b00100; wd3 = 32'b100;
#10; clk = 1; a1 = 5'b00100;
#10; clk = 0; a3 = 5'b00101; wd3 = 32'b101;
#10; clk = 1; a2 = 5'b00101;
#10; clk = 0; a3 = 5'b00110; wd3 = 32'b110;
#10; clk = 1; a1 = 5'b00110;
#10; clk = 0; a3 = 5'b00111; wd3 = 32'b111;
#10; clk = 1; a2 = 5'b00111;
#10; clk = 0; a3 = 5'b01000; wd3 = 32'b11110000;
#10; clk = 1; a1 = 5'b01000;
#10; clk = 0; a3 = 5'b01001; wd3 = 32'b10101010;
#10; clk = 1; a2 = 5'b01001;
#10; clk = 0; we3 = 0; a3 = 5'b01001; wd3 = 32'b0;
#10; clk = 1; a2 = 5'b01001;
#10;
end

initial
begin
$monitor("rd1=%b rd2=%b", rd1, rd2);
end
endmodule

