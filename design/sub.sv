module sub(rs1, rs2, sub_rd);
  parameter N = 16;
  input [N-1:0] rs1, rs2;
  output reg [N-1:0] sub_rd;

  always_comb begin
    sub_rd = rs1 - rs2;
  end
endmodule

