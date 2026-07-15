`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : INT8 CNN Accelerator
// Module Name  : quantizer
//
// Description:
// Converts 32-bit accumulated output into INT8.
//
//////////////////////////////////////////////////////////////////////////////////

module quantizer #

(
    parameter INPUT_WIDTH = 32,
    parameter OUTPUT_WIDTH = 8
)

(

input wire signed [INPUT_WIDTH-1:0] quant_in,

output reg signed [OUTPUT_WIDTH-1:0] quant_out

);

always @(*)
begin

    if(quant_in > 127)

        quant_out = 127;

    else if(quant_in < -128)

        quant_out = -128;

    else

        quant_out = quant_in[7:0];

end

endmodule
