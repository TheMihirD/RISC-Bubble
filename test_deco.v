`include "cpu.v"
`timescale 1ns/1ns
module testbench;
  
  reg[15:0] pc;
  wire[15:0] pc_out;
  reg clk;
  wire[31:0] rs,rt,rd;
  cpu cp(pc,clk,pc_out,rs,rt,rd);
  initial begin
   clk = 0;
  end
  always begin
    #5 clk=~clk;
  end
  initial begin
    $dumpfile("dmp.vcd");
    $dumpvars(0,testbench);
  pc = 0; //add
  #40;
  pc=1; //sub
  #20;
  pc=6; //and
  #20;
  pc=10; //sll
  #20;
  pc=14; //beq

   
   #80;
    $finish;
    
  
  end
  

  
  
  
  
  

endmodule