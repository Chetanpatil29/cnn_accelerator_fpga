`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : INT8 CNN Accelerator
// Module Name  : line_buffer
//
// Description:
// 3-Line Buffer for Sliding Window Generation
//////////////////////////////////////////////////////////////////////////////////

module line_buffer #

(
    parameter DATA_WIDTH = 8,
    parameter IMAGE_WIDTH = 32
)

(

    input wire clk,

    input wire rst,

    input wire enable,

    input wire signed [DATA_WIDTH-1:0] pixel_in,

    output reg signed [DATA_WIDTH-1:0] w0,
    output reg signed [DATA_WIDTH-1:0] w1,
    output reg signed [DATA_WIDTH-1:0] w2

);

reg signed [DATA_WIDTH-1:0] line0 [0:IMAGE_WIDTH-1];
reg signed [DATA_WIDTH-1:0] line1 [0:IMAGE_WIDTH-1];
reg signed [DATA_WIDTH-1:0] line2 [0:IMAGE_WIDTH-1];

integer i;

always @(posedge clk)
begin

    if(rst)
    begin

        for(i=0;i<IMAGE_WIDTH;i=i+1)
        begin

            line0[i] <= 0;
            line1[i] <= 0;
            line2[i] <= 0;

        end

    end

    else if(enable)
    begin

        for(i=IMAGE_WIDTH-1;i>0;i=i-1)
        begin

            line0[i] <= line0[i-1];
            line1[i] <= line1[i-1];
            line2[i] <= line2[i-1];

        end

        line0[0] <= pixel_in;

        line1[0] <= line0[IMAGE_WIDTH-1];

        line2[0] <= line1[IMAGE_WIDTH-1];

    end

end

always @(*)
begin

    w0 = line0[0];
    w1 = line1[0];
    w2 = line2[0];

end

endmodule
