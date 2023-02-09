//`include "mul.sv"
  `include "div.sv"
//`include "add.sv"
//`include "sub.sv"
module top;
  reg [15:0]rs1,rs2;
  wire [15:0]add_rd,sub_rd,mul_rd,div_rd;

  
 //  add add_dut(rs1,rs2,add_rd); 
 //  sub sub_dut(rs1,rs2, sub_rd);
 //  mul mul_dut(rs1,rs2,mul_rd);
  div div_dut(rs1,rs2,div_rd);
  initial begin
    repeat(1)begin
      rs1=12;
      rs2=12;
      #1;
      //  $display("rs1=%b, rs2=%b, add_rd=%b  ", rs1,rs2,add_rd); 
     //   $display("rs1=%d, rs2=%d, sub_rd=%d  ", rs1,rs2,sub_rd); 
     //   $display("rs1=%d, rs2=%d, mul_rd=%d  ", rs1,rs2,mul_rd);
          $display("rs1=%d, rs2=%d, div_rd=%d  ", rs1,rs2,div_rd);
      
    end
    
  end
  
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(1);
  end
  
endmodule


  
