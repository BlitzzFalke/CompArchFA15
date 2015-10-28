//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);

//select data with decoder
wire [31:0] decoderes;
decoder1to32 decode(decoderes, RegWrite, WriteRegister);

//read the register
//first the zero
wire[31:0] Readreg0; 
register32zero reg0(Readreg0, WriteData, decoderes[0], Clk); 

//then the other 31
wire[31:0] Readreg1; 
register32 reg1(Readreg1, WriteData, decoderes[1], Clk); 
wire[31:0] Readreg2; 
register32 reg2(Readreg2, WriteData, decoderes[2], Clk); 
wire[31:0] Readreg3; 
register32 reg3(Readreg3, WriteData, decoderes[3], Clk); 
wire[31:0] Readreg4; 
register32 reg4(Readreg4, WriteData, decoderes[4], Clk); 
wire[31:0] Readreg5; 
register32 reg5(Readreg5, WriteData, decoderes[5], Clk); 
wire[31:0] Readreg6; 
register32 reg6(Readreg6, WriteData, decoderes[6], Clk); 
wire[31:0] Readreg7; 
register32 reg7(Readreg7, WriteData, decoderes[7], Clk); 
wire[31:0] Readreg8; 
register32 reg8(Readreg8, WriteData, decoderes[8], Clk); 
wire[31:0] Readreg9; 
register32 reg9(Readreg9, WriteData, decoderes[9], Clk); 
wire[31:0] Readreg10; 
register32 reg10(Readreg10, WriteData, decoderes[10], Clk); 
wire[31:0] Readreg11; 
register32 reg11(Readreg11, WriteData, decoderes[11], Clk); 
wire[31:0] Readreg12; 
register32 reg12(Readreg12, WriteData, decoderes[12], Clk); 
wire[31:0] Readreg13; 
register32 reg13(Readreg13, WriteData, decoderes[13], Clk); 
wire[31:0] Readreg14; 
register32 reg14(Readreg14, WriteData, decoderes[14], Clk); 
wire[31:0] Readreg15; 
register32 reg15(Readreg15, WriteData, decoderes[15], Clk); 
wire[31:0] Readreg16; 
register32 reg16(Readreg16, WriteData, decoderes[16], Clk); 
wire[31:0] Readreg17; 
register32 reg17(Readreg17, WriteData, decoderes[17], Clk); 
wire[31:0] Readreg18; 
register32 reg18(Readreg18, WriteData, decoderes[18], Clk); 
wire[31:0] Readreg19; 
register32 reg19(Readreg19, WriteData, decoderes[19], Clk); 
wire[31:0] Readreg20; 
register32 reg20(Readreg20, WriteData, decoderes[20], Clk); 
wire[31:0] Readreg21; 
register32 reg21(Readreg21, WriteData, decoderes[21], Clk); 
wire[31:0] Readreg22; 
register32 reg22(Readreg22, WriteData, decoderes[22], Clk); 
wire[31:0] Readreg23; 
register32 reg23(Readreg23, WriteData, decoderes[23], Clk); 
wire[31:0] Readreg24; 
register32 reg24(Readreg24, WriteData, decoderes[24], Clk); 
wire[31:0] Readreg25; 
register32 reg25(Readreg25, WriteData, decoderes[25], Clk); 
wire[31:0] Readreg26; 
register32 reg26(Readreg26, WriteData, decoderes[26], Clk); 
wire[31:0] Readreg27; 
register32 reg27(Readreg27, WriteData, decoderes[27], Clk); 
wire[31:0] Readreg28; 
register32 reg28(Readreg28, WriteData, decoderes[28], Clk); 
wire[31:0] Readreg29; 
register32 reg29(Readreg29, WriteData, decoderes[29], Clk); 
wire[31:0] Readreg30; 
register32 reg30(Readreg30, WriteData, decoderes[30], Clk); 
wire[31:0] Readreg31; 
register32 reg31(Readreg31, WriteData, decoderes[31], Clk); 

//The MUX to get results
mux32to1by32 mux1(ReadData1, ReadRegister1, Readreg0,Readreg1, Readreg2, Readreg3, Readreg4, Readreg5, Readreg6, Readreg7, Readreg8, Readreg9, 
						Readreg10, Readreg11, Readreg12, Readreg13, Readreg14, Readreg15, Readreg16, Readreg17, Readreg18, Readreg19, 
						Readreg20, Readreg21, Readreg22, Readreg23, Readreg24, Readreg25, Readreg26, Readreg27, Readreg28, Readreg29, 
						Readreg30, Readreg31);
mux32to1by32 mux2(ReadData2, ReadRegister2, Readreg0,Readreg1, Readreg2, Readreg3, Readreg4, Readreg5, Readreg6, Readreg7, Readreg8, Readreg9, 
						Readreg10, Readreg11, Readreg12, Readreg13, Readreg14, Readreg15, Readreg16, Readreg17, Readreg18, Readreg19, 
						Readreg20, Readreg21, Readreg22, Readreg23, Readreg24, Readreg25, Readreg26, Readreg27, Readreg28, Readreg29, 
						Readreg30, Readreg31);

//Below all the individual modules called above

// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule

//Assignes d to q if clk and write enable are on
module register32
(
output reg 	[31:0] q,
input 		[31:0] d,
input 		wrenable,
input 		clk
);

	always @(posedge clk) begin
		if(wrenable) begin
			q = d;
		end
	end
endmodule



//Assignes 32'b0 to q if clk and write enable are on
module register32zero
(
output reg 	[31:0] q,
input 		[31:0] d,
input 		wrenable,
input 		clk
);

	always @(posedge clk) begin
		if(wrenable) begin
			q = 32'b0;
		end
	end
endmodule

// 32 bit decoder with enable signal
//   enable=0: all output bits are 0
//   enable=1: out[address] is 1, all other outputs are 0
module decoder1to32
(
output[31:0]	out,
input		enable,
input[4:0]	address
);

    assign out = enable<<address; 

endmodule

module mux32to1by32
(
output[31:0]    out,
input[4:0]      address,
input[31:0]     input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, 
		input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, 
		input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, 
		input30, input31
);

  wire[31:0] mux[31:0];         // Create a 2D array of wires
  assign mux[0] = input0;       // Connect the sources of the array
  assign mux[1] = input1;
  assign mux[2] = input2;
  assign mux[3] = input3;
  assign mux[4] = input4;
  assign mux[5] = input5;
  assign mux[6] = input6;
  assign mux[7] = input7;
  assign mux[8] = input8;       // Connect the sources of the array
  assign mux[9] = input9;
  assign mux[10] = input10;
  assign mux[11] = input11;
  assign mux[12] = input12;
  assign mux[13] = input13;
  assign mux[14] = input14;
  assign mux[15] = input15;
  assign mux[16] = input16;       // Connect the sources of the array
  assign mux[17] = input17;
  assign mux[18] = input18;
  assign mux[19] = input19;
  assign mux[20] = input20;
  assign mux[21] = input21;
  assign mux[22] = input22;
  assign mux[23] = input23;
  assign mux[24] = input24;       // Connect the sources of the array
  assign mux[25] = input25;
  assign mux[26] = input26;
  assign mux[27] = input27;
  assign mux[28] = input28;
  assign mux[29] = input29;
  assign mux[30] = input30;
  assign mux[31] = input31;
  assign out = mux[address];    // Connect the output of the array
endmodule



endmodule
