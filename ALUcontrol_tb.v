`timescale 1ns/1ps

module ALUcontrol_tb();

reg [5:0]ins;
reg [1:0]ALUOp;
wire [1:0] ALUctrl;

ALUcontrol uut(.ins(ins),.ALUOp(ALUOp),.ALUctrl(ALUctrl));

initial begin
	#20;
	ALUOp=2'b11; 
	ins=6'b111111;
	#20;
	ALUOp=2'b00; 
	ins=6'b111111;
	#20;
	ALUOp=2'b01; 
	ins=6'b111111;
	#20;
	ALUOp=2'b10; 
	ins=6'b100000;
	#20;
	ALUOp=2'b10; 
	ins=6'b100010;
	#20;
	ALUOp=2'b10; 
	ins=6'b101010;
end

endmodule