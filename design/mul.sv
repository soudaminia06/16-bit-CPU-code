// Full Adder module
module full_adder #(parameter N=16)
  (
    input [N-1:0] A,
    input [N-1:0] B,
    output [N-1:0] O
  );
  
  // Add inputs A and B to get output O
  assign  O = A + B;
  
endmodule

// Multiplier module
module MUL #(parameter N=16)
  (
    input [N-1:0] A,
    input [N-1:0] B,
    output [2*N-1:0] O
  );
  
  // Temporary arrays to store intermediate values
  wire [N][N-1:0] temp1;
  wire [N][2*N-1:0] temp2;
  wire [N][2*N-1:0] temp3;
  
  // Initialize the first bit of the intermediate values
  assign temp1[0] = (B[0]) ? A : 0;
  assign temp2[0] = temp1[0] << 0;
  assign temp3[0] = temp2[0];
  
  // Loop through each bit of B
  genvar i;
  generate
    for (i=1; i<=N-1; i++)
    begin
      // Calculate intermediate values based on the current bit of B
      assign temp1[i] = (B[i]) ? A : 0;
      assign temp2[i] = temp1[i] << i;
      
      // Use full_adder module to add intermediate values
      full_adder #(2*N) fa(
        .A(temp3[i-1]),
        .B(temp2[i]),
        .O(temp3[i])
      );
    end
  endgenerate
  
  // Assign final output to the last element of temp3
  assign O = temp3[N-1];
  
endmodule

