`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : INT8 CNN Accelerator
// Module Name  : convolution
//
// Description:
// Sums outputs from a 3×3 PE Array.
//
//////////////////////////////////////////////////////////////////////////////////

module convolution #

(
    parameter ACC_WIDTH = 32
)

(

input wire clk,
input wire rst,
input wire enable,

input wire signed [ACC_WIDTH-1:0] pe0,
input wire signed [ACC_WIDTH-1:0] pe1,
input wire signed [ACC_WIDTH-1:0] pe2,
input wire signed [ACC_WIDTH-1:0] pe3,
input wire signed [ACC_WIDTH-1:0] pe4,
input wire signed [ACC_WIDTH-1:0] pe5,
input wire signed [ACC_WIDTH-1:0] pe6,
input wire signed [ACC_WIDTH-1:0] pe7,
input wire signed [ACC_WIDTH-1:0] pe8,

output reg signed [ACC_WIDTH-1:0] conv_out

);

always @(posedge clk)
begin

    if(rst)

        conv_out <= 0;

    else if(enable)

        conv_out <=
            pe0 +
            pe1 +
            pe2 +
            pe3 +
            pe4 +
            pe5 +
            pe6 +
            pe7 +
            pe8;

end

endmodule
