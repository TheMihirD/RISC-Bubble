module instruction_fetch(input wire [15:0] mem_addr, output reg[31:0] ins, input clk );
reg [31:0]ins_address[31:0];


initial begin
  ins_address[0] = {6'b000000,5'b00001,5'b00010,5'b00000,5'b00000,6'b100000};  //add
  ins_address[1] = {6'b000000,5'b00001,5'b00010,5'b00000,5'b00000,6'b100010};  //sub
  ins_address[2] = {6'b000000,5'b00001,5'b00010,5'b00000,5'b00000,6'b100001}; //addu
  ins_address[3] = {6'b000000,5'b00001,5'b00010,5'b00000,5'b00000,6'b100011}; //subu
  ins_address[4] = {6'b000010,5'b00001,5'b00000,16'd1000}; //addi
  ins_address[5] = {6'b000001,5'b00001,5'b00000,16'd1000}; //addiu
  ins_address[6] = {6'b001100,5'b00001,5'b00010,5'b00000,5'b00000,6'b100100}; //and
  ins_address[7] = {6'b001100,5'b00001,5'b00010,5'b00000,5'b00000,6'b100101}; //or
  ins_address[8] = {6'b001101,5'b00001,5'b00000,16'd1000};//andi
  ins_address[9] = {6'b001011,5'b00001,5'b00000,16'd1000};//ori
  ins_address[10] = {6'b001111,5'b00001,5'b00010,5'b00000,5'd10,6'b000000};  //sll
  ins_address[11] = {6'b001010,5'b00001,5'b00000,5'b00000,5'd10,6'b000010};  //srl
  ins_address[12] = {6'b100001,5'b00001,5'b00000,16'd10};  //lw
  ins_address[13] = {6'b100000,5'b00001,5'b00000,16'd10}; //sw
  ins_address[14] = {6'b010100,5'b00001,5'b00000,16'd10};  //beq
  ins_address[15] = {6'b010101,5'b00001,5'b00000,16'd10}; //bne
  ins_address[16] = {6'b010111,5'b00001,5'b00000,16'd10}; //bgt
  ins_address[17] = {6'b010001,5'b00001,5'b00000,16'd10}; //bgte
  ins_address[18] = {6'b010011,5'b00001,5'b00000,16'd10}; //ble
  ins_address[19] = {6'b010101,5'b00001,5'b00000,16'd10}; //bleq
  ins_address[20] = {6'b111101,26'd10}; //j
  ins_address[21] =  {6'b111111,5'b00000,5'b00000,5'b00000,5'b00000,6'b001000};//jr
  ins_address[22] =  {6'b111110,5'b00000,5'b00000,5'b00000,5'b00000,6'b001001};//jal
  ins_address[23] =  {6'b101000,5'b00001,5'b00010,5'b00000,5'b00000,6'b101010};//slt
  ins_address[24] =  {6'b101001,5'b00001,5'b00000,16'd100};//slti

  



end
always@(posedge clk)begin
ins = ins_address[mem_addr];
end

endmodule