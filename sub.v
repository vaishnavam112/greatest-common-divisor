`timescale 1ns / 1ps
module sub(
    input [15:0]in1,in2,
    output reg [15:0]out
    );
    always@(*)
        out = in1 - in2;
endmodule
