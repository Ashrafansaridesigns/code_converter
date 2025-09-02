`timescale 1ns / 1ps

module BCD_binary_convert_tb();
reg [7:0] x;
wire [7:0] y;

BCD_Binary_conversion dut (.x(x),.y(y));

initial begin

 x=8'b00011001;
#10; x=8'b01100011;
#10;

$finish;

end

endmodule
