module full_adder #(parameter N=1)
  (
    input [N-1:0] A,
    input [N-1:0] B,
    input [1:0] Cin,
    output [N-1:0] S,
    output [1:0] Cout
  );
  
  // Generate sum and carry-out signals
  assign S = A ^ B ^ Cin[0];
  assign Cout = (A & B) | (Cin[0] & (A ^ B));
  
endmodule

// Multiplier module
module MUL #(parameter N=1)
  (
    input [N-1:0] A,
    input [N-1:0] B,
    input clk,
    output [2*N-1:0] O
  );
  
  // Temporary arrays to store intermediate values
  wire [N-1:0] temp1;
  wire [2*N-1:0] temp2;
  wire [1:0] Cout;
  
  always @(posedge clk) begin
    // Calculate intermediate values based on the current bit of B
  assign  temp1 = (B[0]) ? A : 0;
   assign  temp2 = {temp1, {2*N-1{1'b0}}};
    
    // Loop through each bit of B
    genvar i;
    generate 
    for (i=1; i<N; i++) begin
      // Use full_adder module to add intermediate values
      full_adder fa(
        .A(temp2[2*i-1-:2]),
        .B(temp1),
        .Cin(Cout),
        .S(temp2[2*i-1-:2]),
        .Cout(Cout)
      );
      
      // Calculate intermediate values based on the current bit of B
   assign   temp1 = (B[i]) ? A : 0;
    assign  temp2 = {temp2[2*i-1-:2], {2*(N-i)-1{1'b0}}};
    end
    endgenerate
    
    // Assign final output to the last element of temp2
  assign  O = temp2;
  end
  
endmodule

