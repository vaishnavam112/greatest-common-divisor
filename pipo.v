`timescale 1ns / 1ps
module pipo(
    input [15:0]data_in,
    input load, clk,
    output reg [15:0]data_out
    );
    
    always@(clk)
    begin
    if(load)
      data_out <= data_in;
    end
endmodule
