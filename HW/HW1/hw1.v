module hw1test;
reg A; // The input A
reg B; // The input B
wire nA;
wire nB;
wire nAandnB;
not Ainv(nA, A); // top inverter produces signal nA and takes
// signal A, and is named Ainv
not Binv(nB, B); // inverter produces signal nB and takes
// signal B, and is named Binv
and andgate(nAandnB, nA, nB); // and gate produces nAandnB from nA and nB
wire AandB;
wire nAandB;
wire nAornB;
wire AorB;
wire nAorB;
and andgate2(AandB, A, B); 
not AandBinv(nAandB, AandB);
or orgate(nAornB, nA, nB);
or orgate2(AorB, A, B);
not AorBinv(nAorB, AorB);
initial begin
$display("A B | ~A ~B | ~(AB) ~A+~B | ~(A+B) ~A~B "); // Prints header for truth table
A=0;B=0; #1 // Set A and B, wait for update (#1)
$display("%b %b |  %b  %b |   %b     %b   |   %b      %b ", A,B, nA, nB, nAandB, nAornB, nAorB, nAandnB);
A=0;B=1; #1 // Set A and B, wait for new update
$display("%b %b |  %b  %b |   %b     %b   |   %b      %b ", A,B, nA, nB, nAandB, nAornB, nAorB, nAandnB);
A=1;B=0; #1
$display("%b %b |  %b  %b |   %b     %b   |   %b      %b ", A,B, nA, nB, nAandB, nAornB, nAorB, nAandnB);
A=1;B=1; #1
$display("%b %b |  %b  %b |   %b     %b   |   %b      %b ", A,B, nA, nB, nAandB, nAornB, nAorB, nAandnB);
end
endmodule