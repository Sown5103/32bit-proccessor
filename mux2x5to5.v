module mux2x5to5( DataOut,Data0, Data1, Select);
output reg [4:0] DataOut; // Data Out
input [4:0] Data0, Data1; // Data In 1 and 2
input Select;
// neu Select = 0 thi DataOut = Data0
// nguoc lai thi DataOut = Data1
always @(*)
	if (Select) DataOut=Data1;
	else DataOut=Data0;

endmodule