`timescale 1ns/1ps
module Add_tb();

reg [31:0] A,B;
wire [31:0] S;

Add uut(.A(A),.B(B),.S(S));

initial
begin
	$monitor("Time: %0t. A=%b, B=%b, S=%b",$time,A,B,S);
	A=123; B=2312;
	#10; A=123; B=2312;
	#10; A=145; B=2312;
	#10; A=123; B=2;
	#10; A=113; B=2312;
	#10; A=123; B=222;
	#10; A=63; B=12;
	#10; A=3; B=223;
	$stop;

end

endmodule