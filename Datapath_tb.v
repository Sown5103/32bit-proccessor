`timescale 1ns/1ps
module Datapath_tb();
wire [31:0]ins,aluout,alu1,alu22,addr,muxDmemout,add2out,jumpaddr,muxJout;
wire clk_out;
reg clk,reset,start,RegDst,ALUSrc,RegWrite,MemRead,MemWrite,MemToReg,Branch,Jump;
reg[1:0]ALUOp;

Datapath uut(.clk(clk),.reset(reset),.start(start),.RegWrite(RegWrite),.RegDst(RegDst),
				.ALUSrc(ALUSrc),.ALUOp(ALUOp),.MemRead(MemRead),.MemWrite(MemWrite),
				.MemToReg(MemToReg),.Branch(Branch),.Jump(Jump),
				.ins(ins),.aluout(aluout),.alu1(alu1),.alu22(alu22),
				.addr(addr),.muxDmemout(muxDmemout),.add2out(add2out),
				.jumpaddr(jumpaddr),.muxJout(muxJout),.clk_out(clk_out));

	
initial begin
clk=0;
forever #20 clk=~clk;
end

initial begin
	start=1; #60; start=0;
end
initial begin
	#20;
	//beq 00010100000000010000000000000010 beq s0 s1 2
	RegDst=0;
	ALUSrc=0;
	RegWrite=0;
	MemRead=0;
	MemWrite=0;
	MemToReg=0;
	Branch=1;
	Jump=1;
	ALUOp=01;
	#80;
	//xori 00111000000000010000000000000100 s1=s0xor4
	RegDst=0;
	ALUSrc=1;
	RegWrite=1;
	MemRead=0;
	MemWrite=0;
	MemToReg=1;
	Branch=0;
	Jump=1;
	ALUOp=11;
	#80;
	//add 00000000000000010001000000100000 s2=s0+s1
	RegDst=1;
	ALUSrc=0;
	RegWrite=1;
	MemRead=0;
	MemWrite=0;
	MemToReg=1;
	Branch=0;
	Jump=1;
	ALUOp=10;
	#80;
	//lw 10001100010000110000000000000010 lw s3,2(s2)
	RegDst=0;
	ALUSrc=1;
	RegWrite=1;
	MemRead=1;
	MemWrite=0;
	MemToReg=0;
	Branch=0;
	Jump=1;
	ALUOp=2'b00;
	
end

endmodule 
