`timescale 1ns / 1ps
module mux(
    input [15:0]in0,in1,
    input sel, 
    output [15:0] mux_out
    );
    assign mux_out = sel? in1: in0;
endmodule
