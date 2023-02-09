// Full Adder module
module full_adder #(parameter N=16)
  (
    input [N-1:0] rs1,
    input [N-1:0] rs2,
    output [N-1:0] mul_rd
  );
  
  // Add inputs rs1 and rs2 to get output mul_rd
  assign  mul_rd = rs1 + rs2;
  
endmodule

// Multiplier module
module mul #(parameter N=16)
  (
    input [N-1:0] rs1,
    input [N-1:0] rs2,
    output [2*N-1:0] mul_rd
  );
  
  // Temporary arrays to store intermediate values
  wire [N][N-1:0] temp1;
  wire [N][2*N-1:0] temp2;
  wire [N][2*N-1:0] temp3;
  
  // Initialize the first bit of the intermediate values
  assign temp1[0] = (rs2[0]) ? rs1 : 0;
  assign temp2[0] = temp1[0] << 0;
  assign temp3[0] = temp2[0];
  
  // Loop through each bit of rs2
  genvar i;
  generate
    for (i=1; i<=N-1; i++)
    begin
      // Calculate intermediate values based on the current bit of rs2
      assign temp1[i] = (rs2[i]) ? rs1 : 0;
      assign temp2[i] = temp1[i] << i;
      
      // Use full_adder module to add intermediate values
      full_adder #(2*N) fa(
        .rs1(temp3[i-1]),
        .rs2(temp2[i]),
        .mul_rd(temp3[i])
      );
    end
  endgenerate
  
  // Assign final output to the last element of temp3
  assign mul_rd = temp3[N-1];
  
endmodule
