`timescale 1ns / 1ps
module tb_gcd_test( );
reg [15:0]data_in;
reg clk,start;
wire done;
reg [15:0]A,B;

gcd_datapath DP(.gt(gt),.lt(lt), .eq(eq), .ldA(ldA), .ldB(ldB), .clk(clk),
                .sel1(sel1), .sel2(sel2), .sel_in(sel_in), .data_in(data_in));
                
controller CON(.ldA(ldA), .ldB(ldB), .sel1(sel1), .sel2(sel2), 
               .sel_in(sel_in), .done(done), .clk(clk), .lt(lt),
               .gt(gt), .eq(eq), .start(start));                
                
  always #5 clk= ~clk;
  
  initial
  begin
  #12
  data_in=16'h143;
  #10
  data_in=16'h78;
  #50
  data_in=15'h9;
  end           
  
  initial
  begin
  $monitor($time, "%d %b", DP.Aout, done);
  $dumpfile("god.vcd");
  //$dumpvars(0,gcd_test);
  
  end   

endmodule
