module full_subtractor #(parameter N=16)
  (
    input [N-1:0] A,
    input [N-1:0] B,
    output [N-1:0] Diff,
    output Borrow
  );
  
  wire [N-1:0] temp;
  
  assign temp = A - B;
  assign Diff = temp;
  assign Borrow = (A < B); //result of a comparison of A and B using the less than operator A < B
  
endmodule

module divider#(parameter N=16)( 
  input [N-1:0] Dividend,
  input [N-1:0] Divisor,
  output reg [N-1:0] Quotient,
  output reg [N-1:0] Remainder
);
  
  reg [N-1:0] temp_remainder;
  reg [N-1:0] current_dividend;
  wire Quotient_bit;
  
  initial begin
    temp_remainder = Dividend;
    Quotient = 0;
  end
  
  genvar i;
  
  generate
    for(i=N-1; i>=0; i=i-1)begin
      current_dividend = {temp_remainder[N-1:i], Quotient[i-1:0]};
   //   current_dividend = {temp_remainder[N-1:i], Quotient[i-1:0]};
      full_subtractor#(N) fs(
        .A(current_dividend),
        .B(Divisor),
        .Diff(temp_remainder),
        .Borrow(Quotient_bit)
      );
      assign Quotient[i] = Quotient_bit;
    end
  endgenerate

  assign Remainder = temp_remainder;
  
endmodule

