`timescale 1ns / 1ps
module gcd_datapath(
    input ldA, ldB, sel1, sel2, sel_in, clk,
    input [15:0]data_in,
    output gt,lt,eq
    );
    wire [15:0]Aout,Bout,x,y,Bus,Subout;
    
    pipo A(.data_out(Aout), .data_in(Bus) ,.load(ldA), .clk(clk));
    pipo B(.data_out(Bout), .data_in(Bus), .load(ldB), .clk(clk));
    mux mux_in1(.mux_out(x), .in0(Aout), .in1(Bout), .sel(sel1));
    mux mux_in2(.mux_out(y), .in0(Subout), .in1(data_in), .sel(sel_in));
    mux load(.mux_out(Bus), .in0(Subout), .in1(data_in), .sel(sel_in));
    sub SB(.out(Subout), .in1(x), .in2(y));
    compare comp(.lt(lt), .gt(gt), .eq(eq), .data1(Aout), .data2(Bout));
    
endmodule
