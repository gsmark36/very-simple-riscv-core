`timescale 1ns/1ps

module imem_testbench;
logic [31:0] a, rd;

imem dut(a, rd);

initial
begin
a = 0; 
#10; if(rd !== 'h02400413) $display("02400413 failed.");
a = 4; 
#10; if(rd !== 'h00400493) $display("00400493 failed.");
a = 8; 
#10; if(rd !== 'h00940333) $display("00940333 failed.");
a = 60; 
#10; if(rd !== 'h0129A0A3) $display("0129A0A3 failed.");
end

initial
begin
$monitor("a=%b rd=%b", a, rd);
end
endmodule
