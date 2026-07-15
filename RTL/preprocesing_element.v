`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company       : KLE Technological University
// Engineer      : Chetan Patil
//
// Module Name   : processing_element
// Project Name  : INT8 CNN Accelerator
//
// Description:
// Processing Element (PE)
// Performs one INT8 Multiply-Accumulate (MAC) operation.
// Multiple PEs are instantiated inside the PE Array for
// parallel convolution.
//
//////////////////////////////////////////////////////////////////////////////////

module processing_element #

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

    output wire signed [ACC_WIDTH-1:0] pe_out
);

//------------------------------------------------------
// MAC Unit
//------------------------------------------------------

mac_unit #

(
    .DATA_WIDTH(DATA_WIDTH),
    .PRODUCT_WIDTH(PRODUCT_WIDTH),
    .ACC_WIDTH(ACC_WIDTH)
)

MAC_PE

(
    .clk(clk),
    .rst(rst),
    .enable(enable),

    .feature(feature),
    .weight(weight),

    .mac_out(pe_out)

);

endmodule
