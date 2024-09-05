module dataMem(data, address, writedata, writeenable,MemRead,clk);
input [31:0] address, writedata;
input writeenable,MemRead, clk;
output reg[31:0] data;
reg [31:0] datamem[31:0];
reg [31:0] temp;

initial begin
datamem[12]=32'b1111;
end
always @(posedge clk)
begin 
	if (writeenable&&!MemRead) 
		begin
			datamem[address]=writedata;
			data=32'bz;
		end
	else if (MemRead&&!writeenable)
		data=datamem[address];
	else data=32'bz;
end
endmodule