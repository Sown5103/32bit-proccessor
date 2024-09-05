

module InstructionMem(readadd,reset, instruction, address,clk);
input readadd, reset,clk;
input [31:0] address;
output reg[31:0] instruction;
reg [31:0]instrmem[31:0];
reg [31:0]temp;


always @(*)
begin
	if (reset) temp=32'b0; 
		else temp=address;
	if (readadd) instruction=instrmem[temp/4];
end

initial
begin
$readmemb("instr.txt", instrmem);
end

endmodule


