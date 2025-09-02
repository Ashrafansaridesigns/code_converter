`timescale 1ns / 1ps

module BCD_Binary_conversion(
input [7:0] x,
output [7:0] y);

assign y[0] = x[0];
wire [3:0]s;
wire p1;
fourbit_ripple_adder fra0(.a({x[5],x[3],x[2],x[1]}),.b({1'b0,x[4],x[5],x[4]}),.cin(1'b0),.sum({s[3],s[2],s[1],s[0]}),.cout(p1));
fourbit_ripple_adder fra1(.a({1'b0,p1,s[3],s[2]}),.b({x[7],x[6],x[7],x[6]}),.cin(1'b0),.sum({y[6],y[5],y[4],y[3]}),.cout(y[7]));
assign y[1]=s[0];
assign y[2] =s[1];   


endmodule

module fourbit_ripple_adder(
input [3:0] a,b,
input cin,
output [3:0] sum,
output cout);
wire m1,m2,m3;

full_adder Fa0(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(m1));
full_adder Fa1(.a(a[1]),.b(b[1]),.cin(m1),.sum(sum[1]),.cout(m2));
full_adder Fa2(.a(a[2]),.b(b[2]),.cin(m2),.sum(sum[2]),.cout(m3));
full_adder Fa3(.a(a[3]),.b(b[3]),.cin(m3),.sum(sum[3]),.cout(cout));



endmodule
module full_adder(
input a,b,cin,
output sum,cout);
assign sum = a^b^cin;
assign cout = (a&b)|(b&cin)|(cin&a);
endmodule
