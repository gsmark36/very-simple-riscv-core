module regfile (input logic clk, we3, we6,
	input logic [4:0] a1, a2, a3, a4, a5, a6,
	input logic [31:0] wd3, wd6,
	output logic [31:0] rd1, rd2, rd4, rd5);

logic [31:0]rf[31:0];

always_ff @(posedge clk)
begin
if(we3) rf[a3] <= wd3;
if(we6) rf[a6] <= wd6;
end

assign rd1 = (a1!=0) ? rf[a1] : 0;
assign rd2 = (a2!=0) ? rf[a2] : 0;
assign rd4 = (a4!=0) ? rf[a4] : 0;
assign rd5 = (a5!=0) ? rf[a5] : 0;

endmodule
