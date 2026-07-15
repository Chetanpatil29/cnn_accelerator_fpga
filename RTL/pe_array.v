`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : INT8 CNN Accelerator
// Module Name  : pe_array
// Author       : Chetan Patil
//
// Description:
// 3×3 Parallel Processing Element Array
// Consists of 9 Processing Elements operating in parallel.
//
//////////////////////////////////////////////////////////////////////////////////

module pe_array #

(
    parameter DATA_WIDTH = 8,
    parameter PRODUCT_WIDTH = 16,
    parameter ACC_WIDTH = 32
)

(

    input wire clk,
    input wire rst,
    input wire enable,

    //--------------------------------------------------
    // Feature Inputs
    //--------------------------------------------------

    input wire signed [DATA_WIDTH-1:0] feature0,
    input wire signed [DATA_WIDTH-1:0] feature1,
    input wire signed [DATA_WIDTH-1:0] feature2,
    input wire signed [DATA_WIDTH-1:0] feature3,
    input wire signed [DATA_WIDTH-1:0] feature4,
    input wire signed [DATA_WIDTH-1:0] feature5,
    input wire signed [DATA_WIDTH-1:0] feature6,
    input wire signed [DATA_WIDTH-1:0] feature7,
    input wire signed [DATA_WIDTH-1:0] feature8,

    //--------------------------------------------------
    // Weight Inputs
    //--------------------------------------------------

    input wire signed [DATA_WIDTH-1:0] weight0,
    input wire signed [DATA_WIDTH-1:0] weight1,
    input wire signed [DATA_WIDTH-1:0] weight2,
    input wire signed [DATA_WIDTH-1:0] weight3,
    input wire signed [DATA_WIDTH-1:0] weight4,
    input wire signed [DATA_WIDTH-1:0] weight5,
    input wire signed [DATA_WIDTH-1:0] weight6,
    input wire signed [DATA_WIDTH-1:0] weight7,
    input wire signed [DATA_WIDTH-1:0] weight8,

    //--------------------------------------------------
    // Outputs
    //--------------------------------------------------

    output wire signed [ACC_WIDTH-1:0] pe0_out,
    output wire signed [ACC_WIDTH-1:0] pe1_out,
    output wire signed [ACC_WIDTH-1:0] pe2_out,
    output wire signed [ACC_WIDTH-1:0] pe3_out,
    output wire signed [ACC_WIDTH-1:0] pe4_out,
    output wire signed [ACC_WIDTH-1:0] pe5_out,
    output wire signed [ACC_WIDTH-1:0] pe6_out,
    output wire signed [ACC_WIDTH-1:0] pe7_out,
    output wire signed [ACC_WIDTH-1:0] pe8_out

);

/////////////////////////////////////////////////////////
// Processing Element 0
/////////////////////////////////////////////////////////

processing_element PE0(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .feature(feature0),
    .weight(weight0),
    .pe_out(pe0_out)
);

processing_element PE1(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .feature(feature1),
    .weight(weight1),
    .pe_out(pe1_out)
);

processing_element PE2(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .feature(feature2),
    .weight(weight2),
    .pe_out(pe2_out)
);

processing_element PE3(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .feature(feature3),
    .weight(weight3),
    .pe_out(pe3_out)
);

processing_element PE4(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .feature(feature4),
    .weight(weight4),
    .pe_out(pe4_out)
);

processing_element PE5(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .feature(feature5),
    .weight(weight5),
    .pe_out(pe5_out)
);

processing_element PE6(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .feature(feature6),
    .weight(weight6),
    .pe_out(pe6_out)
);

processing_element PE7(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .feature(feature7),
    .weight(weight7),
    .pe_out(pe7_out)
);

processing_element PE8(
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .feature(feature8),
    .weight(weight8),
    .pe_out(pe8_out)
);

endmodule
