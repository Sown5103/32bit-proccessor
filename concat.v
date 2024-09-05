module concat(ccatout, a,b);
input [31:0] a;
input [3:0] b;
output [31:0] ccatout;
assign ccatout={b,a[27:0]};
endmodule