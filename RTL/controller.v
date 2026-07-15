`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : INT8 CNN Accelerator
// Module Name  : controller
//
// Description:
// Finite State Machine (FSM) Controller
// Controls the execution of the CNN accelerator.
//
//////////////////////////////////////////////////////////////////////////////////

module controller(

input wire clk,
input wire rst,
input wire start,

output reg load_feature,
output reg load_weight,
output reg conv_enable,
output reg relu_enable,
output reg pool_enable,
output reg store_enable,
output reg done

);

//-----------------------------------------------------
// State Encoding
//-----------------------------------------------------

parameter IDLE          = 3'd0;
parameter LOAD_FEATURE  = 3'd1;
parameter LOAD_WEIGHT   = 3'd2;
parameter CONVOLUTION   = 3'd3;
parameter RELU          = 3'd4;
parameter MAXPOOL       = 3'd5;
parameter STORE         = 3'd6;
parameter DONE          = 3'd7;

reg [2:0] state;
reg [2:0] next_state;

//-----------------------------------------------------
// State Register
//-----------------------------------------------------

always @(posedge clk)
begin

    if(rst)
        state <= IDLE;

    else
        state <= next_state;

end

//-----------------------------------------------------
// Next State Logic
//-----------------------------------------------------

always @(*)
begin

    case(state)

        IDLE:
            if(start)
                next_state = LOAD_FEATURE;
            else
                next_state = IDLE;

        LOAD_FEATURE:
            next_state = LOAD_WEIGHT;

        LOAD_WEIGHT:
            next_state = CONVOLUTION;

        CONVOLUTION:
            next_state = RELU;

        RELU:
            next_state = MAXPOOL;

        MAXPOOL:
            next_state = STORE;

        STORE:
            next_state = DONE;

        DONE:
            next_state = IDLE;

        default:
            next_state = IDLE;

    endcase

end

//-----------------------------------------------------
// Output Logic
//-----------------------------------------------------

always @(*)
begin

    load_feature = 0;
    load_weight  = 0;
    conv_enable  = 0;
    relu_enable  = 0;
    pool_enable  = 0;
    store_enable = 0;
    done         = 0;

    case(state)

        LOAD_FEATURE:
            load_feature = 1;

        LOAD_WEIGHT:
            load_weight = 1;

        CONVOLUTION:
            conv_enable = 1;

        RELU:
            relu_enable = 1;

        MAXPOOL:
            pool_enable = 1;

        STORE:
            store_enable = 1;

        DONE:
            done = 1;

    endcase

end

endmodule
