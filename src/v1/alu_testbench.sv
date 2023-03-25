`timescale 1ns/1ps

module alu_testbench;
logic [31:0] srca, srcb, aluresult;
logic [2:0] alucontrol;
logic zero;

alu alu_dut(srca, srcb, alucontrol, aluresult, zero);

initial
begin
srca = -24; srcb = 285; alucontrol = 3'b111; 
#10; if(aluresult !== 1) $display("slt failed.");
srca = 32'b11001; srcb = 32'b10101; alucontrol = 3'b010;
#10; if(aluresult !== 32'b101110) $display("add failed.");
srca = 32'b1011; srcb = 21'b101010; alucontrol = 3'b110;
#10; if(aluresult !== -31) $display("sub failed.");
srca = 32'b11110000; srcb = 32'b11000011; alucontrol = 3'b000;
#10; if(aluresult !== 32'b11000000) $display("and failed.");
srca = 32'b11001100; srcb = 32'b11001010; alucontrol = 3'b001;
#10; if(aluresult !== 32'b11001110) $display("or failed.");
srca = 32'b101; srcb = 32'b101; alucontrol = 3'b110;
#10; if(zero !== 1) $display("zero failed.");
end

initial
begin
$monitor("aluresult=%b zero=%b", aluresult, zero);
end
endmodule
