`timescale 1ns/1ns
module bit_8_adder_tb;
reg [7:0]a;
reg [7:0]b;
wire [7:0]s;
reg clk;
reg fuck = 1'b0;
wire this;
bit_8_bcd_adder add( ._A(a), ._B(b), ._CIN(fuck), ._COUT(this) , ._SUM(s) );
reg [7:0]tmp;


initial begin
  a = 8'b0;
  b = 8'b0;
  clk = 1'b0;
  tmp = a;
#5  b = 8'd00000100;
#5  a = 8'd00000000;
#5  a = 8'd00000001;
#5  a = 8'd00000002;
#5  a = 8'd00000003;
#5  a = 8'd00000004;
#5  a = 8'd00000005;
#5  a = 8'd00000006;
#5  a = 8'd00000007;
#5  a = 8'd00000008;
#5  a = 8'd00000009;
#5  a = 8'd00000010;
#5  a = 8'd00000011;
#5  a = 8'd00000012;
#5  a = 8'd00000013;
#5  a = 8'd00000014;
#5  a = 8'd00000015;
#5  a = 8'd00000016;
#5  a = 8'd00000017;
#5  a = 8'd00000018;
#5  a = 8'd00000019;
  #5 $finish;
end



always@(*)begin
  #5 clk = ~clk;
end

endmodule
