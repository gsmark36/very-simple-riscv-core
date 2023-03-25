`timescale 1ns/1ps

module mux2_testbench;
logic [31:0] d0, d1, y;
logic select;

mux2 mux2_dut(d0, d1, select, y);

initial
begin
d0 = 32'b0; d1 = 32'b11111111111111111111111111111111;
#10; if(y !== 32'bx) $display("invalid output failed.");
select = 0;
#10; if(y !== 32'b0) $display("d0 select failed.");
d0 = 32'b11011; d1 = 21'b101010; select = 1;
#10; if(y !== 32'b101010) $display("d1 select failed.");
d0 = 32'b1001; d1 = 32'b11111; select = 0;
#10; if(y !== 32'b1001) $display("d0 select failed.");
d0 = 32'b1111; d1 = 32'b0; select = 1;
#10; if(y !== 32'b0) $display("d1 select failed.");
end

initial
begin
$monitor("d0=%b d1=%b select=%b y=%b", d0, d1, select, y);
end
endmodule
