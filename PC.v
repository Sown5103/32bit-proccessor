module PC(in, address, start,clk,clk_out);
input [31:0] in; 
input start,clk;
output reg [31:0] address;
output reg clk_out;
reg [1:0]count;
initial begin 
count=2'b01;
clk_out=0;
end        

always @(posedge clk) begin
		  
        
            clk_out <= ~clk_out;  // Toggle clk_out when counter reaches 1

		  
    end
always @(posedge clk_out)
begin
	if (start) address=32'b0;
	else address =in;
end
endmodule 