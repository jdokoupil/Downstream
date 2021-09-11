`timescale 1ns/1ns
module 4_bit_bcd_adder( A,B,CIN,COUT, SUM );
input A;
input B;
input CIN;
output COUT;
output SUM;

wire [3:0]A;
wire [3:0]B;
wire CIN;

reg [3:0]SUM;
reg [4:0]s;//local variable

assign SUM = s[3:0];
assign COUT = s[4];

always@(*)begin
  s = A+B+CIN;
  if( s > 5b'01001 )begin
    s = s + 5b'00110;
  end
end



endmodule
