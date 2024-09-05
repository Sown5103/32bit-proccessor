module regfile(ReadData1,ReadData2,WriteData,ReadRegister1,
ReadRegister2,WriteRegister,RegWrite,clk);

input [4:0]ReadRegister1,ReadRegister2,WriteRegister;
input [31:0] WriteData;
input RegWrite, clk;
output [31:0] ReadData1, ReadData2;
reg [31:0] register_file[31:0]; 
integer i;
initial begin
register_file[1]=32'd8;
register_file[0]=32'd8;
register_file[2]=32'd2;
//register_file[3]=32'd3;
end
always @(posedge clk)
begin
			if (RegWrite) register_file[WriteRegister]=WriteData;
			
end
assign ReadData1 = register_file[ReadRegister1];
assign ReadData2 = register_file[ReadRegister2];
endmodule