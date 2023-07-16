

module op_decode(
    input wire[31:0] ins,
    
    output reg[2:0] data_path,
    output reg[2:0] type,
    input clk
);





always@(posedge clk)begin
  
  if(ins[31:26]<6'd3)begin
    data_path<=1;  //arithmetic
    if(ins[5:0]==34 || ins[5:0]==35)begin
    type<= 1; //sub,subu
    end
    else begin
    type<= 0; //addi,add,addu,addiu
    end
  end
  else if(ins[31:26]<6'd16 && ins[31:26]>=6'd8)begin
    data_path<=2;  //logical
    if(ins[5:0]==36 || ins[31:26]==13)begin
    type<= 2;
    end
    else if(ins[31:26]==15)begin
    type<= 4;
    end
    else if(ins[31:26]==10)begin
    type<=5;
    end
    else begin
    type<=3;
    end

  end
  else if(ins[31:26]==6'd40 || ins[31:26]==6'd41)begin
    data_path<=3;   //meomory
  end
  else if(ins[31:26]==6'd32 || ins[31:26]==6'd33)begin
    data_path<=4;    //comparator
    type<=6;
  end
  else if(ins[31:26]>6'd50)begin
    data_path<=5;    //jump
  end
  else begin
    data_path<=6;    //branching
    if(ins[31:26]==20) begin
      type<= 7;   //beq

    end
    else if(ins[31:26]==21)begin
      type<=8;  //bne
    end
    else if(ins[31:26]==23)begin
      type<=9; //bgt
    end
  end




end




endmodule
