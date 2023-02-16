module comparator(
  input [31:0] a,
  input [31:0] b,
  output reg eq,
  output reg lt
);

always @(a or b) begin
  eq = (a == b);
  lt = (a < b);
end

endmodule

/*module divider(
  input clk,
  input rst,
  input en,
  input [31:0] divide_by,
  output reg div_out
);

reg [31:0] counter = 0;
comparator comp (
  .a(counter),
  .b(divide_by),
  .eq(div_out),
  .lt(counter_next)
);

always @(posedge clk) begin
  if (rst) begin
    counter <= 0;
  end else if (en) begin
    if (counter_next) begin
      counter <= counter + 1;
    end
  end
end

endmodule

