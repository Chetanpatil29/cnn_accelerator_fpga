`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : INT8 CNN Accelerator
// Module Name  : cnn_top
//
// Description:
// Top-Level Integration Module
//////////////////////////////////////////////////////////////////////////////////

module cnn_top(

input wire clk,
input wire rst,
input wire start,

input wire signed [7:0] feature,
input wire signed [7:0] weight,

output wire signed [7:0] cnn_output,

output wire done

);

//-----------------------------------------------------
// Internal Signals
//-----------------------------------------------------

wire load_feature;
wire load_weight;
wire conv_enable;
wire relu_enable;
wire pool_enable;
wire store_enable;

wire signed [31:0] pe_out;

wire signed [31:0] conv_out;

wire signed [31:0] relu_out;

wire signed [31:0] pool_out;

//-----------------------------------------------------
// Controller
//-----------------------------------------------------

controller CTRL(

.clk(clk),
.rst(rst),
.start(start),

.load_feature(load_feature),
.load_weight(load_weight),

.conv_enable(conv_enable),

.relu_enable(relu_enable),

.pool_enable(pool_enable),

.store_enable(store_enable),

.done(done)

);

//-----------------------------------------------------
// Single Processing Element
//-----------------------------------------------------

processing_element PE(

.clk(clk),
.rst(rst),

.enable(conv_enable),

.feature(feature),

.weight(weight),

.pe_out(pe_out)

);

//-----------------------------------------------------
// Convolution
//-----------------------------------------------------

convolution CONV(

.clk(clk),
.rst(rst),

.enable(conv_enable),

.pe0(pe_out),
.pe1(0),
.pe2(0),
.pe3(0),
.pe4(0),
.pe5(0),
.pe6(0),
.pe7(0),
.pe8(0),

.conv_out(conv_out)

);

//-----------------------------------------------------
// ReLU
//-----------------------------------------------------

relu RELU(

.relu_in(conv_out),

.relu_out(relu_out)

);

//-----------------------------------------------------
// Max Pool

//-----------------------------------------------------

max_pool POOL(

.a(relu_out),

.b(0),

.c(0),

.d(0),

.max_out(pool_out)

);

//-----------------------------------------------------
// Quantizer
//-----------------------------------------------------

quantizer QUANT(

.quant_in(pool_out),

.quant_out(cnn_output)

);

endmodule
