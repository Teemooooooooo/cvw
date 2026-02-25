

module cmp(
    input  logic [31:0] R1, R2,
    input  logic        unsignedCmp,   // Funct3[1]: 0=signed (BLT/BGE), 1=unsigned (BLTU/BGEU)
    output logic        Eq, Lt
);
    logic [31:0] Sum;
    logic        Overflow, Neg;

    assign Sum      = R1 - R2;
    assign Overflow = (R1[31] ^ R2[31]) & (R1[31] ^ Sum[31]);
    assign Neg      = Sum[31];

    // signed: (Neg ^ Overflow), unsigned: normal magnitude compare
    assign Lt = unsignedCmp ? (R1 < R2) : (Neg ^ Overflow);

    assign Eq = (R1 == R2);
endmodule
