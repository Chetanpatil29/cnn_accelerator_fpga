`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : INT8 CNN Accelerator
// Module Name  : mac_unit
// Author       : Chetan Patil
//
// Description:
// Multiply-Accumulate (MAC) Unit
// Performs:
//      Accumulator = Accumulator + (A × B)
//
//////////////////////////////////////////////////////////////////////////////////

module mac_unit #

(

parameter DATA_WIDTH = 8,
parameter PRODUCT_WIDTH = 16,
parameter ACC_WIDTH = 32

)

(

input wire clk,
input wire rst,
input wire enable,

input wire signed [DATA_WIDTH-1:0] feature,

input wire signed [DATA_WIDTH-1:0] weight,

output wire signed [ACC_WIDTH-1:0] mac_out

);

//-----------------------------------------------------
// Internal Signals
//-----------------------------------------------------

wire signed [PRODUCT_WIDTH-1:0] product;

//-----------------------------------------------------
// Multiplier
//-----------------------------------------------------

multiplier #

(

.DATA_WIDTH(DATA_WIDTH)

)

MULT

(

.a(feature),

.b(weight),

.product(product)

);

//-----------------------------------------------------
// Accumulator
//-----------------------------------------------------

accumulator #

(

.PRODUCT_WIDTH(PRODUCT_WIDTH),

.ACC_WIDTH(ACC_WIDTH)

)

ACC

(

.clk(clk),

.rst(rst),

.enable(enable),

.product(product),

.accumulator_out(mac_out)

);

endmodule
