`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : INT8 CNN Accelerator
// Module Name  : relu
//
// Description:
// ReLU Activation
// Output = max(0,input)
//
//////////////////////////////////////////////////////////////////////////////////

module relu #

(
    parameter DATA_WIDTH = 32
)

(

input wire signed [DATA_WIDTH-1:0] relu_in,

output wire signed [DATA_WIDTH-1:0] relu_out

);

assign relu_out = (relu_in > 0) ? relu_in : 0;

endmodule
