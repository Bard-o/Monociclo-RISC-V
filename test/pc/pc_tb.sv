`timescale 1ns/1ps
module tb_pc;
  logic clk;
  logic rst_n;
  logic [31:0] next_pc;
  wire  [31:0] address;

  pc dut(.clk(clk), .rst_n(rst_n), .next_pc(next_pc), .address(address));
  
  initial begin
    $dumpfile("test/pc/pc_tb.vcd");
    $dumpvars(0, tb_pc);
    clk=0; rst_n=0; next_pc=32'h00000000;
    #12 rst_n=1;
    repeat (5) begin
      @(negedge clk);
      next_pc = address + 32'd4;
      @(posedge clk);
      $display("t=%0t address=%h next_pc=%h", $time, address, next_pc);
    end
    @(negedge clk);
    rst_n=0;
    @(posedge clk);
    $display("t=%0t address=%h rst", $time, address);
    rst_n=1;
    @(negedge clk);
    next_pc = 32'd4;
    @(posedge clk);
    $display("t=%0t address=%h next_pc=%h", $time, address, next_pc);
    #20 $finish;
  end

  always #5 clk = ~clk;
endmodule
