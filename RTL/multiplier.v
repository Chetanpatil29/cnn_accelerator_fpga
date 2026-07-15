`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : INT8 CNN Accelerator
// Module Name  : multiplier
// Author       : Chetan Patil
//
// Description:
// Signed INT8 Multiplier
// Multiplies two signed 8-bit operands and produces
// a signed 16-bit product.
//
//////////////////////////////////////////////////////////////////////////////////

module multiplier #

(

parameter DATA_WIDTH = 8

)

(

input wire signed [DATA_WIDTH-1:0] a,

input wire signed [DATA_WIDTH-1:0] b,

output wire signed [(2*DATA_WIDTH)-1:0] product

);

//------------------------------------------------------
// Signed Multiplication
//------------------------------------------------------

assign product = a * b;

endmodule
