`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : INT8 CNN Accelerator
// Module Name  : address_generator
//
// Description:
// Generates sequential addresses for Feature Memory,
// Weight Memory and Output Memory.
//
//////////////////////////////////////////////////////////////////////////////////

module address_generator #

(
    parameter ADDR_WIDTH = 8,
    parameter MEM_DEPTH  = 256
)

(
    input wire clk,
    input wire rst,
    input wire enable,

    output reg [ADDR_WIDTH-1:0] feature_addr,
    output reg [ADDR_WIDTH-1:0] weight_addr,
    output reg [ADDR_WIDTH-1:0] output_addr

);

always @(posedge clk)
begin

    if(rst)
    begin
        feature_addr <= 0;
        weight_addr  <= 0;
        output_addr  <= 0;
    end

    else if(enable)
    begin

        if(feature_addr < MEM_DEPTH-1)
            feature_addr <= feature_addr + 1;

        if(weight_addr < MEM_DEPTH-1)
            weight_addr <= weight_addr + 1;

        if(output_addr < MEM_DEPTH-1)
            output_addr <= output_addr + 1;

    end

end

endmodule
