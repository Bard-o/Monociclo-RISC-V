`timescale 1ns/1ps
module tb_alu;
  logic [31:0] a, b;
  logic [4:0] alu_op;
  wire [31:0] alu_res;

  localparam ADD  = 5'b00000;
  localparam SUB  = 5'b00001;
  localparam SLL  = 5'b00010;
  localparam SLT  = 5'b00011;
  localparam SLTU = 5'b00100;
  localparam XOR_ = 5'b00101;
  localparam SRL  = 5'b00110;
  localparam SRA  = 5'b00111;
  localparam OR_  = 5'b01000;
  localparam AND_ = 5'b01001;

  alu dut(.a(a), .b(b), .alu_op(alu_op), .alu_res(alu_res));

  initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, tb_alu);

    a = 32'h00000010; b = 32'h00000003; alu_op = ADD;  #10; $display("ADD a=%h b=%h res=%h", a, b, alu_res);
    a = 32'h00000010; b = 32'h00000003; alu_op = SUB;  #10; $display("SUB a=%h b=%h res=%h", a, b, alu_res);
    a = 32'h00000010; b = 32'h00000003; alu_op = SLL;  #10; $display("SLL a=%h b=%h res=%h", a, b, alu_res);
    a = 32'h80000000; b = 32'h0000001F; alu_op = SRL;  #10; $display("SRL a=%h b=%h res=%h", a, b, alu_res);
    a = 32'h80000000; b = 32'h0000001F; alu_op = SRA;  #10; $display("SRA a=%h b=%h res=%h", a, b, alu_res);
    a = 32'h0000000F; b = 32'h000000F0; alu_op = XOR_; #10; $display("XOR a=%h b=%h res=%h", a, b, alu_res);
    a = 32'h0000000F; b = 32'h000000F0; alu_op = OR_;  #10; $display("OR  a=%h b=%h res=%h", a, b, alu_res);
    a = 32'h0000000F; b = 32'h000000F0; alu_op = AND_; #10; $display("AND a=%h b=%h res=%h", a, b, alu_res);
    a = 32'hFFFF_FFFF; b = 32'h0000_0001; alu_op = SLT;  #10; $display("SLT a=%h b=%h res=%h", a, b, alu_res);
    a = 32'h0000_0001; b = 32'hFFFF_FFFF; alu_op = SLTU; #10; $display("SLTU a=%h b=%h res=%h", a, b, alu_res);

    #10 $finish;
  end
endmodule
