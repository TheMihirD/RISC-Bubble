`include "ins_fetch.v"
`include "opcode.v"
`include "ALU.v"


module cpu(pc,clk,pc_out,rs,rt,rd);
input [15:0] pc;
input clk;
wire[31:0] ins;
output reg[15:0] pc_out;
output reg[31:0] rs,rt;
output wire[31:0] rd;
wire[2:0] data_pth;
wire[2:0] type;
wire zero;
reg[31:0] data_memory[31:0];
reg[4:0] shamt;
reg[15:0] offset;
integer  i;
reg jump;
    initial begin
    for(i=0;i<32;i=i+1)begin
      data_memory[i]<=1;
    end
    end
    
   instruction_fetch inf(pc,ins,clk);

   op_decode op(ins,data_pth,type,clk);
   always@(posedge clk) begin
    if(ins[31:26]==0 || ins[31:26]==12)begin
    
    rs<=data_memory[ins[25:21]][31:0];
    rt<=data_memory[ins[20:16]][31:0];
    jump<=0;
    

    end
    else if(ins[31:26]<=2)begin
    
    rs<=data_memory[ins[25:21]][31:0];
    jump<=0;
    rt<={16'd0,ins[15:0]};
    end
    else if(ins[31:26]==15)begin
       rs<=data_memory[ins[25:21]][31:0];
    
       jump<=0;

    shamt<= ins[10:6];
    end
    else if(ins[31:26]==10)begin
       rs<=data_memory[ins[25:21]][31:0];
       jump<=0;
    

    shamt<= ins[10:6];
    end
    else if(type==7)begin
      rs<=data_memory[ins[25:21]][31:0];
      rt<=data_memory[ins[20:16]][31:0];
      if(rs==rt)begin
         jump<=1;
      end
      
    end
    else if(type==8)begin
      rs<=data_memory[ins[25:21]][31:0];
      rt<=data_memory[ins[20:16]][31:0];
      if(rs!=rt)begin
         jump<=1;
    end


   end
end
   alu al(rs,rt,type,rd,zero,shamt,clk);

   always@(posedge clk)begin
      if(type!=7)begin
     data_memory[ins[15:10]][31:0]<=rd;
      end
      else begin
         if(jump==1 && zero==1)begin
            offset<= (ins[15:0]<<2);
            pc_out = pc + offset;
         end
      end
   end


endmodule