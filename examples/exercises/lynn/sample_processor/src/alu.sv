module alu(
    input  logic [31:0] SrcA, SrcB,
    input  logic [1:0]  ALUControl,
    input  logic [2:0]  Funct3,
    input  logic [6:0]  Funct7, Op,
    output logic [31:0] ALUResult, IEUAdr
);

    logic [31:0] CondInvb, Sum, SLT;
    logic [31:0] AddSum;
    logic       ALUOp, Sub, Overflow, Neg, LT;
    logic [2:0]  ALUFunct;


    assign {Sub, ALUOp} = ALUControl;

    // Always-add path for addresses/targets
    assign AddSum = SrcA + SrcB;
    assign IEUAdr = AddSum;

    // Add/sub path for ALUResult when needed
    assign CondInvb = Sub ? ~SrcB : SrcB;
    assign Sum      = SrcA + CondInvb + {{31{1'b0}}, Sub};

    // SLT (signed) based on subtraction result
    assign Overflow = Sub &
                  (SrcA[31] ^ SrcB[31]) &
                  (SrcA[31] ^ Sum[31]);
    assign Neg      = Sum[31];
    assign LT       = Neg ^ Overflow;
    assign SLT      = {31'b0, LT};

    assign ALUFunct = Funct3 & {3{ALUOp}};

    always_comb begin
        case (ALUFunct)
            3'b000: ALUResult = Sum;
            3'b010: ALUResult = SLT;
            3'b100: ALUResult = SrcA ^ SrcB;
            3'b110: ALUResult = SrcA | SrcB;
            3'b111: ALUResult = SrcA & SrcB;
            3'b001: ALUResult = SrcA << SrcB[4:0];
            3'b011: ALUResult = {31'b0, (SrcA < SrcB)};  // SLTU (unsigned)
            3'b101: begin
                if (Funct7[5]) begin
                    // SRA: manual sign-fill (no reliance on >>>)
                    if (SrcB[4:0] == 0)
                        ALUResult = SrcA;
                    else
                        ALUResult = (SrcA >> SrcB[4:0]) |
                            ({32{SrcA[31]}} << (32 - SrcB[4:0]));
                    end else begin
                        // SRL
                        ALUResult = (SrcA >> SrcB[4:0]);
                    end
                end
            default: ALUResult = '0; // (use 0 instead of 'x to avoid X-prop)
        endcase


    end

endmodule
