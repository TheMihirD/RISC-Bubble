module alu(arg1,arg2,func_code,out,zero,shamt,clk);
input wire[31:0] arg1,arg2;
input wire[2:0] func_code;
output reg[31:0] out;
output reg zero;
input clk;
input wire[4:0] shamt;
reg jump;
always@(posedge clk) begin
case(func_code)
  0: begin
  out <= arg1 + arg2;
  zero <= 0;   //add,addi,addu,addiu, lw, sw
  end
  1: begin
  out <= arg1 - arg2;  //sub,subu
  zero<= 0;
  end
  2: begin
  out <= arg1 & arg2;  //and,andi
  zero<=0;
  end
  3: begin
  out <= arg1 || arg2;  //or,ori
  zero<=0;
  end
  4: begin
  out <= (arg1<<shamt); //sll
  zero<=0;
  end
  5: begin
  out <= (arg1>>shamt); //srl
  zero<= 0;
  end
  6: begin             //slt,slti
    if(arg1<arg2)begin
    out<=1;
    zero<=0;
    end
    else begin
    out<=0;
    zero<=0;
    end
  end
  7: begin
    zero<=1;
  end
  8: begin
    zero<=1;
  end


  endcase
end
endmodule