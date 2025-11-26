module branch_unit(
    input  wire [31:0] ru_X1,
    input  wire [31:0] ru_X2,
    input  wire [4:0]  BrOp,
    output reg         branch_taken
);
    localparam BR_NOP = 5'b00000;
    localparam BR_EQ  = 5'b00001;
    localparam BR_NE  = 5'b00010;
    localparam BR_LT  = 5'b00011;
    localparam BR_GE  = 5'b00100;
    localparam BR_LTU = 5'b00101;
    localparam BR_GEU = 5'b00110;

    wire is_equal       = (ru_X1 == ru_X2);
    wire is_not_equal   = (ru_X1 != ru_X2);
    wire is_lt_signed   = ($signed(ru_X1) <  $signed(ru_X2));
    wire is_ge_signed   = ($signed(ru_X1) >= $signed(ru_X2));
    wire is_lt_unsigned = (ru_X1 <  ru_X2);
    wire is_ge_unsigned = (ru_X1 >= ru_X2);

    always @(*) begin
        case (BrOp)
            BR_EQ:  branch_taken = is_equal;
            BR_NE:  branch_taken = is_not_equal;
            BR_LT:  branch_taken = is_lt_signed;
            BR_GE:  branch_taken = is_ge_signed;
            BR_LTU: branch_taken = is_lt_unsigned;
            BR_GEU: branch_taken = is_ge_unsigned;
            default: branch_taken = 1'b0;
        endcase
    end
endmodule
