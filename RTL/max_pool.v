`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : INT8 CNN Accelerator
// Module Name  : max_pool
//
// Description:
// 2×2 Max Pooling
//////////////////////////////////////////////////////////////////////////////////

module max_pool #

(
    parameter DATA_WIDTH = 32
)

(

input wire signed [DATA_WIDTH-1:0] a,
input wire signed [DATA_WIDTH-1:0] b,
input wire signed [DATA_WIDTH-1:0] c,
input wire signed [DATA_WIDTH-1:0] d,

output reg signed [DATA_WIDTH-1:0] max_out

);

always @(*)
begin

    max_out = a;

    if(b > max_out)
        max_out = b;

    if(c > max_out)
        max_out = c;

    if(d > max_out)
        max_out = d;

end

endmodule
