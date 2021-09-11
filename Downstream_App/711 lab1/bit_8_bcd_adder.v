`timescale 1ns/1ns
module bit_8_bcd_adder( _A, _B, _CIN, _COUT, _SUM );
input _A;
input _B;
input _CIN;
output _COUT;
output _SUM;

wire [7:0]_A;
wire [7:0]_B;
wire [7:0]_SUM;
wire addcount;

bit_4_bcd_adder add1( .A(_A[3:0]), .B(_B[3:0]), .CIN(_CIN) , .COUT(addcount), .SUM(_SUM[3:0]) );
bit_4_bcd_adder add2( .A(_A[7:4]), .B(_B[7:4]), .CIN(addcount), .COUT(_COUT), .SUM(_SUM[7:4]));


endmodule
