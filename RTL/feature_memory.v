`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : INT8 CNN Accelerator
// Module Name  : feature_memory
//
// Description:
// Single-port Feature Map Memory
//////////////////////////////////////////////////////////////////////////////////

module feature_memory #

(
    parameter DATA_WIDTH = 8,
    parameter MEM_DEPTH  = 256,
    parameter ADDR_WIDTH = 8
)

(
    input wire clk,

    input wire we,

    input wire [ADDR_WIDTH-1:0] addr,

    input wire signed [DATA_WIDTH-1:0] data_in,

    output reg signed [DATA_WIDTH-1:0] data_out
);

reg signed [DATA_WIDTH-1:0] memory [0:MEM_DEPTH-1];

always @(posedge clk)
begin

    if(we)
        memory[addr] <= data_in;

    data_out <= memory[addr];

end

endmodule
