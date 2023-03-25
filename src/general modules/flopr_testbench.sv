`timescale 1ns/1ps

module flopr_testbench;
logic [31:0] d, q;
logic clk, reset;

flopr flopr_dut(clk, reset, d, q);

initial
begin
clk = 0; reset = 0; d = 32'b111111;
#5; reset = 1;
#5; if(q !== 32'b0) $display("reset failed.");
clk = 1; reset = 0;
#10; if(q !== 32'b111111) $display("data load failed.");
clk = 0; d = 32'b100001;
#10; clk = 1;
#10; if(q !== 32'b100001) $display("data load failed.");
clk = 0; d = 32'b1010101010;
#10; clk = 1;
#10; if(q !== 32'b1010101010) $display("data load failed.");
clk = 0; d = 32'b11110000;
#10; clk = 1;
#10; if(q !== 32'b11110000) $display("data load failed.");
clk = 0; d = 32'b1100011000;
#10; clk = 1;
#10; if(q !== 32'b1100011000) $display("data load failed.");
clk = 0; reset = 1;
#5; if(q !== 32'b0) $display("reset failed.");
reset = 0;
#5; clk = 1;
end

initial
begin
$monitor("clk=%b reset=%b d=%b q=%b", clk, reset, d, q);
end
endmodule
