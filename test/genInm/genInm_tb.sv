`timescale 1ns/1ps
module tb_genInm;
  logic [31:0] instr;
  logic [2:0] IMMSrc;
  wire  [31:0] imm_out;

  localparam IARITH_LOAD = 3'b000;
  localparam STORE_TYPE  = 3'b001;
  localparam BRANCH_TYPE = 3'b101;

  genInm dut(.instr(instr), .IMMSrc(IMMSrc), .imm_out(imm_out));

  function automatic [31:0] enc_i(input [11:0] imm12);
    enc_i = 32'b0;
    enc_i[31:20] = imm12;
  endfunction

  function automatic [31:0] enc_s(input [11:0] imm12);
    enc_s = 32'b0;
    enc_s[31:25] = imm12[11:5];
    enc_s[11:7]  = imm12[4:0];
  endfunction

  function automatic [31:0] enc_b(input [12:0] imm13);
    enc_b = 32'b0;
    enc_b[31]    = imm13[12];
    enc_b[7]     = imm13[11];
    enc_b[30:25] = imm13[10:5];
    enc_b[11:8]  = imm13[4:1];
  endfunction

  initial begin
    $dumpfile("test/genInm/genInm_tb.vcd");
    $dumpvars(0, tb_genInm);

    IMMSrc = IARITH_LOAD; instr = enc_i(12'h7FF); #1; $display("I imm=0x%h out=%h", instr[31:20], imm_out);
    IMMSrc = IARITH_LOAD; instr = enc_i(12'hFFF); #1; $display("I imm=0x%h out=%h", instr[31:20], imm_out);

    IMMSrc = STORE_TYPE;  instr = enc_s(12'h123); #1; $display("S imm=0x%h out=%h", 12'h123, imm_out);
    IMMSrc = STORE_TYPE;  instr = enc_s(12'hFFF); #1; $display("S imm=0x%h out=%h", 12'hFFF, imm_out);

    IMMSrc = BRANCH_TYPE; instr = enc_b(13'd8);   #1; $display("B imm=%0d out=%h", 13'd8, imm_out);
    IMMSrc = BRANCH_TYPE; instr = enc_b(13'd16);  #1; $display("B imm=%0d out=%h", 13'd16, imm_out);

    #5 $finish;
  end
endmodule
