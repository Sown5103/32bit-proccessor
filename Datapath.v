module Datapath(clk,reset,start,RegWrite,RegDst,ALUSrc,ALUOp,MemRead,MemWrite,
		MemToReg,Branch,Jump,ins,aluout,alu1,alu22,addr,muxDmemout,add2out,
		jumpaddr,muxJout,clk_out);
input clk,reset,start,RegDst,ALUSrc,RegWrite,MemRead,MemWrite,MemToReg,Branch,Jump;
input [1:0]ALUOp;

wire [31:0]mux5bout,alu2,
		SEout,Memout,inadd1,add1out,muxBrout,jaddr;
wire [1:0]ALUsig;
wire neg,overf,isZero,cout,selmuxBr;
output [31:0]aluout,ins,alu1,alu22,addr,muxDmemout,add2out,jumpaddr,muxJout;
output clk_out;
PC pc(.in(muxJout),.address(addr),.start(start),.clk(clk),.clk_out(clk_out));
Add add2(.A(addr),.B(32'b100),.S(add2out));
InstructionMem IM(.readadd(1),.reset(reset),.instruction(ins),.address(addr),.clk(clk));
regfile RF(.ReadData1(alu1),.ReadData2(alu2),
		.WriteData(muxDmemout),.ReadRegister1(ins[25:21]),
		.ReadRegister2(ins[20:16]),.WriteRegister(mux5bout),
		.RegWrite(RegWrite),.clk(clk));
mux2x5to5 mux5b(.DataOut(mux5bout),.Data0(ins[20:16]),
			.Data1(ins[15:11]),.Select(RegDst));
sign_extend SE(.sOut32(SEout),.sIn16(ins[15:0]));
mux2x32to32 muxRegout(.DataOut(alu22),.Data0(alu2),
			.Data1(SEout),.Select(ALUSrc));
ALUcontrol ALUC(.ins(ins[5:0]),.ALUOp(ALUOp[1:0]),.ALUctrl(ALUsig));
alu ALU(.Output(aluout),.CarryOut(cout),
	 .zero(isZero),.overflow(overf),.negative(neg),
    .BussA(alu1),.BussB(alu22),.ALUControl(ALUsig));
dataMem DM(.data(Memout),.address(aluout),.writedata(alu2),
		.writeenable(MemWrite),.MemRead(MemRead),.clk(clk));
mux2x32to32 muxDatamemout(.DataOut(muxDmemout),.Data0(Memout),
			.Data1(aluout),.Select(MemToReg));
and andbeq(selmuxBr,Branch,isZero);
shift_left_2 sl21(.Out32(inadd1),.In32(SEout));
Add add1(.A(add2out),.B(inadd1),.S(add1out));
mux2x32to32 muxBranch(.DataOut(muxBrout),.Data0(add2out),
			.Data1(add1out),.Select(selmuxBr));
shift_left_2 sl22(.Out32(jaddr),.In32({6'b0,ins[25:0]}));
concat cc(.ccatout(jumpaddr),.a(jaddr),.b(add2out[31:28]));
mux2x32to32 muxJ(.DataOut(muxJout),.Data0(jumpaddr),
			.Data1(muxBrout),.Select(Jump));

endmodule