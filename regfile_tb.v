`timescale 1ns/1ps
module regfile_tb();
reg [31:0]WriteData;
reg [4:0] ReadRegister1,ReadRegister2,WriteRegister;
reg RegWrite, clk;
wire [31:0] ReadData1, ReadData2;

regfile uut(
	.ReadData1(ReadData1),.ReadData2(ReadData2),.WriteData(WriteData),.ReadRegister1(ReadRegister1),
	.ReadRegister2(ReadRegister2),.WriteRegister(WriteRegister),.RegWrite(RegWrite),.clk(clk)
);
initial begin
	clk=1'b0;
	forever #10 clk=~clk;
end
initial begin
	//write 
	WriteRegister=5'b10;
	WriteData=32'b1000;
	RegWrite=1'b1;
	#30
	//read
	ReadRegister1=2;
	ReadRegister2=3;
	#30
	$stop;
end
endmodule 