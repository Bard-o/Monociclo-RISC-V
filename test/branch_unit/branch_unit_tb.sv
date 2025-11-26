`timescale 1ns/1ps
module tb_branch_unit;
  logic [31:0] ru_X1, ru_X2;
  logic [4:0]  BrOp;
  wire         branch_taken;

  localparam BR_NOP = 5'b00000;
  localparam BR_EQ  = 5'b00001;
  localparam BR_NE  = 5'b00010;
  localparam BR_LT  = 5'b00011;
  localparam BR_GE  = 5'b00100;
  localparam BR_LTU = 5'b00101;
  localparam BR_GEU = 5'b00110;

  branch_unit dut(.ru_X1(ru_X1), .ru_X2(ru_X2), .BrOp(BrOp), .branch_taken(branch_taken));

  initial begin
    $dumpfile("test/branch_unit/branch_unit_tb.vcd");
    $dumpvars(0, tb_branch_unit);

    ru_X1 = 32'd10; ru_X2 = 32'd10; BrOp = BR_EQ;  #1; $display("BR_EQ X1=%h X2=%h taken=%b", ru_X1, ru_X2, branch_taken);
    ru_X1 = 32'd10; ru_X2 = 32'd11; BrOp = BR_EQ;  #1; $display("BR_EQ X1=%h X2=%h taken=%b", ru_X1, ru_X2, branch_taken);
    ru_X1 = 32'd10; ru_X2 = 32'd11; BrOp = BR_NE;  #1; $display("BR_NE X1=%h X2=%h taken=%b", ru_X1, ru_X2, branch_taken);

    ru_X1 = 32'hFFFF_FFFF; ru_X2 = 32'h0000_0001; BrOp = BR_LT;  #1; $display("BR_LT X1=%h X2=%h taken=%b", ru_X1, ru_X2, branch_taken);
    ru_X1 = 32'hFFFF_FFFF; ru_X2 = 32'h0000_0001; BrOp = BR_GE;  #1; $display("BR_GE X1=%h X2=%h taken=%b", ru_X1, ru_X2, branch_taken);

    ru_X1 = 32'h0000_0001; ru_X2 = 32'hFFFF_FFFF; BrOp = BR_LTU; #1; $display("BR_LTU X1=%h X2=%h taken=%b", ru_X1, ru_X2, branch_taken);
    ru_X1 = 32'hFFFF_FFFF; ru_X2 = 32'h0000_0001; BrOp = BR_GEU; #1; $display("BR_GEU X1=%h X2=%h taken=%b", ru_X1, ru_X2, branch_taken);

    #5 $finish;
  end
endmodule
