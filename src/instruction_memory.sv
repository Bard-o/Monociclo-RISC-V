module instruction_memory(
	input  logic [31:0] address,
	output logic [31:0] inst
);

	logic [31:0] mem[0:31];
	initial begin
    mem[0]  = 32'h01000093; // addi x1,x0,0x10
    mem[1]  = 32'h00400193; // addi x3,x0,0x04
    mem[2]  = 32'h00308233; // add  x4,x1,x3
    mem[3]  = 32'h003212B3; // sll  x5,x4,x3
    mem[4]  = 32'h0050A023; // sw   x5,0(x1)
    mem[5]  = 32'h0000A303; // lw   x6,0(x1)
    mem[6]  = 32'h0000C383; // lbu  x7,0(x1)
    mem[7]  = 32'h0FF00413; // addi x8,x0,0xFF
    mem[8]  = 32'h008080A3; // sb   x8,1(x1)
    mem[9]  = 32'h00108503; // lb   x10,1(x1)
    mem[10] = 32'h0010C583; // lbu  x11,1(x1)
    mem[11] = 32'h006474B3; // and  x9,x8,x6
	end
	assign inst = mem[address[9:2]];

endmodule
