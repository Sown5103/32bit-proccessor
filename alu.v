
module alu(
    output reg [31:0] Output,
    output reg CarryOut, zero, overflow, negative,
    input [31:0] BussA, BussB,
    input [1:0] ALUControl
);
reg [32:0] temp;
always @(*) begin
    
    case (ALUControl)
        2'b00: begin // ADD
            temp = {1'b0, BussA} + {1'b0, BussB};
            Output = temp[31:0];
            CarryOut = temp[32];
            overflow = (BussA[31] == BussB[31]) && (Output[31] != BussA[31]);
        end
		  2'b01: begin // XOR
            Output = BussA ^ BussB;
            CarryOut = 0;
            overflow = 0;
        end
        2'b10: begin // SUB
            temp = {1'b0, BussA} - {1'b0, BussB};
            Output = temp[31:0];
            CarryOut = ~temp[32];
            overflow = (BussA[31] != BussB[31]) && (Output[31] != BussA[31]);
        end
        2'b11: begin // SLT (Set on Less Than)
            Output = (BussA < BussB) ? 32'b1 : 32'b0;
            CarryOut = 0;
            overflow = 0;
        end
    endcase

    // Set the negative flag
    negative = Output[31];

    // Set the zero flag
    zero = (Output == 32'b0) ? 1'b1 : 1'b0;
end

endmodule
