`timescale 1ns/1ps

module imem_testbench;
logic [31:0] a, rd1, rd2;

imem imem_dut(a, rd1, rd2);

initial
begin
a = 0;
#10; if((rd1 !== 'h02400413)|(rd2 !== 'h00400493)) $display("02400413 failed.");
a = 4;
#10; if((rd1 !== 'h00400493)|(rd2 !== 'h00940333)) $display("00400493 failed.");
a = 8;
#10; if((rd1 !== 'h00940333)|(rd2 !== 'h00700913)) $display("00940333 failed.");
a = 56;
#10; if((rd1 !== 'h06300913)|(rd2 !== 'h0129A0A3)) $display("06300913 failed.");
end

initial
begin
$monitor("a=%b rd1=%b rd2=%b", a, rd1, rd2);
end
endmodule
