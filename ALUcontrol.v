module ALUcontrol(ins,ALUOp,ALUctrl);
input [5:0]ins;
input [1:0]ALUOp;
wire [7:0]temp;
//reg [1:0]ALUctrl;
output reg[1:0] ALUctrl;
assign temp={ALUOp,ins};
always @(temp)
begin
	casex(temp)
	8'b11xxxxxx: ALUctrl=2'b01; //xor
	8'b00xxxxxx: ALUctrl=2'b00; //add - lw,sw
	8'b01xxxxxx: ALUctrl=2'b10; //sub - beq
	8'b10100000: ALUctrl=2'b00; //add
	8'b10100010: ALUctrl=2'b10; //sub
	8'b10101010: ALUctrl=2'b11; //slt
	default: ALUctrl=2'b00;
	endcase
end

endmodule