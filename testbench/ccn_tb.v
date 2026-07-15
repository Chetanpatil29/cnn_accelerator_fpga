`timescale 1ns / 1ps

module cnn_tb;

reg clk;
reg rst;
reg start;

reg signed [7:0] feature;
reg signed [7:0] weight;

wire signed [7:0] cnn_output;

wire done;

//----------------------------------------
// DUT
//----------------------------------------

cnn_top DUT(

.clk(clk),
.rst(rst),
.start(start),

.feature(feature),
.weight(weight),

.cnn_output(cnn_output),

.done(done)

);

//----------------------------------------

always #5 clk = ~clk;

//----------------------------------------

initial
begin

clk = 0;

rst = 1;

start = 0;

feature = 0;

weight = 0;

#20;

rst = 0;

start = 1;

feature = 8'd10;

weight = 8'd5;

#20;

feature = 8'd12;

weight = 8'd4;

#20;

feature = -8'd8;

weight = 8'd7;

#20;

feature = 8'd15;

weight = -8'd2;

#100;

$finish;

end

//----------------------------------------

initial
begin

$monitor(

"Time=%0t Feature=%d Weight=%d Output=%d",

$time,

feature,

weight,

cnn_output

);

end

endmodule
