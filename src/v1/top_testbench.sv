`timescale 1ns/1ps

module top_testbench;
logic clk, reset, MemWrite;
logic [31:0] DataAdr, WriteData, Ins;

top dut(clk, reset, DataAdr, WriteData, Ins, MemWrite);

initial
begin
reset <= 1; #25;
reset <= 0;
end

always
begin
clk <= 0; #10;
clk <= 1; #10;
end

always @(negedge clk) begin
if(MemWrite) begin
	if(DataAdr === 44 & WriteData === 36) begin
		$display("Simulation succeeded.");
		$stop;
	end else if(DataAdr !== 12) begin
		$display("Simulation failed.");
		$stop;
	end
end
end

initial
begin
$monitor("Ins=%b MemWrite=%b DataAdr=%b WriteData=%b", Ins, MemWrite, DataAdr, WriteData);
end

endmodule
