module multiplier (
    input  logic [31:0] R1,
    input  logic [31:0] R2,
    input  logic [2:0]  funct3,
    output logic [31:0] MulResult
);

    // Widened operands (explicit, avoids SV sizing surprises)
    logic signed [63:0] a_s;
    logic signed [63:0] b_s;
    logic        [63:0] a_u;
    logic        [63:0] b_u;

    logic signed [63:0] prod_ss;  // signed*signed
    logic signed [63:0] prod_su;  // signed*unsigned (result treated as signed for slicing)
    logic        [63:0] prod_uu;  // unsigned*unsigned

    always_comb begin
        // Explicit widening
        a_s = $signed({{32{R1[31]}}, R1});   // sign-extend R1 to 64
        b_s = $signed({{32{R2[31]}}, R2});   // sign-extend R2 to 64
        a_u = {{32{1'b0}}, R1};              // zero-extend R1 to 64
        b_u = {{32{1'b0}}, R2};              // zero-extend R2 to 64

        // Products
        prod_ss = a_s * b_s;
        prod_su = a_s * $signed(b_u);        // b_u is non-negative, cast is safe
        prod_uu = a_u * b_u;

        // Default
        MulResult = 32'b0;

        unique case (funct3)
            3'b000: MulResult = prod_ss[31:0];   // mul
            3'b001: MulResult = prod_ss[63:32];  // mulh
            3'b010: MulResult = prod_su[63:32];  // mulhsu
            3'b011: MulResult = prod_uu[63:32];  // mulhu
            default: MulResult = 32'b0;
        endcase
    end
endmodule
