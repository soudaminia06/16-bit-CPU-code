module add(rs1, rs2, add_rd,co);
  parameter N = 16;
  input [N-1:0] rs1, rs2;
  output reg [N-1:0] add_rd;
  output reg [N-1:0] co;

  always@(*) begin
    add_rd = rs1 + rs2;
    co = (rs1 + rs2) >> N;
  end
endmodule



/*This code uses the always_comb block and the + operator to perform the addition of the rs1_reg and rs2_reg inputs and store the result in add_rd. The co output is calculated by right shifting the sum by N bits to determine if there was an overflow.*/
