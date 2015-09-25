// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;

//reg a;
//reg b;
//reg carryin;
`XOR xor1(aXORb, a, b);
//wire aXORb;
`AND and1(aANDb, a, b);
//wire aANDb;
`AND and2(aXORbANDcarryin, aXORb, carryin);
//wire aXORbANDcarryin;
`OR or1(carryout, aXORbANDcarryin, aANDb);
wire carryout;
`XOR xor2(sum, aXORb, carryin);
wire sum;

endmodule

module testFullAdder;
reg a, b, carryin;
wire sum, carryout;
structuralFullAdder adder (sum, carryout, a, b, carryin);

initial begin
$display("Cin A B |Sum Cout| Expected Output");
carryin=0;a=0;b=0; #1000 
$display("%b  %b  %b |  %b  %b  | All false", carryin, a, b, sum, carryout);
carryin=1;a=0;b=0; #1000 
$display("%b  %b  %b |  %b  %b  | Sum Only", carryin, a, b, sum, carryout);
carryin=0;a=1;b=0; #1000 
$display("%b  %b  %b |  %b  %b  | Sum Only", carryin, a, b, sum, carryout);
carryin=0;a=0;b=1; #1000 
$display("%b  %b  %b |  %b  %b  | Sum Only", carryin, a, b, sum, carryout);
carryin=0;a=1;b=1; #1000 
$display("%b  %b  %b |  %b  %b  | Cout Only", carryin, a, b, sum, carryout);
carryin=1;a=0;b=1; #1000 
$display("%b  %b  %b |  %b  %b  | Cout Only", carryin, a, b, sum, carryout);
carryin=1;a=1;b=0; #1000 
$display("%b  %b  %b |  %b  %b  | Cout Only", carryin, a, b, sum, carryout);
carryin=1;a=1;b=1; #1000 
$display("%b  %b  %b |  %b  %b  | All true", carryin, a, b, sum, carryout);
end

endmodule
