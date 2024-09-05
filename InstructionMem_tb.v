`timescale 1ns/1ps
module InstructionMem_tb();
reg readadd,clk,reset;
reg [31:0] address;
wire [31:0] instruction;

InstructionMem uut(.readadd(readadd), .instruction(instruction), .address(address),
						.clk(clk),.reset(reset));
initial begin
clk=0;
forever #20 clk=~clk;
end
initial
begin
readadd=1;
$monitor("Time %0t: , Mem Address=%h instruction=%b",$time,address,instruction);
 address=32'd0;#40;
 address=32'd4;#80;
 address=32'd8;#120;
 address=32'd12;#160;
 address=32'd16;#200;
 address=32'd20;#240;
 address=32'd24;#280;
 address=32'd28;#320;

$finish;
end

endmodule