// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR or #50

module behavioralDecoder(out0,out1,out2,out3, address0,address1, enable);
output out0, out1, out2, out3;
input address0, address1;
input enable;
assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule

module structuralDecoder(out0,out1,out2,out3, address0,address1, enable);
output out0, out1, out2, out3;
input address0, address1;
input enable;

`NOT not1(naddress0, address0);
`NOT not2(naddress1, address1);
`AND and1(out0, naddress0, naddress1, enable);
`AND and2(out1, address0, naddress1, enable);
`AND and3(out2, naddress0, address1, enable);
`AND and4(out3, address0, address1, enable);
wire out0;
wire out1;
wire out2;
wire out3;

endmodule

module testDecoder; 
reg address0, address1;
reg enable;
wire out0,out1,out2,out3;
//behavioralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable);
structuralDecoder decoder (out0,out1,out2,out3,address0,address1,enable); // Swap after testing

initial begin
$display("En A0 A1| O0 O1 O2 O3 | Expected Output");
enable=0;address0=0;address1=0; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, address0, address1, out0, out1, out2, out3);
enable=0;address0=1;address1=0; #1000
$display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, address0, address1, out0, out1, out2, out3);
enable=0;address0=0;address1=1; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, address0, address1, out0, out1, out2, out3);
enable=0;address0=1;address1=1; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, address0, address1, out0, out1, out2, out3);
enable=1;address0=0;address1=0; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | O0 Only", enable, address0, address1, out0, out1, out2, out3);
enable=1;address0=1;address1=0; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | O1 Only", enable, address0, address1, out0, out1, out2, out3);
enable=1;address0=0;address1=1; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | O2 Only", enable, address0, address1, out0, out1, out2, out3);
enable=1;address0=1;address1=1; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | O3 Only", enable, address0, address1, out0, out1, out2, out3);
end
endmodule
