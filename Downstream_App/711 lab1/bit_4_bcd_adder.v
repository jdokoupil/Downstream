`timescale 1ns/1ns
module bit_4_bcd_adder( A,B,CIN,COUT, SUM );
input A;
input B;
input CIN;
output COUT;
output SUM;

wire [3:0]A;
wire [3:0]B;
wire CIN;
reg COUT;
reg [3:0]SUM;


reg [4:0]s;//local variable
reg [4:0]stemp;


always@(*)begin
  stemp = A+B+CIN;
  if( stemp > 5'b01001 )begin
    s = stemp + 5'b00110;
  end
  else begin
    s = stemp;
  end
  SUM = s[3:0];
  COUT = s[4];
end


endmodule
